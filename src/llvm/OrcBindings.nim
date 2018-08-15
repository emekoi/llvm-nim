import ospaths, strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
const headerOrcBindings = sourcePath & "OrcBindings.h"
type
  LLVMSharedModuleRef = ptr LLVMOpaqueSharedModule
  LLVMOrcJITStackRef = ptr LLVMOrcOpaqueJITStack
  LLVMOrcModuleHandle = uint32
  LLVMOrcTargetAddress = uint64
  LLVMOrcSymbolResolverFn = proc (Name: cstring; LookupCtx: pointer): uint64 
  LLVMOrcLazyCompileCallbackFn = proc (JITStack: LLVMOrcJITStackRef;
                                    CallbackCtx: pointer): uint64 {.cdecl.}
  LLVMOrcErrorCode {.size: sizeof(cint).} = enum
    LLVMOrcErrSuccess = 0, LLVMOrcErrGeneric


proc LLVMOrcMakeSharedModule(Mod: LLVMModuleRef): LLVMSharedModuleRef {.cdecl.}
proc LLVMOrcDisposeSharedModuleRef(SharedMod: LLVMSharedModuleRef) {.cdecl.}
proc LLVMOrcCreateInstance(TM: LLVMTargetMachineRef): LLVMOrcJITStackRef {.cdecl.}
proc LLVMOrcGetErrorMsg(JITStack: LLVMOrcJITStackRef): cstring {.cdecl.}
proc LLVMOrcGetMangledSymbol(JITStack: LLVMOrcJITStackRef;
                            MangledSymbol: cstringArray; Symbol: cstring) {.cdecl.}
proc LLVMOrcDisposeMangledSymbol(MangledSymbol: cstring) {.cdecl.}
proc LLVMOrcCreateLazyCompileCallback(JITStack: LLVMOrcJITStackRef;
                                     RetAddr: ptr LLVMOrcTargetAddress;
                                     Callback: LLVMOrcLazyCompileCallbackFn;
                                     CallbackCtx: pointer): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcCreateIndirectStub(JITStack: LLVMOrcJITStackRef; StubName: cstring;
                              InitAddr: LLVMOrcTargetAddress): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcSetIndirectStubPointer(JITStack: LLVMOrcJITStackRef; StubName: cstring;
                                  NewAddr: LLVMOrcTargetAddress): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcAddEagerlyCompiledIR(JITStack: LLVMOrcJITStackRef;
                                RetHandle: ptr LLVMOrcModuleHandle;
                                Mod: LLVMSharedModuleRef;
                                SymbolResolver: LLVMOrcSymbolResolverFn;
                                SymbolResolverCtx: pointer): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcAddLazilyCompiledIR(JITStack: LLVMOrcJITStackRef;
                               RetHandle: ptr LLVMOrcModuleHandle;
                               Mod: LLVMSharedModuleRef;
                               SymbolResolver: LLVMOrcSymbolResolverFn;
                               SymbolResolverCtx: pointer): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcAddObjectFile(JITStack: LLVMOrcJITStackRef;
                         RetHandle: ptr LLVMOrcModuleHandle;
                         Obj: LLVMMemoryBufferRef;
                         SymbolResolver: LLVMOrcSymbolResolverFn;
                         SymbolResolverCtx: pointer): LLVMOrcErrorCode {.cdecl.}
proc LLVMOrcRemoveModule(JITStack: LLVMOrcJITStackRef; H: LLVMOrcModuleHandle): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcGetSymbolAddress(JITStack: LLVMOrcJITStackRef;
                            RetAddr: ptr LLVMOrcTargetAddress; SymbolName: cstring): LLVMOrcErrorCode {.
    cdecl.}
proc LLVMOrcDisposeInstance(JITStack: LLVMOrcJITStackRef): LLVMOrcErrorCode {.cdecl.}