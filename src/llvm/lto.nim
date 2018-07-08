type
  LtoBoolT* = bool

const
  LTO_API_VERSION* = 21

type
  LtoSymbolAttributes* = enum
    LTO_SYMBOL_ALIGNMENT_MASK = 0x0000001F, ##  log2 of alignment
    LTO_SYMBOL_PERMISSIONS_RODATA = 0x00000080,
    LTO_SYMBOL_PERMISSIONS_CODE = 0x000000A0,
    LTO_SYMBOL_PERMISSIONS_DATA = 0x000000C0,
    LTO_SYMBOL_PERMISSIONS_MASK = 0x000000E0,
    LTO_SYMBOL_DEFINITION_REGULAR = 0x00000100,
    LTO_SYMBOL_DEFINITION_TENTATIVE = 0x00000200,
    LTO_SYMBOL_DEFINITION_WEAK = 0x00000300,
    LTO_SYMBOL_DEFINITION_UNDEFINED = 0x00000400,
    LTO_SYMBOL_DEFINITION_WEAKUNDEF = 0x00000500,
    LTO_SYMBOL_DEFINITION_MASK = 0x00000700,
    LTO_SYMBOL_SCOPE_INTERNAL = 0x00000800, LTO_SYMBOL_SCOPE_HIDDEN = 0x00001000,
    LTO_SYMBOL_SCOPE_DEFAULT = 0x00001800, LTO_SYMBOL_SCOPE_PROTECTED = 0x00002000,
    LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = 0x00002800,
    LTO_SYMBOL_SCOPE_MASK = 0x00003800, LTO_SYMBOL_COMDAT = 0x00004000,
    LTO_SYMBOL_ALIAS = 0x00008000

  LtoDebugModel* = enum
    LTO_DEBUG_MODEL_NONE = 0, LTO_DEBUG_MODEL_DWARF = 1

  LtoCodegenModel* = enum
    LTO_CODEGEN_PIC_MODEL_STATIC = 0, LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1,
    LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2, LTO_CODEGEN_PIC_MODEL_DEFAULT = 3


  ## opaque reference to a loaded object module
  LtoModuleT* = ptr LLVMOpaqueLTOModule

  ## opaque reference to a code generator
  LtoCodeGenT* = ptr LLVMOpaqueLTOCodeGenerator

  ## opaque reference to a thin code generator
  ThinltoCodeGenT* = ptr LLVMOpaqueThinLTOCodeGenerator

##  Returns a printable string.
proc ltoGetVersion*(): cstring

##  Returns the last error string or NULL if last operation was successful.
proc ltoGetErrorMessage*(): cstring

##  Checks if a file is a loadable object file.
proc ltoModuleIsObjectFile*(path: cstring): LtoBoolT

##  Checks if a file is a loadable object compiled for requested target.
proc ltoModuleIsObjectFileForTarget*(path: cstring; targetTriplePrefix: cstring): LtoBoolT

##  Return true if \p Buffer contains a bitcode file with ObjC code (category
##  or class) in it.
proc ltoModuleHasObjcCategory*(mem: pointer; length: csize): LtoBoolT

##  Checks if a buffer is a loadable object file.
proc ltoModuleIsObjectFileInMemory*(mem: pointer; length: csize): LtoBoolT

##  Checks if a buffer is a loadable object compiled for requested target.
proc ltoModuleIsObjectFileInMemoryForTarget*(mem: pointer; length: csize;
    targetTriplePrefix: cstring): LtoBoolT

##  Loads an object file from disk.
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreate*(path: cstring): LtoModuleT

##  Loads an object file from memory.
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreateFromMemory*(mem: pointer; length: csize): LtoModuleT

##  Loads an object file from memory with an extra path argument.
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreateFromMemoryWithPath*(mem: pointer; length: csize; path: cstring): LtoModuleT

##  Loads an object file in its own LLVMContext.  This function call is
##  thread-safe.  However, modules created this way should not be merged into an
##  lto_code_gen_t using \a lto_codegen_add_module().
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreateInLocalContext*(mem: pointer; length: csize; path: cstring): LtoModuleT

##  Loads an object file into the same context as \c cg.  The module is safe to
##  add using lto_codegen_add_module().
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreateInCodegenContext*(mem: pointer; length: csize; path: cstring;
                                     cg: LtoCodeGenT): LtoModuleT

##  Loads an object file from disk. The seek point of fd is not preserved.
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreateFromFd*(fd: cint; path: cstring; fileSize: csize): LtoModuleT

##  Loads an object file from disk. The seek point of fd is not preserved.
##  Returns NULL on error (check lto_get_error_message() for details).
proc ltoModuleCreateFromFdAtOffset*(fd: cint; path: cstring; fileSize: csize;
                                   mapSize: csize; offset: OffT): LtoModuleT

