import types

type
  LLVMVerifierFailureAction* = enum
    LLVMAbortProcessAction,   ## verifier will print to stderr and abort()
    LLVMPrintMessageAction,   ## verifier will print to stderr and return 1
    LLVMReturnStatusAction    ## verifier will just return 1

## Verifies that a module is valid, taking the specified action if not.
## Optionally returns a human-readable description of any invalid constructs.
## OutMessage must be disposed with LLVMDisposeMessage.
proc LLVMVerifyModule*(m: LLVMModuleRef; action: LLVMVerifierFailureAction;
                      outMessage: cstringArray): LLVMBool

## Verifies that a single function is valid, taking the specified action.
## Useful for debugging.
proc LLVMVerifyFunction*(fn: LLVMValueRef; action: LLVMVerifierFailureAction): LLVMBool

## Open up a ghostview window that displays the CFG of the current function.
## Useful for debugging.
proc LLVMViewFunctionCFG*(fn: LLVMValueRef)

proc LLVMViewFunctionCFGOnly*(fn: LLVMValueRef)
