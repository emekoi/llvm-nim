## ===-- llvm-c/IRReader.h - IR Reader C Interface -----------------*- C -*-===*\
## |*                                                                            *|
## |*                     The LLVM Compiler Infrastructure                       *|
## |*                                                                            *|
## |* This file is distributed under the University of Illinois Open Source      *|
## |* License. See LICENSE.TXT for details.                                      *|
## |*                                                                            *|
## |*===----------------------------------------------------------------------===*|
## |*                                                                            *|
## |* This file defines the C interface to the IR Reader.                        *|
## |*                                                                            *|
## \*===----------------------------------------------------------------------===

import
  llvm-c/Types

## *
##  Read LLVM IR from a memory buffer and convert it into an in-memory Module
##  object. Returns 0 on success.
##  Optionally returns a human-readable description of any errors that
##  occurred during parsing IR. OutMessage must be disposed with
##  LLVMDisposeMessage.
## 
##  @see llvm::ParseIR()
## 

proc LLVMParseIRInContext*(contextRef: LLVMContextRef; memBuf: LLVMMemoryBufferRef;
                          outM: ptr LLVMModuleRef; outMessage: cstringArray): LLVMBool