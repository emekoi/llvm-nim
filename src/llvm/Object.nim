import Types

type
  LLVMObjectFileRef* = ptr object
  LLVMSectionIteratorRef* = ptr object
  LLVMSymbolIteratorRef* = ptr object
  LLVMRelocationIteratorRef* = ptr object

{.push cdecl, importc.}

proc LLVMCreateObjectFile*(MemBuf: LLVMMemoryBufferRef): LLVMObjectFileRef
proc LLVMDisposeObjectFile*(ObjectFile: LLVMObjectFileRef)
proc LLVMGetSections*(ObjectFile: LLVMObjectFileRef): LLVMSectionIteratorRef
proc LLVMDisposeSectionIterator*(SI: LLVMSectionIteratorRef)
proc LLVMIsSectionIteratorAtEnd*(ObjectFile: LLVMObjectFileRef; SI: LLVMSectionIteratorRef): bool
proc LLVMMoveToNextSection*(SI: LLVMSectionIteratorRef)
proc LLVMMoveToContainingSection*(Sect: LLVMSectionIteratorRef; Sym: LLVMSymbolIteratorRef)
proc LLVMGetSymbols*(ObjectFile: LLVMObjectFileRef): LLVMSymbolIteratorRef
proc LLVMDisposeSymbolIterator*(SI: LLVMSymbolIteratorRef)
proc LLVMIsSymbolIteratorAtEnd*(ObjectFile: LLVMObjectFileRef; SI: LLVMSymbolIteratorRef): bool
proc LLVMMoveToNextSymbol*(SI: LLVMSymbolIteratorRef)
proc LLVMGetSectionName*(SI: LLVMSectionIteratorRef): cstring
proc LLVMGetSectionSize*(SI: LLVMSectionIteratorRef): uint64
proc LLVMGetSectionContents*(SI: LLVMSectionIteratorRef): cstring
proc LLVMGetSectionAddress*(SI: LLVMSectionIteratorRef): uint64
proc LLVMGetSectionContainsSymbol*(SI: LLVMSectionIteratorRef; Sym: LLVMSymbolIteratorRef): bool
proc LLVMGetRelocations*(Section: LLVMSectionIteratorRef): LLVMRelocationIteratorRef
proc LLVMDisposeRelocationIterator*(RI: LLVMRelocationIteratorRef)
proc LLVMIsRelocationIteratorAtEnd*(Section: LLVMSectionIteratorRef; RI: LLVMRelocationIteratorRef): bool
proc LLVMMoveToNextRelocation*(RI: LLVMRelocationIteratorRef)
proc LLVMGetSymbolName*(SI: LLVMSymbolIteratorRef): cstring
proc LLVMGetSymbolAddress*(SI: LLVMSymbolIteratorRef): uint64
proc LLVMGetSymbolSize*(SI: LLVMSymbolIteratorRef): uint64
proc LLVMGetRelocationOffset*(RI: LLVMRelocationIteratorRef): uint64
proc LLVMGetRelocationSymbol*(RI: LLVMRelocationIteratorRef): LLVMSymbolIteratorRef
proc LLVMGetRelocationType*(RI: LLVMRelocationIteratorRef): uint64
proc LLVMGetRelocationTypeName*(RI: LLVMRelocationIteratorRef): cstring
proc LLVMGetRelocationValueString*(RI: LLVMRelocationIteratorRef): cstring

{.pop.}
