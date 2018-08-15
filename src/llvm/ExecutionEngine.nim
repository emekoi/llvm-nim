import ospaths, strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
const headerExecutionEngine = sourcePath & "ExecutionEngine.h"
proc LLVMLinkInMCJIT() {.cdecl.}
proc LLVMLinkInInterpreter() {.cdecl.}
type
  LLVMGenericValueRef = ptr LLVMOpaqueGenericValue
  LLVMExecutionEngineRef = ptr LLVMOpaqueExecutionEngine
  LLVMMCJITMemoryManagerRef = ptr LLVMOpaqueMCJITMemoryManager
  LLVMMCJITCompilerOptions {.importc: "LLVMMCJITCompilerOptions", bycopy.} = object
    OptLevel: cuint
    CodeModel: LLVMCodeModel
    NoFramePointerElim: bool
    EnableFastISel: bool
    MCJMM: LLVMMCJITMemoryManagerRef


proc LLVMCreateGenericValueOfInt(Ty: LLVMTypeRef; N: culonglong; IsSigned: bool): LLVMGenericValueRef {.
    cdecl.}
proc LLVMCreateGenericValueOfPointer(P: pointer): LLVMGenericValueRef {.cdecl.}
proc LLVMCreateGenericValueOfFloat(Ty: LLVMTypeRef; N: cdouble): LLVMGenericValueRef {.
    cdecl.}
proc LLVMGenericValueIntWidth(GenValRef: LLVMGenericValueRef): cuint {.cdecl.}
proc LLVMGenericValueToInt(GenVal: LLVMGenericValueRef; IsSigned: bool): culonglong {.
    cdecl.}
proc LLVMGenericValueToPointer(GenVal: LLVMGenericValueRef): pointer {.cdecl.}
proc LLVMGenericValueToFloat(TyRef: LLVMTypeRef; GenVal: LLVMGenericValueRef): cdouble {.
    cdecl.}
proc LLVMDisposeGenericValue(GenVal: LLVMGenericValueRef) {.cdecl.}
proc LLVMCreateExecutionEngineForModule(OutEE: ptr LLVMExecutionEngineRef;
                                       M: LLVMModuleRef; OutError: cstringArray): bool {.
    cdecl.}
proc LLVMCreateInterpreterForModule(OutInterp: ptr LLVMExecutionEngineRef;
                                   M: LLVMModuleRef; OutError: cstringArray): bool {.
    cdecl.}
proc LLVMCreateJITCompilerForModule(OutJIT: ptr LLVMExecutionEngineRef;
                                   M: LLVMModuleRef; OptLevel: cuint;
                                   OutError: cstringArray): bool {.cdecl.}
proc LLVMInitializeMCJITCompilerOptions(Options: ptr LLVMMCJITCompilerOptions;
                                       SizeOfOptions: csize) {.cdecl.}
proc LLVMCreateMCJITCompilerForModule(OutJIT: ptr LLVMExecutionEngineRef;
                                     M: LLVMModuleRef;
                                     Options: ptr LLVMMCJITCompilerOptions;
                                     SizeOfOptions: csize; OutError: cstringArray): bool {.
    cdecl.}
proc LLVMDisposeExecutionEngine(EE: LLVMExecutionEngineRef) {.cdecl.}
proc LLVMRunStaticConstructors(EE: LLVMExecutionEngineRef) {.cdecl.}
proc LLVMRunStaticDestructors(EE: LLVMExecutionEngineRef) {.cdecl.}
proc LLVMRunFunctionAsMain(EE: LLVMExecutionEngineRef; F: LLVMValueRef; ArgC: cuint;
                          ArgV: cstringArray; EnvP: cstringArray): cint {.cdecl.}
proc LLVMRunFunction(EE: LLVMExecutionEngineRef; F: LLVMValueRef; NumArgs: cuint;
                    Args: ptr LLVMGenericValueRef): LLVMGenericValueRef {.cdecl.}
proc LLVMFreeMachineCodeForFunction(EE: LLVMExecutionEngineRef; F: LLVMValueRef) {.
    cdecl.}
proc LLVMAddModule(EE: LLVMExecutionEngineRef; M: LLVMModuleRef) {.cdecl.}
proc LLVMRemoveModule(EE: LLVMExecutionEngineRef; M: LLVMModuleRef;
                     OutMod: ptr LLVMModuleRef; OutError: cstringArray): bool {.
    cdecl.}
proc LLVMFindFunction(EE: LLVMExecutionEngineRef; Name: cstring;
                     OutFn: ptr LLVMValueRef): bool {.cdecl.}
proc LLVMRecompileAndRelinkFunction(EE: LLVMExecutionEngineRef; Fn: LLVMValueRef): pointer {.
    cdecl.}
proc LLVMGetExecutionEngineTargetData(EE: LLVMExecutionEngineRef): LLVMTargetDataRef {.
    cdecl.}
proc LLVMGetExecutionEngineTargetMachine(EE: LLVMExecutionEngineRef): LLVMTargetMachineRef {.
    cdecl.}
proc LLVMAddGlobalMapping(EE: LLVMExecutionEngineRef; Global: LLVMValueRef;
                         Addr: pointer) {.cdecl.}
proc LLVMGetPointerToGlobal(EE: LLVMExecutionEngineRef; Global: LLVMValueRef): pointer {.
    cdecl.}
proc LLVMGetGlobalValueAddress(EE: LLVMExecutionEngineRef; Name: cstring): uint64 {.
    cdecl.}
proc LLVMGetFunctionAddress(EE: LLVMExecutionEngineRef; Name: cstring): uint64 {.cdecl.}
type
  LLVMMemoryManagerAllocateCodeSectionCallback = proc (Opaque: pointer;
      Size: uintptr; Alignment: cuint; SectionID: cuint; SectionName: cstring): ptr uint8 {.
      cdecl.}
  LLVMMemoryManagerAllocateDataSectionCallback = proc (Opaque: pointer;
      Size: uintptr; Alignment: cuint; SectionID: cuint; SectionName: cstring;
      IsReadOnly: bool): ptr uint8 {.cdecl.}
  LLVMMemoryManagerFinalizeMemoryCallback = proc (Opaque: pointer;
      ErrMsg: cstringArray): bool {.cdecl.}
  LLVMMemoryManagerDestroyCallback = proc (Opaque: pointer) 

proc LLVMCreateSimpleMCJITMemoryManager(Opaque: pointer; AllocateCodeSection: LLVMMemoryManagerAllocateCodeSectionCallback;
    AllocateDataSection: LLVMMemoryManagerAllocateDataSectionCallback;
    FinalizeMemory: LLVMMemoryManagerFinalizeMemoryCallback; Destroy: LLVMMemoryManagerDestroyCallback): LLVMMCJITMemoryManagerRef {.
    cdecl.}
proc LLVMDisposeMCJITMemoryManager(MM: LLVMMCJITMemoryManagerRef) {.cdecl.}
