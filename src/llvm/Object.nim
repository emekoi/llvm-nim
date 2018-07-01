## ===-- llvm-c/Object.h - Object Lib C Iface --------------------*- C++ -*-===
## 
##                      The LLVM Compiler Infrastructure
## 
##  This file is distributed under the University of Illinois Open Source
##  License. See LICENSE.TXT for details.
## 
## ===----------------------------------------------------------------------===
## 
##  This header declares the C interface to libLLVMObject.a, which
##  implements object file reading and writing.
## 
##  Many exotic languages can interoperate with C code but have a harder time
##  with C++ due to name mangling. So in addition to C, this interface enables
##  tools written in such languages.
## 
## ===----------------------------------------------------------------------===

import
  llvm-c/Types, llvm/Config/llvm-config

## *
##  @defgroup LLVMCObject Object file reading and writing
##  @ingroup LLVMC
## 
##  @{
## 
##  Opaque type wrappers

type
  LLVMObjectFileRef* = ptr LLVMOpaqueObjectFile
  LLVMSectionIteratorRef* = ptr LLVMOpaqueSectionIterator
  LLVMSymbolIteratorRef* = ptr LLVMOpaqueSymbolIterator
  LLVMRelocationIteratorRef* = ptr LLVMOpaqueRelocationIterator

##  ObjectFile creation

proc LLVMCreateObjectFile*(memBuf: LLVMMemoryBufferRef): LLVMObjectFileRef
proc LLVMDisposeObjectFile*(objectFile: LLVMObjectFileRef)
##  ObjectFile Section iterators

proc LLVMGetSections*(objectFile: LLVMObjectFileRef): LLVMSectionIteratorRef
proc LLVMDisposeSectionIterator*(si: LLVMSectionIteratorRef)
proc LLVMIsSectionIteratorAtEnd*(objectFile: LLVMObjectFileRef;
                                si: LLVMSectionIteratorRef): LLVMBool
proc LLVMMoveToNextSection*(si: LLVMSectionIteratorRef)
proc LLVMMoveToContainingSection*(sect: LLVMSectionIteratorRef;
                                 sym: LLVMSymbolIteratorRef)
##  ObjectFile Symbol iterators

proc LLVMGetSymbols*(objectFile: LLVMObjectFileRef): LLVMSymbolIteratorRef
proc LLVMDisposeSymbolIterator*(si: LLVMSymbolIteratorRef)
proc LLVMIsSymbolIteratorAtEnd*(objectFile: LLVMObjectFileRef;
                               si: LLVMSymbolIteratorRef): LLVMBool
proc LLVMMoveToNextSymbol*(si: LLVMSymbolIteratorRef)
##  SectionRef accessors

proc LLVMGetSectionName*(si: LLVMSectionIteratorRef): cstring
proc LLVMGetSectionSize*(si: LLVMSectionIteratorRef): uint64T
proc LLVMGetSectionContents*(si: LLVMSectionIteratorRef): cstring
proc LLVMGetSectionAddress*(si: LLVMSectionIteratorRef): uint64T
proc LLVMGetSectionContainsSymbol*(si: LLVMSectionIteratorRef;
                                  sym: LLVMSymbolIteratorRef): LLVMBool
##  Section Relocation iterators

proc LLVMGetRelocations*(section: LLVMSectionIteratorRef): LLVMRelocationIteratorRef
proc LLVMDisposeRelocationIterator*(ri: LLVMRelocationIteratorRef)
proc LLVMIsRelocationIteratorAtEnd*(section: LLVMSectionIteratorRef;
                                   ri: LLVMRelocationIteratorRef): LLVMBool
proc LLVMMoveToNextRelocation*(ri: LLVMRelocationIteratorRef)
##  SymbolRef accessors

proc LLVMGetSymbolName*(si: LLVMSymbolIteratorRef): cstring
proc LLVMGetSymbolAddress*(si: LLVMSymbolIteratorRef): uint64T
proc LLVMGetSymbolSize*(si: LLVMSymbolIteratorRef): uint64T
##  RelocationRef accessors

proc LLVMGetRelocationOffset*(ri: LLVMRelocationIteratorRef): uint64T
proc LLVMGetRelocationSymbol*(ri: LLVMRelocationIteratorRef): LLVMSymbolIteratorRef
proc LLVMGetRelocationType*(ri: LLVMRelocationIteratorRef): uint64T
##  NOTE: Caller takes ownership of returned string of the two
##  following functions.

proc LLVMGetRelocationTypeName*(ri: LLVMRelocationIteratorRef): cstring
proc LLVMGetRelocationValueString*(ri: LLVMRelocationIteratorRef): cstring
## *
##  @}
## 
