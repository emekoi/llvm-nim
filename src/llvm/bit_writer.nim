import types

## Writes a module to the specified path. Returns 0 on success.
proc LLVMWriteBitcodeToFile*(m: LLVMModuleRef; path: cstring): cint

## Writes a module to an open file descriptor. Returns 0 on success.
proc LLVMWriteBitcodeToFD*(m: LLVMModuleRef; fd: cint; shouldClose: cint;
                          unbuffered: cint): cint

## Writes a module to an open file descriptor.
## Returns 0 on success. Closes the Handle.
proc LLVMWriteBitcodeToFileHandle*(m: LLVMModuleRef; handle: cint): cint
                                  {.deprecated: "use LLVMWriteBitcodeToFD".}

## Writes a module to a new memory buffer and returns it.
proc LLVMWriteBitcodeToMemoryBuffer*(m: LLVMModuleRef): LLVMMemoryBufferRef
