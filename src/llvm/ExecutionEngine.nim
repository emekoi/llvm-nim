import Target, Types, TargetMachine

{.push cdecl, importc.}

proc LLVMLinkInMCJIT*()
proc LLVMLinkInInterpreter*()

{.pop.}

type
  LLVMGenericValueRef* = ptr object
  LLVMExecutionEngineRef* = ptr object
  LLVMMCJITMemoryManagerRef* = ptr object

  LLVMMCJITCompilerOptions* = object
    OptLevel*: cuint
    CodeModel*: LLVMCodeModel
    NoFramePointerElim*: bool
    EnableFastISel*: bool
    MCJMM*: LLVMMCJITMemoryManagerRef

{.push cdecl, importc.}

proc LLVMCreateGenericValueOfInt*(Ty: LLVMTypeRef; N: culonglong; IsSigned: bool): LLVMGenericValueRef
proc LLVMCreateGenericValueOfPointer*(P: pointer): LLVMGenericValueRef
proc LLVMCreateGenericValueOfFloat*(Ty: LLVMTypeRef; N: cdouble): LLVMGenericValueRef
proc LLVMGenericValueIntWidth*(GenValRef: LLVMGenericValueRef): cuint
proc LLVMGenericValueToInt*(GenVal: LLVMGenericValueRef; IsSigned: bool): culonglong
proc LLVMGenericValueToPointer*(GenVal: LLVMGenericValueRef): pointer
proc LLVMGenericValueToFloat*(TyRef: LLVMTypeRef; GenVal: LLVMGenericValueRef): cdouble
proc LLVMDisposeGenericValue*(GenVal: LLVMGenericValueRef)
proc LLVMCreateExecutionEngineForModule*(OutEE: ptr LLVMExecutionEngineRef; M: LLVMModuleRef; OutError: cstringArray): bool
proc LLVMCreateInterpreterForModule*(OutInterp: ptr LLVMExecutionEngineRef; M: LLVMModuleRef; OutError: cstringArray): bool
proc LLVMCreateJITCompilerForModule*(OutJIT: ptr LLVMExecutionEngineRef; M: LLVMModuleRef; OptLevel: cuint; OutError: cstringArray): bool
proc LLVMInitializeMCJITCompilerOptions*(Options: ptr LLVMMCJITCompilerOptions; SizeOfOptions: csize)
proc LLVMCreateMCJITCompilerForModule*(OutJIT: ptr LLVMExecutionEngineRef; M: LLVMModuleRef; Options: ptr LLVMMCJITCompilerOptions; SizeOfOptions: csize; OutError: cstringArray): bool
proc LLVMDisposeExecutionEngine*(EE: LLVMExecutionEngineRef)
proc LLVMRunStaticConstructors*(EE: LLVMExecutionEngineRef)
proc LLVMRunStaticDestructors*(EE: LLVMExecutionEngineRef)
proc LLVMRunFunctionAsMain*(EE: LLVMExecutionEngineRef; F: LLVMValueRef; ArgC: cuint; ArgV: cstringArray; EnvP: cstringArray): cint
proc LLVMRunFunction*(EE: LLVMExecutionEngineRef; F: LLVMValueRef; NumArgs: cuint; Args: ptr LLVMGenericValueRef): LLVMGenericValueRef
proc LLVMFreeMachineCodeForFunction*(EE: LLVMExecutionEngineRef; F: LLVMValueRef)
proc LLVMAddModule*(EE: LLVMExecutionEngineRef; M: LLVMModuleRef)
proc LLVMRemoveModule*(EE: LLVMExecutionEngineRef; M: LLVMModuleRef; OutMod: ptr LLVMModuleRef; OutError: cstringArray): bool
proc LLVMFindFunction*(EE: LLVMExecutionEngineRef; Name: cstring; OutFn: ptr LLVMValueRef): bool
proc LLVMRecompileAndRelinkFunction*(EE: LLVMExecutionEngineRef; Fn: LLVMValueRef): pointer
proc LLVMGetExecutionEngineTargetData*(EE: LLVMExecutionEngineRef): LLVMTargetDataRef
proc LLVMGetExecutionEngineTargetMachine*(EE: LLVMExecutionEngineRef): LLVMTargetMachineRef
proc LLVMAddGlobalMapping*(EE: LLVMExecutionEngineRef; Global: LLVMValueRef; Addr: pointer)
proc LLVMGetPointerToGlobal*(EE: LLVMExecutionEngineRef; Global: LLVMValueRef): pointer
proc LLVMGetGlobalValueAddress*(EE: LLVMExecutionEngineRef; Name: cstring): uint64
proc LLVMGetFunctionAddress*(EE: LLVMExecutionEngineRef; Name: cstring): uint64

{.pop.}

type
  LLVMMemoryManagerAllocateCodeSectionCallback* = proc(Opaque: pointer; Size: uint; Alignment: cuint; SectionID: cuint; SectionName: cstring): ptr uint8 {.cdecl.}
  LLVMMemoryManagerAllocateDataSectionCallback* = proc(Opaque: pointer; Size: uint; Alignment: cuint; SectionID: cuint; SectionName: cstring; IsReadOnly: bool): ptr uint8 {.cdecl.}
  LLVMMemoryManagerFinalizeMemoryCallback* = proc(Opaque: pointer; ErrMsg: cstringArray): bool {.cdecl.}
  LLVMMemoryManagerDestroyCallback* = proc(Opaque: pointer) {.cdecl.}

{.push cdecl, importc.}

proc LLVMCreateSimpleMCJITMemoryManager*(Opaque: pointer; AllocateCodeSection: LLVMMemoryManagerAllocateCodeSectionCallback; AllocateDataSection: LLVMMemoryManagerAllocateDataSectionCallback; FinalizeMemory: LLVMMemoryManagerFinalizeMemoryCallback; Destroy: LLVMMemoryManagerDestroyCallback): LLVMMCJITMemoryManagerRef
proc LLVMDisposeMCJITMemoryManager*(MM: LLVMMCJITMemoryManagerRef)

{.pop.}
