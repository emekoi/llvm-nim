import ospaths, strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
const headerObject = sourcePath & "Object.h"
type
  LLVMObjectFileRef = ptr LLVMOpaqueObjectFile
  LLVMSectionIteratorRef = ptr LLVMOpaqueSectionIterator
  LLVMSymbolIteratorRef = ptr LLVMOpaqueSymbolIterator
  LLVMRelocationIteratorRef = ptr LLVMOpaqueRelocationIterator

proc LLVMCreateObjectFile(MemBuf: LLVMMemoryBufferRef): LLVMObjectFileRef {.cdecl.}
proc LLVMDisposeObjectFile(ObjectFile: LLVMObjectFileRef) {.cdecl.}
proc LLVMGetSections(ObjectFile: LLVMObjectFileRef): LLVMSectionIteratorRef {.cdecl.}
proc LLVMDisposeSectionIterator(SI: LLVMSectionIteratorRef) {.cdecl.}
proc LLVMIsSectionIteratorAtEnd(ObjectFile: LLVMObjectFileRef;
                               SI: LLVMSectionIteratorRef): bool {.cdecl.}
proc LLVMMoveToNextSection(SI: LLVMSectionIteratorRef) {.cdecl.}
proc LLVMMoveToContainingSection(Sect: LLVMSectionIteratorRef;
                                Sym: LLVMSymbolIteratorRef) {.cdecl.}
proc LLVMGetSymbols(ObjectFile: LLVMObjectFileRef): LLVMSymbolIteratorRef {.cdecl.}
proc LLVMDisposeSymbolIterator(SI: LLVMSymbolIteratorRef) {.cdecl.}
proc LLVMIsSymbolIteratorAtEnd(ObjectFile: LLVMObjectFileRef;
                              SI: LLVMSymbolIteratorRef): bool {.cdecl.}
proc LLVMMoveToNextSymbol(SI: LLVMSymbolIteratorRef) {.cdecl.}
proc LLVMGetSectionName(SI: LLVMSectionIteratorRef): cstring {.cdecl.}
proc LLVMGetSectionSize(SI: LLVMSectionIteratorRef): uint64 {.cdecl.}
proc LLVMGetSectionContents(SI: LLVMSectionIteratorRef): cstring {.cdecl.}
proc LLVMGetSectionAddress(SI: LLVMSectionIteratorRef): uint64 {.cdecl.}
proc LLVMGetSectionContainsSymbol(SI: LLVMSectionIteratorRef;
                                 Sym: LLVMSymbolIteratorRef): bool {.cdecl.}
proc LLVMGetRelocations(Section: LLVMSectionIteratorRef): LLVMRelocationIteratorRef {.
    cdecl.}
proc LLVMDisposeRelocationIterator(RI: LLVMRelocationIteratorRef) {.cdecl.}
proc LLVMIsRelocationIteratorAtEnd(Section: LLVMSectionIteratorRef;
                                  RI: LLVMRelocationIteratorRef): bool {.cdecl.}
proc LLVMMoveToNextRelocation(RI: LLVMRelocationIteratorRef) {.cdecl.}
proc LLVMGetSymbolName(SI: LLVMSymbolIteratorRef): cstring {.cdecl.}
proc LLVMGetSymbolAddress(SI: LLVMSymbolIteratorRef): uint64 {.cdecl.}
proc LLVMGetSymbolSize(SI: LLVMSymbolIteratorRef): uint64 {.cdecl.}
proc LLVMGetRelocationOffset(RI: LLVMRelocationIteratorRef): uint64 {.cdecl.}
proc LLVMGetRelocationSymbol(RI: LLVMRelocationIteratorRef): LLVMSymbolIteratorRef {.
    cdecl.}
proc LLVMGetRelocationType(RI: LLVMRelocationIteratorRef): uint64 {.cdecl.}
proc LLVMGetRelocationTypeName(RI: LLVMRelocationIteratorRef): cstring {.cdecl.}
proc LLVMGetRelocationValueString(RI: LLVMRelocationIteratorRef): cstring {.cdecl.}
