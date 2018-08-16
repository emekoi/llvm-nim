import Object, TargetMachine

type
  LLVMSharedModuleRef* = ptr object
  LLVMOrcJITStackRef* = ptr object
  LLVMOrcModuleHandle* = uint32
  LLVMOrcTargetAddress* = uint64
  LLVMOrcSymbolResolverFn* = proc(Name: cstring; LookupCtx: pointer): uint64 {.cdecl.}
  LLVMOrcLazyCompileCallbackFn* = proc(JITStack: LLVMOrcJITStackRef; CallbackCtx: pointer): uint64 {.cdecl.}
  
  LLVMOrcErrorCode* {.size: sizeof(cint).} = enum
    LLVMOrcErrSuccess = 0,
    LLVMOrcErrGeneric

{.push cdecl, importc.}

proc LLVMOrcMakeSharedModule*(Mod: LLVMModuleRef): LLVMSharedModuleRef
proc LLVMOrcDisposeSharedModuleRef*(SharedMod: LLVMSharedModuleRef)
proc LLVMOrcCreateInstance*(TM: LLVMTargetMachineRef): LLVMOrcJITStackRef
proc LLVMOrcGetErrorMsg*(JITStack: LLVMOrcJITStackRef): cstring
proc LLVMOrcGetMangledSymbol*(JITStack: LLVMOrcJITStackRef; MangledSymbol: cstringArray; Symbol: cstring)
proc LLVMOrcDisposeMangledSymbol*(MangledSymbol: cstring)
proc LLVMOrcCreateLazyCompileCallback*(JITStack: LLVMOrcJITStackRef; RetAddr: ptr LLVMOrcTargetAddress; Callback: LLVMOrcLazyCompileCallbackFn; CallbackCtx: pointer): LLVMOrcErrorCode
proc LLVMOrcCreateIndirectStub*(JITStack: LLVMOrcJITStackRef; StubName: cstring; InitAddr: LLVMOrcTargetAddress): LLVMOrcErrorCode
proc LLVMOrcSetIndirectStubPointer*(JITStack: LLVMOrcJITStackRef; StubName: cstring; NewAddr: LLVMOrcTargetAddress): LLVMOrcErrorCode
proc LLVMOrcAddEagerlyCompiledIR*(JITStack: LLVMOrcJITStackRef; RetHandle: ptr LLVMOrcModuleHandle; Mod: LLVMSharedModuleRef; SymbolResolver: LLVMOrcSymbolResolverFn; SymbolResolverCtx: pointer): LLVMOrcErrorCode
proc LLVMOrcAddLazilyCompiledIR*(JITStack: LLVMOrcJITStackRef; RetHandle: ptr LLVMOrcModuleHandle; Mod: LLVMSharedModuleRef; SymbolResolver: LLVMOrcSymbolResolverFn; SymbolResolverCtx: pointer): LLVMOrcErrorCode
proc LLVMOrcAddObjectFile*(JITStack: LLVMOrcJITStackRef; RetHandle: ptr LLVMOrcModuleHandle; Obj: LLVMMemoryBufferRef; SymbolResolver: LLVMOrcSymbolResolverFn; SymbolResolverCtx: pointer): LLVMOrcErrorCode
proc LLVMOrcRemoveModule*(JITStack: LLVMOrcJITStackRef; H: LLVMOrcModuleHandle): LLVMOrcErrorCode
proc LLVMOrcGetSymbolAddress*(JITStack: LLVMOrcJITStackRef; RetAddr: ptr LLVMOrcTargetAddress; SymbolName: cstring): LLVMOrcErrorCode
proc LLVMOrcDisposeInstance*(JITStack: LLVMOrcJITStackRef): LLVMOrcErrorCode

{.pop.}
