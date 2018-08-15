import Types

{.push cdecl, importc.}

proc LLVMParseIRInContext*(ContextRef: LLVMContextRef; MemBuf: LLVMMemoryBufferRef; OutM: ptr LLVMModuleRef; OutMessage: cstringArray): bool

{.pop.}
