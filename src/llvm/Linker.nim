## ===-- llvm-c/Linker.h - Module Linker C Interface -------------*- C++ -*-===*\
## |*                                                                            *|
## |*                     The LLVM Compiler Infrastructure                       *|
## |*                                                                            *|
## |* This file is distributed under the University of Illinois Open Source      *|
## |* License. See LICENSE.TXT for details.                                      *|
## |*                                                                            *|
## |*===----------------------------------------------------------------------===*|
## |*                                                                            *|
## |* This file defines the C interface to the module/file/archive linker.       *|
## |*                                                                            *|
## \*===----------------------------------------------------------------------===

import
  llvm-c/Types

##  This enum is provided for backwards-compatibility only. It has no effect.

type
  LLVMLinkerMode* = enum
    LLVMLinkerDestroySource = 0, ##  This is the default behavior.
    LLVMLinkerPreserveSourceRemoved = 1


##  Links the source module into the destination module. The source module is
##  destroyed.
##  The return value is true if an error occurred, false otherwise.
##  Use the diagnostic handler to get any diagnostic message.
## 

proc LLVMLinkModules2*(dest: LLVMModuleRef; src: LLVMModuleRef): LLVMBool