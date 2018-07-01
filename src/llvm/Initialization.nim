## ===-- llvm-c/Initialization.h - Initialization C Interface ------*- C -*-===*\
## |*                                                                            *|
## |*                     The LLVM Compiler Infrastructure                       *|
## |*                                                                            *|
## |* This file is distributed under the University of Illinois Open Source      *|
## |* License. See LICENSE.TXT for details.                                      *|
## |*                                                                            *|
## |*===----------------------------------------------------------------------===*|
## |*                                                                            *|
## |* This header declares the C interface to LLVM initialization routines,      *|
## |* which must be called before you can use the functionality provided by      *|
## |* the corresponding LLVM library.                                            *|
## |*                                                                            *|
## \*===----------------------------------------------------------------------===

import
  llvm-c/Types

## *
##  @defgroup LLVMCInitialization Initialization Routines
##  @ingroup LLVMC
## 
##  This module contains routines used to initialize the LLVM system.
## 
##  @{
## 

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
## *
##  @}
## 
