import types

## Builds a module from the bitcode in the specified memory buffer, returning a
## reference to the module via the OutModule parameter. Returns 0 on success.
## Optionally returns a human-readable error message via OutMessage.
proc LLVMParseBitcode*(memBuf: LLVMMemoryBufferRef; outModule: ptr LLVMModuleRef;
                      outMessage: cstringArray): LLVMBool

## Builds a module from the bitcode in the specified memory buffer, returning a
## reference to the module via the OutModule parameter. Returns 0 on success.
proc LLVMParseBitcode2*(memBuf: LLVMMemoryBufferRef; outModule: ptr LLVMModuleRef): LLVMBool

proc LLVMParseBitcodeInContext*(contextRef: LLVMContextRef;
                               memBuf: LLVMMemoryBufferRef;
                               outModule: ptr LLVMModuleRef;
                               outMessage: cstringArray): LLVMBool

proc LLVMParseBitcodeInContext2*(contextRef: LLVMContextRef;
                                memBuf: LLVMMemoryBufferRef;
                                outModule: ptr LLVMModuleRef): LLVMBool

## Reads a module from the specified path, returning via the OutMP parameter
## a module provider which performs lazy deserialization. Returns 0 on success.
## Optionally returns a human-readable error message via OutMessage.
proc LLVMGetBitcodeModuleInContext*(contextRef: LLVMContextRef;
                                   memBuf: LLVMMemoryBufferRef;
                                   outM: ptr LLVMModuleRef;
                                   outMessage: cstringArray): LLVMBool

## Reads a module from the specified path, returning via the OutMP parameter a
## module provider which performs lazy deserialization. Returns 0 on success.
proc LLVMGetBitcodeModuleInContext2*(contextRef: LLVMContextRef;
                                    memBuf: LLVMMemoryBufferRef;
                                    outM: ptr LLVMModuleRef): LLVMBool

proc LLVMGetBitcodeModule*(memBuf: LLVMMemoryBufferRef; outM: ptr LLVMModuleRef;
                          outMessage: cstringArray): LLVMBool

proc LLVMGetBitcodeModule2*(memBuf: LLVMMemoryBufferRef; outM: ptr LLVMModuleRef): LLVMBool

{.deprecated: [
  LLVMParseBitcode: LLVMParseBitcode2,
  LLVMParseBitcodeInContext: LLVMParseBitcodeInContext2,
  LLVMGetBitcodeModuleInContext: LLVMGetBitcodeModuleInContext2
  LLVMGetBitcodeModule: LLVMGetBitcodeModule2
].}
