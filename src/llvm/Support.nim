## ===-- llvm-c/Support.h - Support C Interface --------------------*- C -*-===*\
## |*                                                                            *|
## |*                     The LLVM Compiler Infrastructure                       *|
## |*                                                                            *|
## |* This file is distributed under the University of Illinois Open Source      *|
## |* License. See LICENSE.TXT for details.                                      *|
## |*                                                                            *|
## |*===----------------------------------------------------------------------===*|
## |*                                                                            *|
## |* This file defines the C interface to the LLVM support library.             *|
## |*                                                                            *|
## \*===----------------------------------------------------------------------===

import
  llvm-c/Types, llvm/Support/DataTypes

## *
##  This function permanently loads the dynamic library at the given path.
##  It is safe to call this function multiple times for the same library.
## 
##  @see sys::DynamicLibrary::LoadLibraryPermanently()
## 

proc LLVMLoadLibraryPermanently*(filename: cstring): LLVMBool
## *
##  This function parses the given arguments using the LLVM command line parser.
##  Note that the only stable thing about this function is its signature; you
##  cannot rely on any particular set of command line arguments being interpreted
##  the same way across LLVM versions.
## 
##  @see llvm::cl::ParseCommandLineOptions()
## 

proc LLVMParseCommandLineOptions*(argc: cint; argv: cstringArray; overview: cstring)
## *
##  This function will search through all previously loaded dynamic
##  libraries for the symbol \p symbolName. If it is found, the address of
##  that symbol is returned. If not, null is returned.
## 
##  @see sys::DynamicLibrary::SearchForAddressOfSymbol()
## 

proc LLVMSearchForAddressOfSymbol*(symbolName: cstring): pointer
## *
##  This functions permanently adds the symbol \p symbolName with the
##  value \p symbolValue.  These symbols are searched before any
##  libraries.
## 
##  @see sys::DynamicLibrary::AddSymbol()
## 

proc LLVMAddSymbol*(symbolName: cstring; symbolValue: pointer)