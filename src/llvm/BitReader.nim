import Types

{.push cdecl, importc.}

proc LLVMParseBitcode*(MemBuf: LLVMMemoryBufferRef; OutModule: ptr LLVMModuleRef; OutMessage: cstringArray): bool
proc LLVMParseBitcode2*(MemBuf: LLVMMemoryBufferRef; OutModule: ptr LLVMModuleRef): bool
proc LLVMParseBitcodeInContext*(ContextRef: LLVMContextRef; MemBuf: LLVMMemoryBufferRef; OutModule: ptr LLVMModuleRef; OutMessage: cstringArray): bool
proc LLVMParseBitcodeInContext2*(ContextRef: LLVMContextRef; MemBuf: LLVMMemoryBufferRef; OutModule: ptr LLVMModuleRef): bool
proc LLVMGetBitcodeModuleInContext*(ContextRef: LLVMContextRef; MemBuf: LLVMMemoryBufferRef; OutM: ptr LLVMModuleRef; OutMessage: cstringArray): bool
proc LLVMGetBitcodeModuleInContext2*(ContextRef: LLVMContextRef; MemBuf: LLVMMemoryBufferRef; OutM: ptr LLVMModuleRef): bool
proc LLVMGetBitcodeModule*(MemBuf: LLVMMemoryBufferRef; OutM: ptr LLVMModuleRef; OutMessage: cstringArray): bool
proc LLVMGetBitcodeModule2*(MemBuf: LLVMMemoryBufferRef; OutM: ptr LLVMModuleRef): bool

{.pop.}
