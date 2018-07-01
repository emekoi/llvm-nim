## ===-- llvm-c/Support.h - C Interface Types declarations ---------*- C -*-===*\
## |*                                                                            *|
## |*                     The LLVM Compiler Infrastructure                       *|
## |*                                                                            *|
## |* This file is distributed under the University of Illinois Open Source      *|
## |* License. See LICENSE.TXT for details.                                      *|
## |*                                                                            *|
## |*===----------------------------------------------------------------------===*|
## |*                                                                            *|
## |* This file defines types used by the the C interface to LLVM.               *|
## |*                                                                            *|
## \*===----------------------------------------------------------------------===

import
  llvm/Support/DataTypes

## *
##  @defgroup LLVMCSupportTypes Types and Enumerations
## 
##  @{
## 

type
  LLVMBool* = cint

##  Opaque types.
## *
##  LLVM uses a polymorphic type hierarchy which C cannot represent, therefore
##  parameters must be passed as base types. Despite the declared types, most
##  of the functions provided operate only on branches of the type hierarchy.
##  The declared parameter names are descriptive and specify which type is
##  required. Additionally, each type hierarchy is documented along with the
##  functions that operate upon it. For more detail, refer to LLVM's C++ code.
##  If in doubt, refer to Core.cpp, which performs parameter downcasts in the
##  form unwrap<RequiredType>(Param).
## 
## *
##  Used to pass regions of memory through LLVM interfaces.
## 
##  @see llvm::MemoryBuffer
## 

type
  LLVMMemoryBufferRef* = ptr LLVMOpaqueMemoryBuffer

## *
##  The top-level container for all LLVM global data. See the LLVMContext class.
## 

type
  LLVMContextRef* = ptr LLVMOpaqueContext

## *
##  The top-level container for all other LLVM Intermediate Representation (IR)
##  objects.
## 
##  @see llvm::Module
## 

type
  LLVMModuleRef* = ptr LLVMOpaqueModule

## *
##  Each value in the LLVM IR has a type, an LLVMTypeRef.
## 
##  @see llvm::Type
## 

type
  LLVMTypeRef* = ptr LLVMOpaqueType

## *
##  Represents an individual value in LLVM IR.
## 
##  This models llvm::Value.
## 

type
  LLVMValueRef* = ptr LLVMOpaqueValue

## *
##  Represents a basic block of instructions in LLVM IR.
## 
##  This models llvm::BasicBlock.
## 

type
  LLVMBasicBlockRef* = ptr LLVMOpaqueBasicBlock

## *
##  Represents an LLVM Metadata.
## 
##  This models llvm::Metadata.
## 

type
  LLVMMetadataRef* = ptr LLVMOpaqueMetadata

## *
##  Represents an LLVM basic block builder.
## 
##  This models llvm::IRBuilder.
## 

type
  LLVMBuilderRef* = ptr LLVMOpaqueBuilder

## *
##  Represents an LLVM debug info builder.
## 
##  This models llvm::DIBuilder.
## 

type
  LLVMDIBuilderRef* = ptr LLVMOpaqueDIBuilder

## *
##  Interface used to provide a module to JIT or interpreter.
##  This is now just a synonym for llvm::Module, but we have to keep using the
##  different type to keep binary compatibility.
## 

type
  LLVMModuleProviderRef* = ptr LLVMOpaqueModuleProvider

## * @see llvm::PassManagerBase

type
  LLVMPassManagerRef* = ptr LLVMOpaquePassManager

## * @see llvm::PassRegistry

type
  LLVMPassRegistryRef* = ptr LLVMOpaquePassRegistry

## *
##  Used to get the users and usees of a Value.
## 
##  @see llvm::Use

type
  LLVMUseRef* = ptr LLVMOpaqueUse

## *
##  Used to represent an attributes.
## 
##  @see llvm::Attribute
## 

type
  LLVMAttributeRef* = ptr LLVMOpaqueAttributeRef

## *
##  @see llvm::DiagnosticInfo
## 

type
  LLVMDiagnosticInfoRef* = ptr LLVMOpaqueDiagnosticInfo

## *
##  @}
## 
