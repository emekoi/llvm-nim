import ../Types

{.push cdecl, importc.}

proc LLVMAddBBVectorizePass*(PM: LLVMPassManagerRef)
proc LLVMAddLoopVectorizePass*(PM: LLVMPassManagerRef)
proc LLVMAddSLPVectorizePass*(PM: LLVMPassManagerRef)

{.pop.}
