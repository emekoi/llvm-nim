# import
#   llvm-c/Target, llvm-c/TargetMachine, llvm-c/Types

proc LLVMLinkInMCJIT*()

proc LLVMLinkInInterpreter*()

type
  LLVMGenericValueRef* = ptr LLVMOpaqueGenericValue

  LLVMExecutionEngineRef* = ptr LLVMOpaqueExecutionEngine

  LLVMMCJITMemoryManagerRef* = ptr LLVMOpaqueMCJITMemoryManager

  LLVMMCJITCompilerOptions* {.bycopy.} = object
    optLevel*: cuint
    codeModel*: LLVMCodeModel
    noFramePointerElim*: LLVMBool
    enableFastISel*: LLVMBool
    mcjmm*: LLVMMCJITMemoryManagerRef

proc LLVMCreateGenericValueOfInt*(ty: LLVMTypeRef; n: culonglong; isSigned: LLVMBool): LLVMGenericValueRef

proc LLVMCreateGenericValueOfPointer*(p: pointer): LLVMGenericValueRef

proc LLVMCreateGenericValueOfFloat*(ty: LLVMTypeRef; n: cdouble): LLVMGenericValueRef

proc LLVMGenericValueIntWidth*(genValRef: LLVMGenericValueRef): cuint

proc LLVMGenericValueToInt*(genVal: LLVMGenericValueRef; isSigned: LLVMBool): culonglong

proc LLVMGenericValueToPointer*(genVal: LLVMGenericValueRef): pointer

proc LLVMGenericValueToFloat*(tyRef: LLVMTypeRef; genVal: LLVMGenericValueRef): cdouble

proc LLVMDisposeGenericValue*(genVal: LLVMGenericValueRef)

proc LLVMCreateExecutionEngineForModule*(outEE: ptr LLVMExecutionEngineRef;
                                        m: LLVMModuleRef; outError: cstringArray): LLVMBool

proc LLVMCreateInterpreterForModule*(outInterp: ptr LLVMExecutionEngineRef;
                                    m: LLVMModuleRef; outError: cstringArray): LLVMBool

proc LLVMCreateJITCompilerForModule*(outJIT: ptr LLVMExecutionEngineRef;
                                    m: LLVMModuleRef; optLevel: cuint;
                                    outError: cstringArray): LLVMBool

proc LLVMInitializeMCJITCompilerOptions*(options: ptr LLVMMCJITCompilerOptions;
                                        sizeOfOptions: csize)

##  Create an MCJIT execution engine for a module, with the given options. It is
##  the responsibility of the caller to ensure that all fields in Options up to
##  the given SizeOfOptions are initialized. It is correct to pass a smaller
##  value of SizeOfOptions that omits some fields. The canonical way of using
##  this is:
##  LLVMMCJITCompilerOptions options;
##  LLVMInitializeMCJITCompilerOptions(&options, sizeof(options));
##  ... fill in those options you care about
##  LLVMCreateMCJITCompilerForModule(&jit, mod, &options, sizeof(options),
##                                   &error);
##  Note that this is also correct, though possibly suboptimal:
##  LLVMCreateMCJITCompilerForModule(&jit, mod, 0, 0, &error);
proc LLVMCreateMCJITCompilerForModule*(outJIT: ptr LLVMExecutionEngineRef;
                                      m: LLVMModuleRef;
                                      options: ptr LLVMMCJITCompilerOptions;
                                      sizeOfOptions: csize; outError: cstringArray): LLVMBool

proc LLVMDisposeExecutionEngine*(ee: LLVMExecutionEngineRef)

proc LLVMRunStaticConstructors*(ee: LLVMExecutionEngineRef)

proc LLVMRunStaticDestructors*(ee: LLVMExecutionEngineRef)

proc LLVMRunFunctionAsMain*(ee: LLVMExecutionEngineRef; f: LLVMValueRef; argC: cuint;
                           argV: cstringArray; envP: cstringArray): cint

proc LLVMRunFunction*(ee: LLVMExecutionEngineRef; f: LLVMValueRef; numArgs: cuint;
                     args: ptr LLVMGenericValueRef): LLVMGenericValueRef

proc LLVMFreeMachineCodeForFunction*(ee: LLVMExecutionEngineRef; f: LLVMValueRef)

proc LLVMAddModule*(ee: LLVMExecutionEngineRef; m: LLVMModuleRef)

proc LLVMRemoveModule*(ee: LLVMExecutionEngineRef; m: LLVMModuleRef;
                      outMod: ptr LLVMModuleRef; outError: cstringArray): LLVMBool

proc LLVMFindFunction*(ee: LLVMExecutionEngineRef; name: cstring;
                      outFn: ptr LLVMValueRef): LLVMBool

proc LLVMRecompileAndRelinkFunction*(ee: LLVMExecutionEngineRef; fn: LLVMValueRef): pointer

proc LLVMGetExecutionEngineTargetData*(ee: LLVMExecutionEngineRef): LLVMTargetDataRef

proc LLVMGetExecutionEngineTargetMachine*(ee: LLVMExecutionEngineRef): LLVMTargetMachineRef

proc LLVMAddGlobalMapping*(ee: LLVMExecutionEngineRef; global: LLVMValueRef;
                          `addr`: pointer)

proc LLVMGetPointerToGlobal*(ee: LLVMExecutionEngineRef; global: LLVMValueRef): pointer

proc LLVMGetGlobalValueAddress*(ee: LLVMExecutionEngineRef; name: cstring): uint64T

proc LLVMGetFunctionAddress*(ee: LLVMExecutionEngineRef; name: cstring): uint64T

type
  LLVMMemoryManagerAllocateCodeSectionCallback* = proc (opaque: pointer;
      size: uintptrT; alignment: cuint; sectionID: cuint; sectionName: cstring): ptr uint8T

  LLVMMemoryManagerAllocateDataSectionCallback* = proc (opaque: pointer;
      size: uintptrT; alignment: cuint; sectionID: cuint; sectionName: cstring;
      isReadOnly: LLVMBool): ptr uint8T

  LLVMMemoryManagerFinalizeMemoryCallback* = proc (opaque: pointer;
      errMsg: cstringArray): LLVMBool

  LLVMMemoryManagerDestroyCallback* = proc (opaque: pointer)

##  Create a simple custom MCJIT memory manager. This memory manager can
##  intercept allocations in a module-oblivious way. This will return NULL
##  if any of the passed functions are NULL.
##  @param Opaque An opaque client object to pass back to the callbacks.
##  @param AllocateCodeSection Allocate a block of memory for executable code.
##  @param AllocateDataSection Allocate a block of memory for data.
##  @param FinalizeMemory Set page permissions and flush cache. Return 0 on
##    success, 1 on error.
proc LLVMCreateSimpleMCJITMemoryManager*(opaque: pointer; allocateCodeSection: LLVMMemoryManagerAllocateCodeSectionCallback;
    allocateDataSection: LLVMMemoryManagerAllocateDataSectionCallback;
    finalizeMemory: LLVMMemoryManagerFinalizeMemoryCallback; destroy: LLVMMemoryManagerDestroyCallback): LLVMMCJITMemoryManagerRef

proc LLVMDisposeMCJITMemoryManager*(mm: LLVMMCJITMemoryManagerRef)
