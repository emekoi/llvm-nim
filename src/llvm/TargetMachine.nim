import ospaths, strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
const headerTargetMachine = sourcePath & "TargetMachine.h"
type
  LLVMTargetMachineRef = ptr LLVMOpaqueTargetMachine
  LLVMTargetRef = ptr LLVMTarget
  LLVMCodeGenOptLevel {.size: sizeof(cint).} = enum
    LLVMCodeGenLevelNone, LLVMCodeGenLevelLess, LLVMCodeGenLevelDefault,
    LLVMCodeGenLevelAggressive
  LLVMRelocMode {.size: sizeof(cint).} = enum
    LLVMRelocDefault, LLVMRelocStatic, LLVMRelocPIC, LLVMRelocDynamicNoPic
  LLVMCodeModel {.size: sizeof(cint).} = enum
    LLVMCodeModelDefault, LLVMCodeModelJITDefault, LLVMCodeModelSmall,
    LLVMCodeModelKernel, LLVMCodeModelMedium, LLVMCodeModelLarge
  LLVMCodeGenFileType {.size: sizeof(cint).} = enum
    LLVMAssemblyFile, LLVMObjectFile





proc LLVMGetFirstTarget(): LLVMTargetRef {.cdecl.}
proc LLVMGetNextTarget(T: LLVMTargetRef): LLVMTargetRef {.cdecl.}
proc LLVMGetTargetFromName(Name: cstring): LLVMTargetRef {.cdecl.}
proc LLVMGetTargetFromTriple(Triple: cstring; T: ptr LLVMTargetRef;
                            ErrorMessage: cstringArray): bool {.cdecl.}
proc LLVMGetTargetName(T: LLVMTargetRef): cstring {.cdecl.}
proc LLVMGetTargetDescription(T: LLVMTargetRef): cstring {.cdecl.}
proc LLVMTargetHasJIT(T: LLVMTargetRef): bool {.cdecl.}
proc LLVMTargetHasTargetMachine(T: LLVMTargetRef): bool {.cdecl.}
proc LLVMTargetHasAsmBackend(T: LLVMTargetRef): bool {.cdecl.}
proc LLVMCreateTargetMachine(T: LLVMTargetRef; Triple: cstring; CPU: cstring;
                            Features: cstring; Level: LLVMCodeGenOptLevel;
                            Reloc: LLVMRelocMode; CodeModel: LLVMCodeModel): LLVMTargetMachineRef {.
    cdecl.}
proc LLVMDisposeTargetMachine(T: LLVMTargetMachineRef) {.cdecl.}
proc LLVMGetTargetMachineTarget(T: LLVMTargetMachineRef): LLVMTargetRef {.cdecl.}
proc LLVMGetTargetMachineTriple(T: LLVMTargetMachineRef): cstring {.cdecl.}
proc LLVMGetTargetMachineCPU(T: LLVMTargetMachineRef): cstring {.cdecl.}
proc LLVMGetTargetMachineFeatureString(T: LLVMTargetMachineRef): cstring {.cdecl.}
proc LLVMCreateTargetDataLayout(T: LLVMTargetMachineRef): LLVMTargetDataRef {.cdecl.}
proc LLVMSetTargetMachineAsmVerbosity(T: LLVMTargetMachineRef; VerboseAsm: bool) {.
    cdecl.}
proc LLVMTargetMachineEmitToFile(T: LLVMTargetMachineRef; M: LLVMModuleRef;
                                Filename: cstring; codegen: LLVMCodeGenFileType;
                                ErrorMessage: cstringArray): bool {.cdecl.}
proc LLVMTargetMachineEmitToMemoryBuffer(T: LLVMTargetMachineRef; M: LLVMModuleRef;
                                        codegen: LLVMCodeGenFileType;
                                        ErrorMessage: cstringArray;
                                        OutMemBuf: ptr LLVMMemoryBufferRef): bool {.
    cdecl.}
proc LLVMGetDefaultTargetTriple(): cstring {.cdecl.}
proc LLVMAddAnalysisPasses(T: LLVMTargetMachineRef; PM: LLVMPassManagerRef) {.cdecl.}
