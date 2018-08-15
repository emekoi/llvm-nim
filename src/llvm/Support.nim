import ospaths, strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
const headerSupport = sourcePath & "Support.h"
proc LLVMLoadLibraryPermanently(Filename: cstring): bool {.cdecl.}
proc LLVMParseCommandLineOptions(argc: cint; argv: cstringArray; Overview: cstring) {.cdecl.}
proc LLVMSearchForAddressOfSymbol(symbolName: cstring): pointer {.cdecl.}
proc LLVMAddSymbol(symbolName: cstring; symbolValue: pointer) {.cdecl.}
