# import
#   llvm-c/Types

##  Read LLVM IR from a memory buffer and convert it into an in-memory Module
##  object. Returns 0 on success.
##  Optionally returns a human-readable description of any errors that
##  occurred during parsing IR. OutMessage must be disposed with
##  LLVMDisposeMessage.
##  @see llvm::ParseIR()

proc LLVMParseIRInContext*(contextRef: LLVMContextRef; memBuf: LLVMMemoryBufferRef;
                          outM: ptr LLVMModuleRef; outMessage: cstringArray): LLVMBool
