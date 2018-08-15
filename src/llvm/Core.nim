import Types, ErrorHandling

type
  LLVMOpcode* {.size: sizeof(cint).} = enum
    LLVMRet = 1,
    LLVMBr = 2,
    LLVMSwitch = 3,
    LLVMIndirectBr = 4,
    LLVMInvoke = 5,
    LLVMUnreachable = 7,
    LLVMAdd = 8,
    LLVMFAdd = 9,
    LLVMSub = 10,
    LLVMFSub = 11,
    LLVMMul = 12,
    LLVMFMul = 13,
    LLVMUDiv = 14,
    LLVMSDiv = 15,
    LLVMFDiv = 16,
    LLVMURem = 17,
    LLVMSRem = 18,
    LLVMFRem = 19,
    LLVMShl = 20,
    LLVMLShr = 21,
    LLVMAShr = 22,
    LLVMAnd = 23,
    LLVMOr = 24,
    LLVMXor = 25,
    LLVMAlloca = 26,
    LLVMLoad = 27,
    LLVMStore = 28,
    LLVMGetElementPtr = 29,
    LLVMTrunc = 30,
    LLVMZExt = 31,
    LLVMSExt = 32,
    LLVMFPToUI = 33,
    LLVMFPToSI = 34,
    LLVMUIToFP = 35,
    LLVMSIToFP = 36,
    LLVMFPTrunc = 37,
    LLVMFPExt = 38,
    LLVMPtrToInt = 39,
    LLVMIntToPtr = 40,
    LLVMBitCast = 41,
    LLVMICmp = 42,
    LLVMFCmp = 43,
    LLVMPHI = 44,
    LLVMCall = 45,
    LLVMSelect = 46,
    LLVMUserOp1 = 47,
    LLVMUserOp2 = 48,
    LLVMVAArg = 49,
    LLVMExtractElement = 50,
    LLVMInsertElement = 51,
    LLVMShuffleVector = 52,
    LLVMExtractValue = 53,
    LLVMInsertValue = 54,
    LLVMFence = 55,
    LLVMAtomicCmpXchg = 56,
    LLVMAtomicRMW = 57,
    LLVMResume = 58,
    LLVMLandingPad = 59,
    LLVMAddrSpaceCast = 60,
    LLVMCleanupRet = 61,
    LLVMCatchRet = 62,
    LLVMCatchPad = 63,
    LLVMCleanupPad = 64,
    LLVMCatchSwitch = 65

  LLVMTypeKind* {.size: sizeof(cint).} = enum
    LLVMVoidTypeKind,
    LLVMHalfTypeKind,
    LLVMFloatTypeKind,
    LLVMDoubleTypeKind,
    LLVMX86_FP80TypeKind,
    LLVMFP128TypeKind,
    LLVMPPC_FP128TypeKind,
    LLVMLabelTypeKind,
    LLVMIntegerTypeKind,
    LLVMFunctionTypeKind,
    LLVMStructTypeKind,
    LLVMArrayTypeKind,
    LLVMPointerTypeKind,
    LLVMVectorTypeKind,
    LLVMMetadataTypeKind,
    LLVMX86_MMXTypeKind,
    LLVMTokenTypeKind

  LLVMLinkage* {.size: sizeof(cint).} = enum
    LLVMExternalLinkage,
    LLVMAvailableExternallyLinkage,
    LLVMLinkOnceAnyLinkage,
    LLVMLinkOnceODRLinkage,
    LLVMLinkOnceODRAutoHideLinkage,
    LLVMWeakAnyLinkage,
    LLVMWeakODRLinkage,
    LLVMAppendingLinkage,
    LLVMInternalLinkage,
    LLVMPrivateLinkage,
    LLVMDLLImportLinkage,
    LLVMDLLExportLinkage,
    LLVMExternalWeakLinkage,
    LLVMGhostLinkage,
    LLVMCommonLinkage,
    LLVMLinkerPrivateLinkage,
    LLVMLinkerPrivateWeakLinkage

  LLVMVisibility* {.size: sizeof(cint).} = enum
    LLVMDefaultVisibility,
    LLVMHiddenVisibility,
    LLVMProtectedVisibility

  LLVMDLLStorageClass* {.size: sizeof(cint).} = enum
    LLVMDefaultStorageClass = 0,
    LLVMDLLImportStorageClass = 1,
    LLVMDLLExportStorageClass = 2

  LLVMCallConv* {.size: sizeof(cint).} = enum
    LLVMCCallConv = 0,
    LLVMFastCallConv = 8,
    LLVMColdCallConv = 9,
    LLVMWebKitJSCallConv = 12,
    LLVMAnyRegCallConv = 13,
    LLVMX86StdcallCallConv = 64,
    LLVMX86FastcallCallConv = 65

  LLVMValueKind* {.size: sizeof(cint).} = enum
    LLVMArgumentValueKind,
    LLVMBasicBlockValueKind,
    LLVMMemoryUseValueKind,
    LLVMMemoryDefValueKind,
    LLVMMemoryPhiValueKind,
    LLVMFunctionValueKind,
    LLVMGlobalAliasValueKind,
    LLVMGlobalIFuncValueKind,
    LLVMGlobalVariableValueKind,
    LLVMBlockAddressValueKind,
    LLVMConstantExprValueKind,
    LLVMConstantArrayValueKind,
    LLVMConstantStructValueKind,
    LLVMConstantVectorValueKind,
    LLVMUndefValueValueKind,
    LLVMConstantAggregateZeroValueKind,
    LLVMConstantDataArrayValueKind,
    LLVMConstantDataVectorValueKind,
    LLVMConstantIntValueKind,
    LLVMConstantFPValueKind,
    LLVMConstantPointerNullValueKind,
    LLVMConstantTokenNoneValueKind,
    LLVMMetadataAsValueValueKind,
    LLVMInlineAsmValueKind,
    LLVMInstructionValueKind

  LLVMIntPredicate* {.size: sizeof(cint).} = enum
    LLVMIntEQ = 32,
    LLVMIntNE,
    LLVMIntUGT,
    LLVMIntUGE,
    LLVMIntULT,
    LLVMIntULE,
    LLVMIntSGT,
    LLVMIntSGE,
    LLVMIntSLT,
    LLVMIntSLE

  LLVMRealPredicate* {.size: sizeof(cint).} = enum
    LLVMRealPredicateFalse,
    LLVMRealOEQ,
    LLVMRealOGT,
    LLVMRealOGE,
    LLVMRealOLT,
    LLVMRealOLE,
    LLVMRealONE,
    LLVMRealORD,
    LLVMRealUNO,
    LLVMRealUEQ,
    LLVMRealUGT,
    LLVMRealUGE,
    LLVMRealULT,
    LLVMRealULE,
    LLVMRealUNE,
    LLVMRealPredicateTrue

  LLVMLandingPadClauseTy* {.size: sizeof(cint).} = enum
    LLVMLandingPadCatch,
    LLVMLandingPadFilter

  LLVMThreadLocalMode* {.size: sizeof(cint).} = enum
    LLVMNotThreadLocal = 0,
    LLVMGeneralDynamicTLSModel,
    LLVMLocalDynamicTLSModel,
    LLVMInitialExecTLSModel,
    LLVMLocalExecTLSModel
     
  LLVMAtomicOrdering* {.size: sizeof(cint).} = enum
    LLVMAtomicOrderingNotAtomic = 0,
    LLVMAtomicOrderingUnordered = 1,
    LLVMAtomicOrderingMonotonic = 2,
    LLVMAtomicOrderingAcquire = 4,
    LLVMAtomicOrderingRelease = 5,
    LLVMAtomicOrderingAcquireRelease = 6,
    LLVMAtomicOrderingSequentiallyConsistent = 7

  LLVMAtomicRMWBinOp* {.size: sizeof(cint).} = enum
    LLVMAtomicRMWBinOpXchg,
    LLVMAtomicRMWBinOpAdd,
    LLVMAtomicRMWBinOpSub,
    LLVMAtomicRMWBinOpAnd,
    LLVMAtomicRMWBinOpNand,
    LLVMAtomicRMWBinOpOr,
    LLVMAtomicRMWBinOpXor,
    LLVMAtomicRMWBinOpMax,
    LLVMAtomicRMWBinOpMin,
    LLVMAtomicRMWBinOpUMax,
    LLVMAtomicRMWBinOpUMin

  LLVMDiagnosticSeverity* {.size: sizeof(cint).} = enum
    LLVMDSError,
    LLVMDSWarning,
    LLVMDSRemark,
    LLVMDSNote

