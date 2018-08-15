# import 

type
  LLVMDisasmContextRef* = pointer
  
  LLVMOpInfoCallback* = proc(DisInfo: pointer; PC: uint64; Offset: uint64; Size: uint64; TagType: cint; TagBuf: pointer): cint {.cdecl.}
  
  LLVMOpInfoSymbol1* = object
    Present*: uint64
    Name*: cstring
    Value*: uint64

  LLVMOpInfo1* = object
    AddSymbol*: LLVMOpInfoSymbol1
    SubtractSymbol*: LLVMOpInfoSymbol1
    Value*: uint64
    VariantKind*: uint64

  LLVMSymbolLookupCallback* = proc(DisInfo: pointer; ReferenceValue: uint64; ReferenceType: ptr uint64; ReferencePC: uint64; ReferenceName: cstringArray): cstring {.cdecl.}

proc LLVMCreateDisasm(TripleName: cstring; DisInfo: pointer; TagType: cint; GetOpInfo: LLVMOpInfoCallback; SymbolLookUp: LLVMSymbolLookupCallback): LLVMDisasmContextRef {.cdecl.}
proc LLVMCreateDisasmCPU(Triple: cstring; CPU: cstring; DisInfo: pointer; TagType: cint; GetOpInfo: LLVMOpInfoCallback; SymbolLookUp: LLVMSymbolLookupCallback): LLVMDisasmContextRef {.cdecl.}
proc LLVMCreateDisasmCPUFeatures(Triple: cstring; CPU: cstring; Features: cstring; DisInfo: pointer; TagType: cint; GetOpInfo: LLVMOpInfoCallback; SymbolLookUp: LLVMSymbolLookupCallback): LLVMDisasmContextRef {.cdecl.}
proc LLVMSetDisasmOptions(DC: LLVMDisasmContextRef; Options: uint64): cint {.cdecl.}
proc LLVMDisasmDispose(DC: LLVMDisasmContextRef) {.cdecl.}
proc LLVMDisasmInstruction(DC: LLVMDisasmContextRef; Bytes: ptr uint8; BytesSize: uint64; PC: uint64; OutString: cstring; OutStringSize: csize): csize {.cdecl.}
