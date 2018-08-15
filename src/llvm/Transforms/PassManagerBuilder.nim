import ../Types

type
  LLVMPassManagerBuilderRef* = ptr object

{.push cdecl, importc.}

proc LLVMPassManagerBuilderCreate*(): LLVMPassManagerBuilderRef
proc LLVMPassManagerBuilderDispose*(PMB: LLVMPassManagerBuilderRef)
proc LLVMPassManagerBuilderSetOptLevel*(PMB: LLVMPassManagerBuilderRef; OptLevel: cuint)
proc LLVMPassManagerBuilderSetSizeLevel*(PMB: LLVMPassManagerBuilderRef; SizeLevel: cuint)
proc LLVMPassManagerBuilderSetDisableUnitAtATime*(PMB: LLVMPassManagerBuilderRef; Value: bool)
proc LLVMPassManagerBuilderSetDisableUnrollLoops*(PMB: LLVMPassManagerBuilderRef; Value: bool)
proc LLVMPassManagerBuilderSetDisableSimplifyLibCalls*(PMB: LLVMPassManagerBuilderRef; Value: bool)
proc LLVMPassManagerBuilderUseInlinerWithThreshold*(PMB: LLVMPassManagerBuilderRef; Threshold: cuint)
proc LLVMPassManagerBuilderPopulateFunctionPassManager*(PMB: LLVMPassManagerBuilderRef; PM: LLVMPassManagerRef)
proc LLVMPassManagerBuilderPopulateModulePassManager*(PMB: LLVMPassManagerBuilderRef; PM: LLVMPassManagerRef)
proc LLVMPassManagerBuilderPopulateLTOPassManager*(PMB: LLVMPassManagerBuilderRef; PM: LLVMPassManagerRef; Internalize: bool; RunInliner: bool)

{.pop.}