const
  LLVMAttributeReturnIndex* = 0
  LLVMAttributeFunctionIndex* = -1

type
  LLVMAttributeIndex* = cuint

{.push cdecl, importc.}

proc LLVMInitializeCore*(R: LLVMPassRegistryRef)
proc LLVMShutdown*()
proc LLVMCreateMessage*(Message: cstring): cstring
proc LLVMDisposeMessage*(Message: cstring)

{.pop.}

type
  LLVMDiagnosticHandler* = proc(a2: LLVMDiagnosticInfoRef; a3: pointer) {.cdecl.}
  LLVMYieldCallback* = proc(a2: LLVMContextRef; a3: pointer) {.cdecl.}

{.push cdecl, importc.}

proc LLVMContextCreate*(): LLVMContextRef
proc LLVMGetGlobalContext*(): LLVMContextRef
proc LLVMContextSetDiagnosticHandler*(C: LLVMContextRef; Handler: LLVMDiagnosticHandler; DiagnosticContext: pointer)
proc LLVMContextGetDiagnosticHandler*(C: LLVMContextRef): LLVMDiagnosticHandler
proc LLVMContextGetDiagnosticContext*(C: LLVMContextRef): pointer
proc LLVMContextSetYieldCallback*(C: LLVMContextRef; Callback: LLVMYieldCallback; OpaqueHandle: pointer)
proc LLVMContextDispose*(C: LLVMContextRef)
proc LLVMGetDiagInfoDescription*(DI: LLVMDiagnosticInfoRef): cstring
proc LLVMGetDiagInfoSeverity*(DI: LLVMDiagnosticInfoRef): LLVMDiagnosticSeverity
proc LLVMGetMDKindIDInContext*(C: LLVMContextRef; Name: cstring; SLen: cuint): cuint
proc LLVMGetMDKindID*(Name: cstring; SLen: cuint): cuint
proc LLVMGetEnumAttributeKindForName*(Name: cstring; SLen: csize): cuint
proc LLVMGetLastEnumAttributeKind*(): cuint
proc LLVMCreateEnumAttribute*(C: LLVMContextRef; KindID: cuint; Val: uint64): LLVMAttributeRef
proc LLVMGetEnumAttributeKind*(A: LLVMAttributeRef): cuint
proc LLVMGetEnumAttributeValue*(A: LLVMAttributeRef): uint64
proc LLVMCreateStringAttribute*(C: LLVMContextRef; K: cstring; KLength: cuint; V: cstring; VLength: cuint): LLVMAttributeRef
proc LLVMGetStringAttributeKind*(A: LLVMAttributeRef; Length: ptr cuint): cstring
proc LLVMGetStringAttributeValue*(A: LLVMAttributeRef; Length: ptr cuint): cstring
proc LLVMIsEnumAttribute*(A: LLVMAttributeRef): bool
proc LLVMIsStringAttribute*(A: LLVMAttributeRef): bool
proc LLVMModuleCreateWithName*(ModuleID: cstring): LLVMModuleRef
proc LLVMModuleCreateWithNameInContext*(ModuleID: cstring; C: LLVMContextRef): LLVMModuleRef
proc LLVMCloneModule*(M: LLVMModuleRef): LLVMModuleRef
proc LLVMDisposeModule*(M: LLVMModuleRef)
proc LLVMGetModuleIdentifier*(M: LLVMModuleRef; Len: ptr csize): cstring
proc LLVMSetModuleIdentifier*(M: LLVMModuleRef; Ident: cstring; Len: csize)
proc LLVMGetDataLayoutStr*(M: LLVMModuleRef): cstring
proc LLVMGetDataLayout*(M: LLVMModuleRef): cstring
proc LLVMSetDataLayout*(M: LLVMModuleRef; DataLayoutStr: cstring)
proc LLVMGetTarget*(M: LLVMModuleRef): cstring
proc LLVMSetTarget*(M: LLVMModuleRef; Triple: cstring)
proc LLVMDumpModule*(M: LLVMModuleRef)
proc LLVMPrintModuleToFile*(M: LLVMModuleRef; Filename: cstring; ErrorMessage: cstringArray): bool
proc LLVMPrintModuleToString*(M: LLVMModuleRef): cstring
proc LLVMSetModuleInlineAsm*(M: LLVMModuleRef; Asm: cstring)
proc LLVMGetModuleContext*(M: LLVMModuleRef): LLVMContextRef
proc LLVMGetTypeByName*(M: LLVMModuleRef; Name: cstring): LLVMTypeRef
proc LLVMGetNamedMetadataNumOperands*(M: LLVMModuleRef; Name: cstring): cuint
proc LLVMGetNamedMetadataOperands*(M: LLVMModuleRef; Name: cstring; Dest: ptr LLVMValueRef)
proc LLVMAddNamedMetadataOperand*(M: LLVMModuleRef; Name: cstring; Val: LLVMValueRef)
proc LLVMAddFunction*(M: LLVMModuleRef; Name: cstring; FunctionTy: LLVMTypeRef): LLVMValueRef
proc LLVMGetNamedFunction*(M: LLVMModuleRef; Name: cstring): LLVMValueRef
proc LLVMGetFirstFunction*(M: LLVMModuleRef): LLVMValueRef
proc LLVMGetLastFunction*(M: LLVMModuleRef): LLVMValueRef
proc LLVMGetNextFunction*(Fn: LLVMValueRef): LLVMValueRef
proc LLVMGetPreviousFunction*(Fn: LLVMValueRef): LLVMValueRef
proc LLVMGetTypeKind*(Ty: LLVMTypeRef): LLVMTypeKind
proc LLVMTypeIsSized*(Ty: LLVMTypeRef): bool
proc LLVMGetTypeContext*(Ty: LLVMTypeRef): LLVMContextRef
proc LLVMDumpType*(Val: LLVMTypeRef)
proc LLVMPrintTypeToString*(Val: LLVMTypeRef): cstring
proc LLVMInt1TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMInt8TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMInt16TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMInt32TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMInt64TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMInt128TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMIntTypeInContext*(C: LLVMContextRef; NumBits: cuint): LLVMTypeRef
proc LLVMInt1Type*(): LLVMTypeRef
proc LLVMInt8Type*(): LLVMTypeRef
proc LLVMInt16Type*(): LLVMTypeRef
proc LLVMInt32Type*(): LLVMTypeRef
proc LLVMInt64Type*(): LLVMTypeRef
proc LLVMInt128Type*(): LLVMTypeRef
proc LLVMIntType*(NumBits: cuint): LLVMTypeRef
proc LLVMGetIntTypeWidth*(IntegerTy: LLVMTypeRef): cuint
proc LLVMHalfTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMFloatTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMDoubleTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMX86FP80TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMFP128TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMPPCFP128TypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMHalfType*(): LLVMTypeRef
proc LLVMFloatType*(): LLVMTypeRef
proc LLVMDoubleType*(): LLVMTypeRef
proc LLVMX86FP80Type*(): LLVMTypeRef
proc LLVMFP128Type*(): LLVMTypeRef
proc LLVMPPCFP128Type*(): LLVMTypeRef
proc LLVMFunctionType*(ReturnType: LLVMTypeRef; ParamTypes: ptr LLVMTypeRef; ParamCount: cuint; IsVarArg: bool): LLVMTypeRef
proc LLVMIsFunctionVarArg*(FunctionTy: LLVMTypeRef): bool
proc LLVMGetReturnType*(FunctionTy: LLVMTypeRef): LLVMTypeRef
proc LLVMCountParamTypes*(FunctionTy: LLVMTypeRef): cuint
proc LLVMGetParamTypes*(FunctionTy: LLVMTypeRef; Dest: ptr LLVMTypeRef)
proc LLVMStructTypeInContext*(C: LLVMContextRef; ElementTypes: ptr LLVMTypeRef; ElementCount: cuint; Packed: bool): LLVMTypeRef
proc LLVMStructType*(ElementTypes: ptr LLVMTypeRef; ElementCount: cuint; Packed: bool): LLVMTypeRef
proc LLVMStructCreateNamed*(C: LLVMContextRef; Name: cstring): LLVMTypeRef
proc LLVMGetStructName*(Ty: LLVMTypeRef): cstring
proc LLVMStructSetBody*(StructTy: LLVMTypeRef; ElementTypes: ptr LLVMTypeRef; ElementCount: cuint; Packed: bool)
proc LLVMCountStructElementTypes*(StructTy: LLVMTypeRef): cuint
proc LLVMGetStructElementTypes*(StructTy: LLVMTypeRef; Dest: ptr LLVMTypeRef)
proc LLVMStructGetTypeAtIndex*(StructTy: LLVMTypeRef; i: cuint): LLVMTypeRef
proc LLVMIsPackedStruct*(StructTy: LLVMTypeRef): bool
proc LLVMIsOpaqueStruct*(StructTy: LLVMTypeRef): bool
proc LLVMGetElementType*(Ty: LLVMTypeRef): LLVMTypeRef
proc LLVMGetSubtypes*(Tp: LLVMTypeRef; Arr: ptr LLVMTypeRef)
proc LLVMGetNumContainedTypes*(Tp: LLVMTypeRef): cuint
proc LLVMArrayType*(ElementType: LLVMTypeRef; ElementCount: cuint): LLVMTypeRef
proc LLVMGetArrayLength*(ArrayTy: LLVMTypeRef): cuint
proc LLVMPointerType*(ElementType: LLVMTypeRef; AddressSpace: cuint): LLVMTypeRef
proc LLVMGetPointerAddressSpace*(PointerTy: LLVMTypeRef): cuint
proc LLVMVectorType*(ElementType: LLVMTypeRef; ElementCount: cuint): LLVMTypeRef
proc LLVMGetVectorSize*(VectorTy: LLVMTypeRef): cuint
proc LLVMVoidTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMLabelTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMX86MMXTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMTokenTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMMetadataTypeInContext*(C: LLVMContextRef): LLVMTypeRef
proc LLVMVoidType*(): LLVMTypeRef
proc LLVMLabelType*(): LLVMTypeRef
proc LLVMX86MMXType*(): LLVMTypeRef
proc LLVMTypeOf*(Val: LLVMValueRef): LLVMTypeRef
proc LLVMGetValueKind*(Val: LLVMValueRef): LLVMValueKind
proc LLVMGetValueName*(Val: LLVMValueRef): cstring
proc LLVMSetValueName*(Val: LLVMValueRef; Name: cstring)
proc LLVMDumpValue*(Val: LLVMValueRef)
proc LLVMPrintValueToString*(Val: LLVMValueRef): cstring
proc LLVMReplaceAllUsesWith*(OldVal: LLVMValueRef; NewVal: LLVMValueRef)
proc LLVMIsConstant*(Val: LLVMValueRef): bool
proc LLVMIsUndef*(Val: LLVMValueRef): bool
proc LLVMIsAArgument*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsABasicBlock*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAInlineAsm*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAUser*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstant*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsABlockAddress*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantAggregateZero*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantArray*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantDataSequential*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantDataArray*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantDataVector*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantExpr*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantFP*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantInt*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantPointerNull*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantStruct*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantTokenNone*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAConstantVector*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAGlobalValue*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAGlobalAlias*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAGlobalObject*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFunction*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAGlobalVariable*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAUndefValue*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAInstruction*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsABinaryOperator*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACallInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAIntrinsicInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsADbgInfoIntrinsic*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsADbgDeclareInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAMemIntrinsic*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAMemCpyInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAMemMoveInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAMemSetInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACmpInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFCmpInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAICmpInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAExtractElementInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAGetElementPtrInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAInsertElementInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAInsertValueInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsALandingPadInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAPHINode*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsASelectInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAShuffleVectorInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAStoreInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsATerminatorInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsABranchInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAIndirectBrInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAInvokeInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAReturnInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsASwitchInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAUnreachableInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAResumeInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACleanupReturnInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACatchReturnInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFuncletPadInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACatchPadInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACleanupPadInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAUnaryInstruction*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAAllocaInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsACastInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAAddrSpaceCastInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsABitCastInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFPExtInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFPToSIInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFPToUIInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAFPTruncInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAIntToPtrInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAPtrToIntInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsASExtInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsASIToFPInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsATruncInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAUIToFPInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAZExtInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAExtractValueInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsALoadInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAVAArgInst*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAMDNode*(Val: LLVMValueRef): LLVMValueRef
proc LLVMIsAMDString*(Val: LLVMValueRef): LLVMValueRef
proc LLVMGetFirstUse*(Val: LLVMValueRef): LLVMUseRef
proc LLVMGetNextUse*(U: LLVMUseRef): LLVMUseRef
proc LLVMGetUser*(U: LLVMUseRef): LLVMValueRef
proc LLVMGetUsedValue*(U: LLVMUseRef): LLVMValueRef
proc LLVMGetOperand*(Val: LLVMValueRef; Index: cuint): LLVMValueRef
proc LLVMGetOperandUse*(Val: LLVMValueRef; Index: cuint): LLVMUseRef
proc LLVMSetOperand*(User: LLVMValueRef; Index: cuint; Val: LLVMValueRef)
proc LLVMGetNumOperands*(Val: LLVMValueRef): cint
proc LLVMConstNull*(Ty: LLVMTypeRef): LLVMValueRef
proc LLVMConstAllOnes*(Ty: LLVMTypeRef): LLVMValueRef
proc LLVMGetUndef*(Ty: LLVMTypeRef): LLVMValueRef
proc LLVMIsNull*(Val: LLVMValueRef): bool
proc LLVMConstPointerNull*(Ty: LLVMTypeRef): LLVMValueRef
proc LLVMConstInt*(IntTy: LLVMTypeRef; N: culonglong; SignExtend: bool): LLVMValueRef
proc LLVMConstIntOfArbitraryPrecision*(IntTy: LLVMTypeRef; NumWords: cuint; Words: ptr uint64): LLVMValueRef
proc LLVMConstIntOfString*(IntTy: LLVMTypeRef; Text: cstring; Radix: uint8): LLVMValueRef
proc LLVMConstIntOfStringAndSize*(IntTy: LLVMTypeRef; Text: cstring; SLen: cuint; Radix: uint8): LLVMValueRef
proc LLVMConstReal*(RealTy: LLVMTypeRef; N: cdouble): LLVMValueRef
proc LLVMConstRealOfString*(RealTy: LLVMTypeRef; Text: cstring): LLVMValueRef
proc LLVMConstRealOfStringAndSize*(RealTy: LLVMTypeRef; Text: cstring; SLen: cuint): LLVMValueRef
proc LLVMConstIntGetZExtValue*(ConstantVal: LLVMValueRef): culonglong
proc LLVMConstIntGetSExtValue*(ConstantVal: LLVMValueRef): clonglong
proc LLVMConstRealGetDouble*(ConstantVal: LLVMValueRef; losesInfo: ptr bool): cdouble
proc LLVMConstStringInContext*(C: LLVMContextRef; Str: cstring; Length: cuint; DontNullTerminate: bool): LLVMValueRef
proc LLVMConstString*(Str: cstring; Length: cuint; DontNullTerminate: bool): LLVMValueRef
proc LLVMIsConstantString*(c: LLVMValueRef): bool
proc LLVMGetAsString*(c: LLVMValueRef; Length: ptr csize): cstring
proc LLVMConstStructInContext*(C: LLVMContextRef; ConstantVals: ptr LLVMValueRef; Count: cuint; Packed: bool): LLVMValueRef
proc LLVMConstStruct*(ConstantVals: ptr LLVMValueRef; Count: cuint; Packed: bool): LLVMValueRef
proc LLVMConstArray*(ElementTy: LLVMTypeRef; ConstantVals: ptr LLVMValueRef; Length: cuint): LLVMValueRef
proc LLVMConstNamedStruct*(StructTy: LLVMTypeRef; ConstantVals: ptr LLVMValueRef; Count: cuint): LLVMValueRef
proc LLVMGetElementAsConstant*(C: LLVMValueRef; idx: cuint): LLVMValueRef
proc LLVMConstVector*(ScalarConstantVals: ptr LLVMValueRef; Size: cuint): LLVMValueRef
proc LLVMGetConstOpcode*(ConstantVal: LLVMValueRef): LLVMOpcode
proc LLVMAlignOf*(Ty: LLVMTypeRef): LLVMValueRef
proc LLVMSizeOf*(Ty: LLVMTypeRef): LLVMValueRef
proc LLVMConstNeg*(ConstantVal: LLVMValueRef): LLVMValueRef
proc LLVMConstNSWNeg*(ConstantVal: LLVMValueRef): LLVMValueRef
proc LLVMConstNUWNeg*(ConstantVal: LLVMValueRef): LLVMValueRef
proc LLVMConstFNeg*(ConstantVal: LLVMValueRef): LLVMValueRef
proc LLVMConstNot*(ConstantVal: LLVMValueRef): LLVMValueRef
proc LLVMConstAdd*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstNSWAdd*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstNUWAdd*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstFAdd*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstSub*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstNSWSub*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstNUWSub*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstFSub*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstMul*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstNSWMul*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstNUWMul*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstFMul*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstUDiv*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstExactUDiv*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstSDiv*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstExactSDiv*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstFDiv*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstURem*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstSRem*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstFRem*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstAnd*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstOr*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstXor*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstICmp*(Predicate: LLVMIntPredicate; LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstFCmp*(Predicate: LLVMRealPredicate; LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstShl*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstLShr*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstAShr*(LHSConstant: LLVMValueRef; RHSConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstGEP*(ConstantVal: LLVMValueRef; ConstantIndices: ptr LLVMValueRef; NumIndices: cuint): LLVMValueRef
proc LLVMConstInBoundsGEP*(ConstantVal: LLVMValueRef; ConstantIndices: ptr LLVMValueRef; NumIndices: cuint): LLVMValueRef
proc LLVMConstTrunc*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstSExt*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstZExt*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstFPTrunc*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstFPExt*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstUIToFP*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstSIToFP*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstFPToUI*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstFPToSI*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstPtrToInt*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstIntToPtr*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstBitCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstAddrSpaceCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstZExtOrBitCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstSExtOrBitCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstTruncOrBitCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstPointerCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstIntCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef; isSigned: bool): LLVMValueRef
proc LLVMConstFPCast*(ConstantVal: LLVMValueRef; ToType: LLVMTypeRef): LLVMValueRef
proc LLVMConstSelect*(ConstantCondition: LLVMValueRef; ConstantIfTrue: LLVMValueRef; ConstantIfFalse: LLVMValueRef): LLVMValueRef
proc LLVMConstExtractElement*(VectorConstant: LLVMValueRef; IndexConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstInsertElement*(VectorConstant: LLVMValueRef; ElementValueConstant: LLVMValueRef; IndexConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstShuffleVector*(VectorAConstant: LLVMValueRef; VectorBConstant: LLVMValueRef; MaskConstant: LLVMValueRef): LLVMValueRef
proc LLVMConstExtractValue*(AggConstant: LLVMValueRef; IdxList: ptr cuint; NumIdx: cuint): LLVMValueRef
proc LLVMConstInsertValue*(AggConstant: LLVMValueRef; ElementValueConstant: LLVMValueRef; IdxList: ptr cuint; NumIdx: cuint): LLVMValueRef
proc LLVMConstInlineAsm*(Ty: LLVMTypeRef; AsmString: cstring; Constraints: cstring; HasSideEffects: bool; IsAlignStack: bool): LLVMValueRef
proc LLVMBlockAddress*(F: LLVMValueRef; BB: LLVMBasicBlockRef): LLVMValueRef
proc LLVMGetGlobalParent*(Global: LLVMValueRef): LLVMModuleRef
proc LLVMIsDeclaration*(Global: LLVMValueRef): bool
proc LLVMGetLinkage*(Global: LLVMValueRef): LLVMLinkage
proc LLVMSetLinkage*(Global: LLVMValueRef; Linkage: LLVMLinkage)
proc LLVMGetSection*(Global: LLVMValueRef): cstring
proc LLVMSetSection*(Global: LLVMValueRef; Section: cstring)
proc LLVMGetVisibility*(Global: LLVMValueRef): LLVMVisibility
proc LLVMSetVisibility*(Global: LLVMValueRef; Viz: LLVMVisibility)
proc LLVMGetDLLStorageClass*(Global: LLVMValueRef): LLVMDLLStorageClass
proc LLVMSetDLLStorageClass*(Global: LLVMValueRef; Class: LLVMDLLStorageClass)
proc LLVMHasUnnamedAddr*(Global: LLVMValueRef): bool
proc LLVMSetUnnamedAddr*(Global: LLVMValueRef; HasUnnamedAddr: bool)
proc LLVMGetAlignment*(V: LLVMValueRef): cuint
proc LLVMSetAlignment*(V: LLVMValueRef; Bytes: cuint)
proc LLVMAddGlobal*(M: LLVMModuleRef; Ty: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMAddGlobalInAddressSpace*(M: LLVMModuleRef; Ty: LLVMTypeRef; Name: cstring; AddressSpace: cuint): LLVMValueRef
proc LLVMGetNamedGlobal*(M: LLVMModuleRef; Name: cstring): LLVMValueRef
proc LLVMGetFirstGlobal*(M: LLVMModuleRef): LLVMValueRef
proc LLVMGetLastGlobal*(M: LLVMModuleRef): LLVMValueRef
proc LLVMGetNextGlobal*(GlobalVar: LLVMValueRef): LLVMValueRef
proc LLVMGetPreviousGlobal*(GlobalVar: LLVMValueRef): LLVMValueRef
proc LLVMDeleteGlobal*(GlobalVar: LLVMValueRef)
proc LLVMGetInitializer*(GlobalVar: LLVMValueRef): LLVMValueRef
proc LLVMSetInitializer*(GlobalVar: LLVMValueRef; ConstantVal: LLVMValueRef)
proc LLVMIsThreadLocal*(GlobalVar: LLVMValueRef): bool
proc LLVMSetThreadLocal*(GlobalVar: LLVMValueRef; IsThreadLocal: bool)
proc LLVMIsGlobalConstant*(GlobalVar: LLVMValueRef): bool
proc LLVMSetGlobalConstant*(GlobalVar: LLVMValueRef; IsConstant: bool)
proc LLVMGetThreadLocalMode*(GlobalVar: LLVMValueRef): LLVMThreadLocalMode
proc LLVMSetThreadLocalMode*(GlobalVar: LLVMValueRef; Mode: LLVMThreadLocalMode)
proc LLVMIsExternallyInitialized*(GlobalVar: LLVMValueRef): bool
proc LLVMSetExternallyInitialized*(GlobalVar: LLVMValueRef; IsExtInit: bool)
proc LLVMAddAlias*(M: LLVMModuleRef; Ty: LLVMTypeRef; Aliasee: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMDeleteFunction*(Fn: LLVMValueRef)
proc LLVMHasPersonalityFn*(Fn: LLVMValueRef): bool
proc LLVMGetPersonalityFn*(Fn: LLVMValueRef): LLVMValueRef
proc LLVMSetPersonalityFn*(Fn: LLVMValueRef; PersonalityFn: LLVMValueRef)
proc LLVMGetIntrinsicID*(Fn: LLVMValueRef): cuint
proc LLVMGetFunctionCallConv*(Fn: LLVMValueRef): cuint
proc LLVMSetFunctionCallConv*(Fn: LLVMValueRef; CC: cuint)
proc LLVMGetGC*(Fn: LLVMValueRef): cstring
proc LLVMSetGC*(Fn: LLVMValueRef; Name: cstring)
proc LLVMAddAttributeAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex; A: LLVMAttributeRef)
proc LLVMGetAttributeCountAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex): cuint
proc LLVMGetAttributesAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex; Attrs: ptr LLVMAttributeRef)
proc LLVMGetEnumAttributeAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: cuint): LLVMAttributeRef
proc LLVMGetStringAttributeAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex; K: cstring; KLen: cuint): LLVMAttributeRef
proc LLVMRemoveEnumAttributeAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: cuint)
proc LLVMRemoveStringAttributeAtIndex*(F: LLVMValueRef; Idx: LLVMAttributeIndex; K: cstring; KLen: cuint)
proc LLVMAddTargetDependentFunctionAttr*(Fn: LLVMValueRef; A: cstring; V: cstring)
proc LLVMCountParams*(Fn: LLVMValueRef): cuint
proc LLVMGetParams*(Fn: LLVMValueRef; Params: ptr LLVMValueRef)
proc LLVMGetParam*(Fn: LLVMValueRef; Index: cuint): LLVMValueRef
proc LLVMGetParamParent*(Inst: LLVMValueRef): LLVMValueRef
proc LLVMGetFirstParam*(Fn: LLVMValueRef): LLVMValueRef
proc LLVMGetLastParam*(Fn: LLVMValueRef): LLVMValueRef
proc LLVMGetNextParam*(Arg: LLVMValueRef): LLVMValueRef
proc LLVMGetPreviousParam*(Arg: LLVMValueRef): LLVMValueRef
proc LLVMSetParamAlignment*(Arg: LLVMValueRef; Align: cuint)
proc LLVMMDStringInContext*(C: LLVMContextRef; Str: cstring; SLen: cuint): LLVMValueRef
proc LLVMMDString*(Str: cstring; SLen: cuint): LLVMValueRef
proc LLVMMDNodeInContext*(C: LLVMContextRef; Vals: ptr LLVMValueRef; Count: cuint): LLVMValueRef
proc LLVMMDNode*(Vals: ptr LLVMValueRef; Count: cuint): LLVMValueRef
proc LLVMMetadataAsValue*(C: LLVMContextRef; MD: LLVMMetadataRef): LLVMValueRef
proc LLVMValueAsMetadata*(Val: LLVMValueRef): LLVMMetadataRef
proc LLVMGetMDString*(V: LLVMValueRef; Length: ptr cuint): cstring
proc LLVMGetMDNodeNumOperands*(V: LLVMValueRef): cuint
proc LLVMGetMDNodeOperands*(V: LLVMValueRef; Dest: ptr LLVMValueRef)
proc LLVMBasicBlockAsValue*(BB: LLVMBasicBlockRef): LLVMValueRef
proc LLVMValueIsBasicBlock*(Val: LLVMValueRef): bool
proc LLVMValueAsBasicBlock*(Val: LLVMValueRef): LLVMBasicBlockRef
proc LLVMGetBasicBlockName*(BB: LLVMBasicBlockRef): cstring
proc LLVMGetBasicBlockParent*(BB: LLVMBasicBlockRef): LLVMValueRef
proc LLVMGetBasicBlockTerminator*(BB: LLVMBasicBlockRef): LLVMValueRef
proc LLVMCountBasicBlocks*(Fn: LLVMValueRef): cuint
proc LLVMGetBasicBlocks*(Fn: LLVMValueRef; BasicBlocks: ptr LLVMBasicBlockRef)
proc LLVMGetFirstBasicBlock*(Fn: LLVMValueRef): LLVMBasicBlockRef
proc LLVMGetLastBasicBlock*(Fn: LLVMValueRef): LLVMBasicBlockRef
proc LLVMGetNextBasicBlock*(BB: LLVMBasicBlockRef): LLVMBasicBlockRef
proc LLVMGetPreviousBasicBlock*(BB: LLVMBasicBlockRef): LLVMBasicBlockRef
proc LLVMGetEntryBasicBlock*(Fn: LLVMValueRef): LLVMBasicBlockRef
proc LLVMAppendBasicBlockInContext*(C: LLVMContextRef; Fn: LLVMValueRef; Name: cstring): LLVMBasicBlockRef
proc LLVMAppendBasicBlock*(Fn: LLVMValueRef; Name: cstring): LLVMBasicBlockRef
proc LLVMInsertBasicBlockInContext*(C: LLVMContextRef; BB: LLVMBasicBlockRef; Name: cstring): LLVMBasicBlockRef
proc LLVMInsertBasicBlock*(InsertBeforeBB: LLVMBasicBlockRef; Name: cstring): LLVMBasicBlockRef
proc LLVMDeleteBasicBlock*(BB: LLVMBasicBlockRef)
proc LLVMRemoveBasicBlockFromParent*(BB: LLVMBasicBlockRef)
proc LLVMMoveBasicBlockBefore*(BB: LLVMBasicBlockRef; MovePos: LLVMBasicBlockRef)
proc LLVMMoveBasicBlockAfter*(BB: LLVMBasicBlockRef; MovePos: LLVMBasicBlockRef)
proc LLVMGetFirstInstruction*(BB: LLVMBasicBlockRef): LLVMValueRef
proc LLVMGetLastInstruction*(BB: LLVMBasicBlockRef): LLVMValueRef
proc LLVMHasMetadata*(Val: LLVMValueRef): cint
proc LLVMGetMetadata*(Val: LLVMValueRef; KindID: cuint): LLVMValueRef
proc LLVMSetMetadata*(Val: LLVMValueRef; KindID: cuint; Node: LLVMValueRef)
proc LLVMGetInstructionParent*(Inst: LLVMValueRef): LLVMBasicBlockRef
proc LLVMGetNextInstruction*(Inst: LLVMValueRef): LLVMValueRef
proc LLVMGetPreviousInstruction*(Inst: LLVMValueRef): LLVMValueRef
proc LLVMInstructionRemoveFromParent*(Inst: LLVMValueRef)
proc LLVMInstructionEraseFromParent*(Inst: LLVMValueRef)
proc LLVMGetInstructionOpcode*(Inst: LLVMValueRef): LLVMOpcode
proc LLVMGetICmpPredicate*(Inst: LLVMValueRef): LLVMIntPredicate
proc LLVMGetFCmpPredicate*(Inst: LLVMValueRef): LLVMRealPredicate
proc LLVMInstructionClone*(Inst: LLVMValueRef): LLVMValueRef
proc LLVMGetNumArgOperands*(Instr: LLVMValueRef): cuint
proc LLVMSetInstructionCallConv*(Instr: LLVMValueRef; CC: cuint)
proc LLVMGetInstructionCallConv*(Instr: LLVMValueRef): cuint
proc LLVMSetInstrParamAlignment*(Instr: LLVMValueRef; index: cuint; Align: cuint)
proc LLVMAddCallSiteAttribute*(C: LLVMValueRef; Idx: LLVMAttributeIndex; A: LLVMAttributeRef)
proc LLVMGetCallSiteAttributeCount*(C: LLVMValueRef; Idx: LLVMAttributeIndex): cuint
proc LLVMGetCallSiteAttributes*(C: LLVMValueRef; Idx: LLVMAttributeIndex; Attrs: ptr LLVMAttributeRef)
proc LLVMGetCallSiteEnumAttribute*(C: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: cuint): LLVMAttributeRef
proc LLVMGetCallSiteStringAttribute*(C: LLVMValueRef; Idx: LLVMAttributeIndex; K: cstring; KLen: cuint): LLVMAttributeRef
proc LLVMRemoveCallSiteEnumAttribute*(C: LLVMValueRef; Idx: LLVMAttributeIndex; KindID: cuint)
proc LLVMRemoveCallSiteStringAttribute*(C: LLVMValueRef; Idx: LLVMAttributeIndex; K: cstring; KLen: cuint)
proc LLVMGetCalledValue*(Instr: LLVMValueRef): LLVMValueRef
proc LLVMIsTailCall*(CallInst: LLVMValueRef): bool
proc LLVMSetTailCall*(CallInst: LLVMValueRef; IsTailCall: bool)
proc LLVMGetNormalDest*(InvokeInst: LLVMValueRef): LLVMBasicBlockRef
proc LLVMGetUnwindDest*(InvokeInst: LLVMValueRef): LLVMBasicBlockRef
proc LLVMSetNormalDest*(InvokeInst: LLVMValueRef; B: LLVMBasicBlockRef)
proc LLVMSetUnwindDest*(InvokeInst: LLVMValueRef; B: LLVMBasicBlockRef)
proc LLVMGetNumSuccessors*(Term: LLVMValueRef): cuint
proc LLVMGetSuccessor*(Term: LLVMValueRef; i: cuint): LLVMBasicBlockRef
proc LLVMSetSuccessor*(Term: LLVMValueRef; i: cuint; `block`: LLVMBasicBlockRef)
proc LLVMIsConditional*(Branch: LLVMValueRef): bool
proc LLVMGetCondition*(Branch: LLVMValueRef): LLVMValueRef
proc LLVMSetCondition*(Branch: LLVMValueRef; Cond: LLVMValueRef)
proc LLVMGetSwitchDefaultDest*(SwitchInstr: LLVMValueRef): LLVMBasicBlockRef
proc LLVMGetAllocatedType*(Alloca: LLVMValueRef): LLVMTypeRef
proc LLVMIsInBounds*(GEP: LLVMValueRef): bool
proc LLVMSetIsInBounds*(GEP: LLVMValueRef; InBounds: bool)
proc LLVMAddIncoming*(PhiNode: LLVMValueRef; IncomingValues: ptr LLVMValueRef; IncomingBlocks: ptr LLVMBasicBlockRef; Count: cuint)
proc LLVMCountIncoming*(PhiNode: LLVMValueRef): cuint
proc LLVMGetIncomingValue*(PhiNode: LLVMValueRef; Index: cuint): LLVMValueRef
proc LLVMGetIncomingBlock*(PhiNode: LLVMValueRef; Index: cuint): LLVMBasicBlockRef
proc LLVMGetNumIndices*(Inst: LLVMValueRef): cuint
proc LLVMGetIndices*(Inst: LLVMValueRef): ptr cuint
proc LLVMCreateBuilderInContext*(C: LLVMContextRef): LLVMBuilderRef
proc LLVMCreateBuilder*(): LLVMBuilderRef
proc LLVMPositionBuilder*(Builder: LLVMBuilderRef; Block: LLVMBasicBlockRef; Instr: LLVMValueRef)
proc LLVMPositionBuilderBefore*(Builder: LLVMBuilderRef; Instr: LLVMValueRef)
proc LLVMPositionBuilderAtEnd*(Builder: LLVMBuilderRef; Block: LLVMBasicBlockRef)
proc LLVMGetInsertBlock*(Builder: LLVMBuilderRef): LLVMBasicBlockRef
proc LLVMClearInsertionPosition*(Builder: LLVMBuilderRef)
proc LLVMInsertIntoBuilder*(Builder: LLVMBuilderRef; Instr: LLVMValueRef)
proc LLVMInsertIntoBuilderWithName*(Builder: LLVMBuilderRef; Instr: LLVMValueRef; Name: cstring)
proc LLVMDisposeBuilder*(Builder: LLVMBuilderRef)
proc LLVMSetCurrentDebugLocation*(Builder: LLVMBuilderRef; L: LLVMValueRef)
proc LLVMGetCurrentDebugLocation*(Builder: LLVMBuilderRef): LLVMValueRef
proc LLVMSetInstDebugLocation*(Builder: LLVMBuilderRef; Inst: LLVMValueRef)
proc LLVMBuildRetVoid*(a2: LLVMBuilderRef): LLVMValueRef
proc LLVMBuildRet*(a2: LLVMBuilderRef; V: LLVMValueRef): LLVMValueRef
proc LLVMBuildAggregateRet*(a2: LLVMBuilderRef; RetVals: ptr LLVMValueRef; N: cuint): LLVMValueRef
proc LLVMBuildBr*(a2: LLVMBuilderRef; Dest: LLVMBasicBlockRef): LLVMValueRef
proc LLVMBuildCondBr*(a2: LLVMBuilderRef; If: LLVMValueRef; Then: LLVMBasicBlockRef; Else: LLVMBasicBlockRef): LLVMValueRef
proc LLVMBuildSwitch*(a2: LLVMBuilderRef; V: LLVMValueRef; Else: LLVMBasicBlockRef; NumCases: cuint): LLVMValueRef
proc LLVMBuildIndirectBr*(B: LLVMBuilderRef; Addr: LLVMValueRef; NumDests: cuint): LLVMValueRef
proc LLVMBuildInvoke*(a2: LLVMBuilderRef; Fn: LLVMValueRef; Args: ptr LLVMValueRef; NumArgs: cuint; Then: LLVMBasicBlockRef; Catch: LLVMBasicBlockRef; Name: cstring): LLVMValueRef
proc LLVMBuildLandingPad*(B: LLVMBuilderRef; Ty: LLVMTypeRef; PersFn: LLVMValueRef; NumClauses: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildResume*(B: LLVMBuilderRef; Exn: LLVMValueRef): LLVMValueRef
proc LLVMBuildUnreachable*(a2: LLVMBuilderRef): LLVMValueRef
proc LLVMAddCase*(Switch: LLVMValueRef; OnVal: LLVMValueRef; Dest: LLVMBasicBlockRef)
proc LLVMAddDestination*(IndirectBr: LLVMValueRef; Dest: LLVMBasicBlockRef)
proc LLVMGetNumClauses*(LandingPad: LLVMValueRef): cuint
proc LLVMGetClause*(LandingPad: LLVMValueRef; Idx: cuint): LLVMValueRef
proc LLVMAddClause*(LandingPad: LLVMValueRef; ClauseVal: LLVMValueRef)
proc LLVMIsCleanup*(LandingPad: LLVMValueRef): bool
proc LLVMSetCleanup*(LandingPad: LLVMValueRef; Val: bool)
proc LLVMBuildAdd*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNSWAdd*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNUWAdd*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFAdd*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildSub*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNSWSub*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNUWSub*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFSub*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildMul*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNSWMul*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNUWMul*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFMul*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildUDiv*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildExactUDiv*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildSDiv*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildExactSDiv*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFDiv*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildURem*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildSRem*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFRem*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildShl*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildLShr*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildAShr*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildAnd*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildOr*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildXor*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildBinOp*(B: LLVMBuilderRef; Op: LLVMOpcode; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNeg*(a2: LLVMBuilderRef; V: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNSWNeg*(B: LLVMBuilderRef; V: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNUWNeg*(B: LLVMBuilderRef; V: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFNeg*(a2: LLVMBuilderRef; V: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildNot*(a2: LLVMBuilderRef; V: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildMalloc*(a2: LLVMBuilderRef; Ty: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildArrayMalloc*(a2: LLVMBuilderRef; Ty: LLVMTypeRef; Val: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildAlloca*(a2: LLVMBuilderRef; Ty: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildArrayAlloca*(a2: LLVMBuilderRef; Ty: LLVMTypeRef; Val: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFree*(a2: LLVMBuilderRef; PointerVal: LLVMValueRef): LLVMValueRef
proc LLVMBuildLoad*(a2: LLVMBuilderRef; PointerVal: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildStore*(a2: LLVMBuilderRef; Val: LLVMValueRef; Ptr: LLVMValueRef): LLVMValueRef
proc LLVMBuildGEP*(B: LLVMBuilderRef; Pointer: LLVMValueRef; Indices: ptr LLVMValueRef; NumIndices: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildInBoundsGEP*(B: LLVMBuilderRef; Pointer: LLVMValueRef; Indices: ptr LLVMValueRef; NumIndices: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildStructGEP*(B: LLVMBuilderRef; Pointer: LLVMValueRef; Idx: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildGlobalString*(B: LLVMBuilderRef; Str: cstring; Name: cstring): LLVMValueRef
proc LLVMBuildGlobalStringPtr*(B: LLVMBuilderRef; Str: cstring; Name: cstring): LLVMValueRef
proc LLVMGetVolatile*(MemoryAccessInst: LLVMValueRef): bool
proc LLVMSetVolatile*(MemoryAccessInst: LLVMValueRef; IsVolatile: bool)
proc LLVMGetOrdering*(MemoryAccessInst: LLVMValueRef): LLVMAtomicOrdering
proc LLVMSetOrdering*(MemoryAccessInst: LLVMValueRef; Ordering: LLVMAtomicOrdering)
proc LLVMBuildTrunc*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildZExt*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildSExt*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildFPToUI*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildFPToSI*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildUIToFP*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildSIToFP*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildFPTrunc*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildFPExt*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildPtrToInt*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildIntToPtr*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildBitCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildAddrSpaceCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildZExtOrBitCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildSExtOrBitCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildTruncOrBitCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildCast*(B: LLVMBuilderRef; Op: LLVMOpcode; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildPointerCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildIntCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildFPCast*(a2: LLVMBuilderRef; Val: LLVMValueRef; DestTy: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildICmp*(a2: LLVMBuilderRef; Op: LLVMIntPredicate; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFCmp*(a2: LLVMBuilderRef; Op: LLVMRealPredicate; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildPhi*(a2: LLVMBuilderRef; Ty: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildCall*(a2: LLVMBuilderRef; Fn: LLVMValueRef; Args: ptr LLVMValueRef; NumArgs: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildSelect*(a2: LLVMBuilderRef; If: LLVMValueRef; Then: LLVMValueRef; Else: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildVAArg*(a2: LLVMBuilderRef; List: LLVMValueRef; Ty: LLVMTypeRef; Name: cstring): LLVMValueRef
proc LLVMBuildExtractElement*(a2: LLVMBuilderRef; VecVal: LLVMValueRef; Index: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildInsertElement*(a2: LLVMBuilderRef; VecVal: LLVMValueRef; EltVal: LLVMValueRef; Index: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildShuffleVector*(a2: LLVMBuilderRef; V1: LLVMValueRef; V2: LLVMValueRef; Mask: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildExtractValue*(a2: LLVMBuilderRef; AggVal: LLVMValueRef; Index: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildInsertValue*(a2: LLVMBuilderRef; AggVal: LLVMValueRef; EltVal: LLVMValueRef; Index: cuint; Name: cstring): LLVMValueRef
proc LLVMBuildIsNull*(a2: LLVMBuilderRef; Val: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildIsNotNull*(a2: LLVMBuilderRef; Val: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildPtrDiff*(a2: LLVMBuilderRef; LHS: LLVMValueRef; RHS: LLVMValueRef; Name: cstring): LLVMValueRef
proc LLVMBuildFence*(B: LLVMBuilderRef; ordering: LLVMAtomicOrdering; singleThread: bool; Name: cstring): LLVMValueRef
proc LLVMBuildAtomicRMW*(B: LLVMBuilderRef; op: LLVMAtomicRMWBinOp; PTR: LLVMValueRef; Val: LLVMValueRef; ordering: LLVMAtomicOrdering; singleThread: bool): LLVMValueRef
proc LLVMBuildAtomicCmpXchg*(B: LLVMBuilderRef; Ptr: LLVMValueRef; Cmp: LLVMValueRef; New: LLVMValueRef; SuccessOrdering: LLVMAtomicOrdering; FailureOrdering: LLVMAtomicOrdering; SingleThread: bool): LLVMValueRef
proc LLVMIsAtomicSingleThread*(AtomicInst: LLVMValueRef): bool
proc LLVMSetAtomicSingleThread*(AtomicInst: LLVMValueRef; SingleThread: bool)
proc LLVMGetCmpXchgSuccessOrdering*(CmpXchgInst: LLVMValueRef): LLVMAtomicOrdering
proc LLVMSetCmpXchgSuccessOrdering*(CmpXchgInst: LLVMValueRef; Ordering: LLVMAtomicOrdering)
proc LLVMGetCmpXchgFailureOrdering*(CmpXchgInst: LLVMValueRef): LLVMAtomicOrdering
proc LLVMSetCmpXchgFailureOrdering*(CmpXchgInst: LLVMValueRef; Ordering: LLVMAtomicOrdering)
proc LLVMCreateModuleProviderForExistingModule*(M: LLVMModuleRef): LLVMModuleProviderRef
proc LLVMDisposeModuleProvider*(M: LLVMModuleProviderRef)
proc LLVMCreateMemoryBufferWithContentsOfFile*(Path: cstring; OutMemBuf: ptr LLVMMemoryBufferRef; OutMessage: cstringArray): bool
proc LLVMCreateMemoryBufferWithSTDIN*(OutMemBuf: ptr LLVMMemoryBufferRef; OutMessage: cstringArray): bool
proc LLVMCreateMemoryBufferWithMemoryRange*(InputData: cstring; InputDataLength: csize; BufferName: cstring; RequiresNullTerminator: bool): LLVMMemoryBufferRef
proc LLVMCreateMemoryBufferWithMemoryRangeCopy*(InputData: cstring; InputDataLength: csize; BufferName: cstring): LLVMMemoryBufferRef
proc LLVMGetBufferStart*(MemBuf: LLVMMemoryBufferRef): cstring
proc LLVMGetBufferSize*(MemBuf: LLVMMemoryBufferRef): csize
proc LLVMDisposeMemoryBuffer*(MemBuf: LLVMMemoryBufferRef)
proc LLVMGetGlobalPassRegistry*(): LLVMPassRegistryRef
proc LLVMCreatePassManager*(): LLVMPassManagerRef
proc LLVMCreateFunctionPassManagerForModule*(M: LLVMModuleRef): LLVMPassManagerRef
proc LLVMCreateFunctionPassManager*(MP: LLVMModuleProviderRef): LLVMPassManagerRef
proc LLVMRunPassManager*(PM: LLVMPassManagerRef; M: LLVMModuleRef): bool
proc LLVMInitializeFunctionPassManager*(FPM: LLVMPassManagerRef): bool
proc LLVMRunFunctionPassManager*(FPM: LLVMPassManagerRef; F: LLVMValueRef): bool
proc LLVMFinalizeFunctionPassManager*(FPM: LLVMPassManagerRef): bool
proc LLVMDisposePassManager*(PM: LLVMPassManagerRef)
proc LLVMStartMultithreaded*(): bool
proc LLVMStopMultithreaded*()
proc LLVMIsMultithreaded*(): bool

{.pop.}
