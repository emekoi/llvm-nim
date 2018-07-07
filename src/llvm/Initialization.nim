# import
#   llvm-c/Types

proc LLVMInitializeCore*(r: LLVMPassRegistryRef)

proc LLVMInitializeTransformUtils*(r: LLVMPassRegistryRef)

proc LLVMInitializeScalarOpts*(r: LLVMPassRegistryRef)

proc LLVMInitializeObjCARCOpts*(r: LLVMPassRegistryRef)

proc LLVMInitializeVectorization*(r: LLVMPassRegistryRef)

proc LLVMInitializeInstCombine*(r: LLVMPassRegistryRef)

proc LLVMInitializeIPO*(r: LLVMPassRegistryRef)

proc LLVMInitializeInstrumentation*(r: LLVMPassRegistryRef)

proc LLVMInitializeAnalysis*(r: LLVMPassRegistryRef)

proc LLVMInitializeIPA*(r: LLVMPassRegistryRef)

proc LLVMInitializeCodeGen*(r: LLVMPassRegistryRef)

proc LLVMInitializeTarget*(r: LLVMPassRegistryRef)