##  Frees all memory internally allocated by the module.
##  Upon return the lto_module_t is no longer valid.
proc ltoModuleDispose*(`mod`: LtoModuleT)

##  Returns triple string which the object module was compiled under.
proc ltoModuleGetTargetTriple*(`mod`: LtoModuleT): cstring

##  Sets triple string with which the object will be codegened.
proc ltoModuleSetTargetTriple*(`mod`: LtoModuleT; triple: cstring)

##  Returns the number of symbols in the object module.
proc ltoModuleGetNumSymbols*(`mod`: LtoModuleT): cuint

##  Returns the name of the ith symbol in the object module.
proc ltoModuleGetSymbolName*(`mod`: LtoModuleT; index: cuint): cstring

##  Returns the attributes of the ith symbol in the object module.
proc ltoModuleGetSymbolAttribute*(`mod`: LtoModuleT; index: cuint): LtoSymbolAttributes

##  Returns the module's linker options.
##  The linker options may consist of multiple flags. It is the linker's
##  responsibility to split the flags using a platform-specific mechanism.
proc ltoModuleGetLinkeropts*(`mod`: LtoModuleT): cstring

type
  ##  Diagnostic severity.
  LtoCodegenDiagnosticSeverityT* = enum
    LTO_DS_ERROR = 0,
    LTO_DS_WARNING = 1,
    LTO_DS_NOTE = 2,
    LTO_DS_REMARK = 3 ##  Added in LTO_API_VERSION=10.

type
  ##  Diagnostic handler type.
  ##  The diagnostic is not prefixed by any of severity keyword, e.g., 'error: '.
  LtoDiagnosticHandlerT* = proc (severity: LtoCodegenDiagnosticSeverityT;
                              diag: cstring; ctxt: pointer)

##  Set a diagnostic handler and the related context (void *).
##  This is more general than lto_get_error_message, as the diagnostic handler
##  can be called at anytime within lto.
proc ltoCodegenSetDiagnosticHandler*(a2: LtoCodeGenT; a3: LtoDiagnosticHandlerT;
                                    a4: pointer)

##  Instantiates a code generator.
##  Returns NULL on error (check lto_get_error_message() for details).
##  All modules added using \a lto_codegen_add_module() must have been created
##  in the same context as the codegen.
proc ltoCodegenCreate*(): LtoCodeGenT

##  Instantiates a code generator in its own context.  Modules added via \a
##  lto_codegen_add_module() must have all been created in the same context,
##  using lto_module_create_in_codegen_context().
proc ltoCodegenCreateInLocalContext*(): LtoCodeGenT

##  Frees all code generator and all memory it internally allocated.
##  Upon return the lto_code_gen_t is no longer valid.
proc ltoCodegenDispose*(a2: LtoCodeGenT)

##  Add an object module to the set of modules for which code will be generated.
##  Returns true on error (check lto_get_error_message() for details).
##  `cg` and `mod` must both be in the same context.  See
##  lto_codegen_create_in_local_context() and
##  lto_module_create_in_codegen_context().
proc ltoCodegenAddModule*(cg: LtoCodeGenT; `mod`: LtoModuleT): LtoBoolT

##  Sets the object module for code generation. This will transfer the ownership
##  of the module to the code generator.
##  `cg` and `mod` must both be in the same context.
proc ltoCodegenSetModule*(cg: LtoCodeGenT; `mod`: LtoModuleT)

##  Sets if debug info should be generated.
##  Returns true on error (check lto_get_error_message() for details).
proc ltoCodegenSetDebugModel*(cg: LtoCodeGenT; a3: LtoDebugModel): LtoBoolT

##  Sets which PIC code model to generated.
##  Returns true on error (check lto_get_error_message() for details).
proc ltoCodegenSetPicModel*(cg: LtoCodeGenT; a3: LtoCodegenModel): LtoBoolT

##  Sets the cpu to generate code for.
proc ltoCodegenSetCpu*(cg: LtoCodeGenT; cpu: cstring)

##  Sets the location of the assembler tool to run. If not set, libLTO
##  will use gcc to invoke the assembler.
proc ltoCodegenSetAssemblerPath*(cg: LtoCodeGenT; path: cstring)

##  Sets extra arguments that libLTO should pass to the assembler.
proc ltoCodegenSetAssemblerArgs*(cg: LtoCodeGenT; args: cstringArray; nargs: cint)

##  Adds to a list of all global symbols that must exist in the final generated
##  code. If a function is not listed there, it might be inlined into every usage
##  and optimized away.
proc ltoCodegenAddMustPreserveSymbol*(cg: LtoCodeGenT; symbol: cstring)

##  Writes a new object file at the specified path that contains the
##  merged contents of all modules added so far.
##  Returns true on error (check lto_get_error_message() for details).
proc ltoCodegenWriteMergedModules*(cg: LtoCodeGenT; path: cstring): LtoBoolT

