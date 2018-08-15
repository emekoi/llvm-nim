import Types

{.push cdecl, importc.}

proc LLVMInitializeCore*(R: LLVMPassRegistryRef)
proc LLVMInitializeTransformUtils*(R: LLVMPassRegistryRef)
proc LLVMInitializeScalarOpts*(R: LLVMPassRegistryRef)
proc LLVMInitializeObjCARCOpts*(R: LLVMPassRegistryRef)
proc LLVMInitializeVectorization*(R: LLVMPassRegistryRef)
proc LLVMInitializeInstCombine*(R: LLVMPassRegistryRef)
proc LLVMInitializeIPO*(R: LLVMPassRegistryRef)
proc LLVMInitializeInstrumentation*(R: LLVMPassRegistryRef)
proc LLVMInitializeAnalysis*(R: LLVMPassRegistryRef)
proc LLVMInitializeIPA*(R: LLVMPassRegistryRef)
proc LLVMInitializeCodeGen*(R: LLVMPassRegistryRef)
proc LLVMInitializeTarget*(R: LLVMPassRegistryRef)

{.pop.}
