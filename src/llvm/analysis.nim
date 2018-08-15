import Types

type
  LLVMVerifierFailureAction* {.size: sizeof(cint).} = enum
    LLVMAbortProcessAction,
    LLVMPrintMessageAction,
    LLVMReturnStatusAction

{.push cdecl, importc.}

proc LLVMVerifyModule*(M: LLVMModuleRef; Action: LLVMVerifierFailureAction; OutMessage: cstringArray): bool
proc LLVMVerifyFunction*(Fn: LLVMValueRef; Action: LLVMVerifierFailureAction): bool
proc LLVMViewFunctionCFG*(Fn: LLVMValueRef)
proc LLVMViewFunctionCFGOnly*(Fn: LLVMValueRef)

{.pop.}