##  Generates code for all added modules into one native object file.
##  This calls lto_codegen_optimize then lto_codegen_compile_optimized.
##  On success returns a pointer to a generated mach-o/ELF buffer and
##  length set to the buffer size.  The buffer is owned by the
##  lto_code_gen_t and will be freed when lto_codegen_dispose()
##  is called, or lto_codegen_compile() is called again.
##  On failure, returns NULL (check lto_get_error_message() for details).
proc ltoCodegenCompile*(cg: LtoCodeGenT; length: ptr csize): pointer

##  Generates code for all added modules into one native object file.
##  This calls lto_codegen_optimize then lto_codegen_compile_optimized (instead
##  of returning a generated mach-o/ELF buffer, it writes to a file).
##  The name of the file is written to name. Returns true on error.
proc ltoCodegenCompileToFile*(cg: LtoCodeGenT; name: cstringArray): LtoBoolT

##  Runs optimization for the merged module. Returns true on error.
proc ltoCodegenOptimize*(cg: LtoCodeGenT): LtoBoolT

##  Generates code for the optimized merged module into one native object file.
##  It will not run any IR optimizations on the merged module.
##  On success returns a pointer to a generated mach-o/ELF buffer and length set
##  to the buffer size.  The buffer is owned by the lto_code_gen_t and will be
##  freed when lto_codegen_dispose() is called, or
##  lto_codegen_compile_optimized() is called again. On failure, returns NULL
##  (check lto_get_error_message() for details).
proc ltoCodegenCompileOptimized*(cg: LtoCodeGenT; length: ptr csize): pointer

##  Returns the runtime API version.
proc ltoApiVersion*(): cuint

##  Sets options to help debug codegen bugs.
proc ltoCodegenDebugOptions*(cg: LtoCodeGenT; a3: cstring)

##  Initializes LLVM disassemblers.
##  FIXME: This doesn't really belong here.
proc ltoInitializeDisassembler*()

##  Sets if we should run internalize pass during optimization and code
##  generation.
proc ltoCodegenSetShouldInternalize*(cg: LtoCodeGenT; shouldInternalize: LtoBoolT)

##  Sets whether \a lto_codegen_write_merged_modules() should embed uselists in
##  output bitcode.  This should be turned on for all -save-temps output.
proc ltoCodegenSetShouldEmbedUselists*(cg: LtoCodeGenT;
                                      shouldEmbedUselists: LtoBoolT)

type
  ##  Type to wrap a single object returned by ThinLTO.
  LTOObjectBuffer* {.bycopy.} = object
    buffer*: cstring
    size*: csize

##  Instantiates a ThinLTO code generator.
##  Returns NULL on error (check lto_get_error_message() for details).
##  The ThinLTOCodeGenerator is not intended to be reuse for multiple
##  compilation: the model is that the client adds modules to the generator and
##  ask to perform the ThinLTO optimizations / codegen, and finally destroys the
##  codegenerator.
proc thinltoCreateCodegen*(): ThinltoCodeGenT

##  Frees the generator and all memory it internally allocated.
##  Upon return the thinlto_code_gen_t is no longer valid.
proc thinltoCodegenDispose*(cg: ThinltoCodeGenT)

##  Add a module to a ThinLTO code generator. Identifier has to be unique among
##  all the modules in a code generator. The data buffer stays owned by the
##  client, and is expected to be available for the entire lifetime of the
##  thinlto_code_gen_t it is added to.
##  On failure, returns NULL (check lto_get_error_message() for details).
proc thinltoCodegenAddModule*(cg: ThinltoCodeGenT; identifier: cstring;
                             data: cstring; length: cint)

##  Optimize and codegen all the modules added to the codegenerator using
##  ThinLTO. Resulting objects are accessible using thinlto_module_get_object().
proc thinltoCodegenProcess*(cg: ThinltoCodeGenT)

##  Returns the number of object files produced by the ThinLTO CodeGenerator.
##  It usually matches the number of input files, but this is not a guarantee of
##  the API and may change in future implementation, so the client should not
##  assume it.
proc thinltoModuleGetNumObjects*(cg: ThinltoCodeGenT): cuint

##  Returns a reference to the ith object file produced by the ThinLTO
##  CodeGenerator.
##  Client should use \p thinlto_module_get_num_objects() to get the number of
##  available objects.
proc thinltoModuleGetObject*(cg: ThinltoCodeGenT; index: cuint): LTOObjectBuffer

##  Returns the number of object files produced by the ThinLTO CodeGenerator.
##  It usually matches the number of input files, but this is not a guarantee of
##  the API and may change in future implementation, so the client should not
##  assume it.
proc thinltoModuleGetNumObjectFiles*(cg: ThinltoCodeGenT): cuint

