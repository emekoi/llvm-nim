import Types

{.push cdecl, importc.}

proc LLVMLoadLibraryPermanently*(Filename: cstring): bool
proc LLVMParseCommandLineOptions*(argc: cint; argv: cstringArray; Overview: cstring)
proc LLVMSearchForAddressOfSymbol*(symbolName: cstring): pointer
proc LLVMAddSymbol*(symbolName: cstring; symbolValue: pointer)

{.pop.}
