import Types

{.push cdecl, importc.}

proc LLVMWriteBitcodeToFile*(M: LLVMModuleRef; Path: cstring): cint
proc LLVMWriteBitcodeToFD*(M: LLVMModuleRef; FD: cint; ShouldClose: cint; Unbuffered: cint): cint
proc LLVMWriteBitcodeToFileHandle*(M: LLVMModuleRef; Handle: cint): cint
proc LLVMWriteBitcodeToMemoryBuffer*(M: LLVMModuleRef): LLVMMemoryBufferRef

{.pop.}