##  Returns the path to the ith object file produced by the ThinLTO
##  CodeGenerator.
##  Client should use \p thinlto_module_get_num_object_files() to get the number
##  of available objects.
proc thinltoModuleGetObjectFile*(cg: ThinltoCodeGenT; index: cuint): cstring

##  Sets which PIC code model to generate.
##  Returns true on error (check lto_get_error_message() for details).
proc thinltoCodegenSetPicModel*(cg: ThinltoCodeGenT; a3: LtoCodegenModel): LtoBoolT

##  Sets the path to a directory to use as a storage for temporary bitcode files.
##  The intention is to make the bitcode files available for debugging at various
##  stage of the pipeline.
proc thinltoCodegenSetSavetempsDir*(cg: ThinltoCodeGenT; saveTempsDir: cstring)

##  Set the path to a directory where to save generated object files. This
##  path can be used by a linker to request on-disk files instead of in-memory
##  buffers. When set, results are available through
##  thinlto_module_get_object_file() instead of thinlto_module_get_object().
proc thinltoSetGeneratedObjectsDir*(cg: ThinltoCodeGenT; saveTempsDir: cstring)

##  Sets the cpu to generate code for.
proc thinltoCodegenSetCpu*(cg: ThinltoCodeGenT; cpu: cstring)

##  Disable CodeGen, only run the stages till codegen and stop. The output will
##  be bitcode.
proc thinltoCodegenDisableCodegen*(cg: ThinltoCodeGenT; disable: LtoBoolT)

##  Perform CodeGen only: disable all other stages.
proc thinltoCodegenSetCodegenOnly*(cg: ThinltoCodeGenT; codegenOnly: LtoBoolT)

##  Parse -mllvm style debug options.
proc thinltoDebugOptions*(options: cstringArray; number: cint)

##  Test if a module has support for ThinLTO linking.
proc ltoModuleIsThinlto*(`mod`: LtoModuleT): LtoBoolT

##  Adds a symbol to the list of global symbols that must exist in the final
##  generated code. If a function is not listed there, it might be inlined into
##  every usage and optimized away. For every single module, the functions
##  referenced from code outside of the ThinLTO modules need to be added here.
proc thinltoCodegenAddMustPreserveSymbol*(cg: ThinltoCodeGenT; name: cstring;
    length: cint)

##  Adds a symbol to the list of global symbols that are cross-referenced between
##  ThinLTO files. If the ThinLTO CodeGenerator can ensure that every
##  references from a ThinLTO module to this symbol is optimized away, then
##  the symbol can be discarded.
proc thinltoCodegenAddCrossReferencedSymbol*(cg: ThinltoCodeGenT; name: cstring;
    length: cint)

##  These entry points control the ThinLTO cache. The cache is intended to
##  support incremental build, and thus needs to be persistent accross build.
##  The client enabled the cache by supplying a path to an existing directory.
##  The code generator will use this to store objects files that may be reused
##  during a subsequent build.
##  To avoid filling the disk space, a few knobs are provided:
##   - The pruning interval limit the frequency at which the garbage collector
##     will try to scan the cache directory to prune it from expired entries.
##     Setting to -1 disable the pruning (default).
##   - The pruning expiration time indicates to the garbage collector how old an
##     entry needs to be to be removed.
##   - Finally, the garbage collector can be instructed to prune the cache till
##     the occupied space goes below a threshold.
##  Sets the path to a directory to use as a cache storage for incremental build.
##  Setting this activates caching.
proc thinltoCodegenSetCacheDir*(cg: ThinltoCodeGenT; cacheDir: cstring)

##  Sets the cache pruning interval (in seconds). A negative value disable the
##  pruning. An unspecified default value will be applied, and a value of 0 will
##  be ignored.
proc thinltoCodegenSetCachePruningInterval*(cg: ThinltoCodeGenT; interval: cint)

##  Sets the maximum cache size that can be persistent across build, in terms of
##  percentage of the available space on the the disk. Set to 100 to indicate
##  no limit, 50 to indicate that the cache size will not be left over half the
##  available space. A value over 100 will be reduced to 100, a value of 0 will
##  be ignored. An unspecified default value will be applied.
##  The formula looks like:
##   AvailableSpace = FreeSpace + ExistingCacheSize
##   NewCacheSize = AvailableSpace * P/100
proc thinltoCodegenSetFinalCacheSizeRelativeToAvailableSpace*(
    cg: ThinltoCodeGenT; percentage: cuint)

##  Sets the expiration (in seconds) for an entry in the cache. An unspecified
##  default value will be applied. A value of 0 will be ignored.
proc thinltoCodegenSetCacheEntryExpiration*(cg: ThinltoCodeGenT; expiration: cuint)
