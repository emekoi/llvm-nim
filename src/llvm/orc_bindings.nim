# import
#   llvm-c/Object, llvm-c/TargetMachine

type
  LLVMSharedModuleRef* = ptr LLVMOpaqueSharedModule

  LLVMSharedObjectBufferRef* = ptr LLVMOpaqueSharedObjectBuffer

  LLVMOrcJITStackRef* = ptr LLVMOrcOpaqueJITStack

  LLVMOrcModuleHandle* = uint32T

  LLVMOrcTargetAddress* = uint64T

  LLVMOrcSymbolResolverFn* = proc (name: cstring; lookupCtx: pointer): uint64T

  LLVMOrcLazyCompileCallbackFn* = proc (jITStack: LLVMOrcJITStackRef;
                                     callbackCtx: pointer): uint64T
  LLVMOrcErrorCode* = enum
    LLVMOrcErrSuccess = 0, LLVMOrcErrGeneric

##  Turn an LLVMModuleRef into an LLVMSharedModuleRef.
##  The JIT uses shared ownership for LLVM modules, since it is generally
##  difficult to know when the JIT will be finished with a module (and the JIT
##  has no way of knowing when a user may be finished with one).
##  Calling this method with an LLVMModuleRef creates a shared-pointer to the
##  module, and returns a reference to this shared pointer.
##  The shared module should be disposed when finished with by calling
##  LLVMOrcDisposeSharedModule (not LLVMDisposeModule). The Module will be
##  deleted when the last shared pointer owner relinquishes it.
proc LLVMOrcMakeSharedModule*(`mod`: LLVMModuleRef): LLVMSharedModuleRef

##  Dispose of a shared module.
##  The module should not be accessed after this call. The module will be
##  deleted once all clients (including the JIT itself) have released their
##  shared pointers.
proc LLVMOrcDisposeSharedModuleRef*(sharedMod: LLVMSharedModuleRef)

##  Get an LLVMSharedObjectBufferRef from an LLVMMemoryBufferRef.
proc LLVMOrcMakeSharedObjectBuffer*(objBuffer: LLVMMemoryBufferRef): LLVMSharedObjectBufferRef

##  Dispose of a shared object buffer.
proc LLVMOrcDisposeSharedObjectBufferRef*(
    sharedObjBuffer: LLVMSharedObjectBufferRef)

##  Create an ORC JIT stack.
##  The client owns the resulting stack, and must call OrcDisposeInstance(...)
##  to destroy it and free its memory. The JIT stack will take ownership of the
##  TargetMachine, which will be destroyed when the stack is destroyed. The
##  client should not attempt to dispose of the Target Machine, or it will result
##  in a double-free.
proc LLVMOrcCreateInstance*(tm: LLVMTargetMachineRef): LLVMOrcJITStackRef

##  Get the error message for the most recent error (if any).
##  This message is owned by the ORC JIT Stack and will be freed when the stack
##  is disposed of by LLVMOrcDisposeInstance.
proc LLVMOrcGetErrorMsg*(jITStack: LLVMOrcJITStackRef): cstring

##  Mangle the given symbol.
##  Memory will be allocated for MangledSymbol to hold the result. The client
proc LLVMOrcGetMangledSymbol*(jITStack: LLVMOrcJITStackRef;
                             mangledSymbol: cstringArray; symbol: cstring)

##  Dispose of a mangled symbol.
proc LLVMOrcDisposeMangledSymbol*(mangledSymbol: cstring)

##  Create a lazy compile callback.
proc LLVMOrcCreateLazyCompileCallback*(jITStack: LLVMOrcJITStackRef;
                                      retAddr: ptr LLVMOrcTargetAddress;
                                      callback: LLVMOrcLazyCompileCallbackFn;
                                      callbackCtx: pointer): LLVMOrcErrorCode

##  Create a named indirect call stub.
proc LLVMOrcCreateIndirectStub*(jITStack: LLVMOrcJITStackRef; stubName: cstring;
                               initAddr: LLVMOrcTargetAddress): LLVMOrcErrorCode

##  Set the pointer for the given indirect stub.
proc LLVMOrcSetIndirectStubPointer*(jITStack: LLVMOrcJITStackRef;
                                   stubName: cstring;
                                   newAddr: LLVMOrcTargetAddress): LLVMOrcErrorCode

##  Add module to be eagerly compiled.
proc LLVMOrcAddEagerlyCompiledIR*(jITStack: LLVMOrcJITStackRef;
                                 retHandle: ptr LLVMOrcModuleHandle;
                                 `mod`: LLVMSharedModuleRef;
                                 symbolResolver: LLVMOrcSymbolResolverFn;
                                 symbolResolverCtx: pointer): LLVMOrcErrorCode

##  Add module to be lazily compiled one function at a time.
proc LLVMOrcAddLazilyCompiledIR*(jITStack: LLVMOrcJITStackRef;
                                retHandle: ptr LLVMOrcModuleHandle;
                                `mod`: LLVMSharedModuleRef;
                                symbolResolver: LLVMOrcSymbolResolverFn;
                                symbolResolverCtx: pointer): LLVMOrcErrorCode

##  Add an object file.
proc LLVMOrcAddObjectFile*(jITStack: LLVMOrcJITStackRef;
                          retHandle: ptr LLVMOrcModuleHandle;
                          obj: LLVMSharedObjectBufferRef;
                          symbolResolver: LLVMOrcSymbolResolverFn;
                          symbolResolverCtx: pointer): LLVMOrcErrorCode

##  Remove a module set from the JIT.
##  This works for all modules that can be added via OrcAdd*, including object
##  files.
proc LLVMOrcRemoveModule*(jITStack: LLVMOrcJITStackRef; h: LLVMOrcModuleHandle): LLVMOrcErrorCode

##  Get symbol address from JIT instance.
proc LLVMOrcGetSymbolAddress*(jITStack: LLVMOrcJITStackRef;
                             retAddr: ptr LLVMOrcTargetAddress; symbolName: cstring): LLVMOrcErrorCode

##  Dispose of an ORC JIT stack.
proc LLVMOrcDisposeInstance*(jITStack: LLVMOrcJITStackRef): LLVMOrcErrorCode
