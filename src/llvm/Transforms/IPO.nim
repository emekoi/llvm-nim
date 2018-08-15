import ../Types

{.push cdecl, importc.}

proc LLVMAddArgumentPromotionPass*(PM: LLVMPassManagerRef)
proc LLVMAddConstantMergePass*(PM: LLVMPassManagerRef)
proc LLVMAddCalledValuePropagationPass*(PM: LLVMPassManagerRef)
proc LLVMAddDeadArgEliminationPass*(PM: LLVMPassManagerRef)
proc LLVMAddFunctionAttrsPass*(PM: LLVMPassManagerRef)
proc LLVMAddFunctionInliningPass*(PM: LLVMPassManagerRef)
proc LLVMAddAlwaysInlinerPass*(PM: LLVMPassManagerRef)
proc LLVMAddGlobalDCEPass*(PM: LLVMPassManagerRef)
proc LLVMAddGlobalOptimizerPass*(PM: LLVMPassManagerRef)
proc LLVMAddIPConstantPropagationPass*(PM: LLVMPassManagerRef)
proc LLVMAddPruneEHPass*(PM: LLVMPassManagerRef)
proc LLVMAddIPSCCPPass*(PM: LLVMPassManagerRef)
proc LLVMAddInternalizePass*(a2: LLVMPassManagerRef; AllButMain: cuint)
proc LLVMAddStripDeadPrototypesPass*(PM: LLVMPassManagerRef)
proc LLVMAddStripSymbolsPass*(PM: LLVMPassManagerRef)

{.pop.}
