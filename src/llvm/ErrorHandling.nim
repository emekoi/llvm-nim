type
  LLVMFatalErrorHandler* = proc(Reason: cstring) {.cdecl.}

{.push cdecl, importc.}

proc LLVMInstallFatalErrorHandler*(Handler: LLVMFatalErrorHandler)
proc LLVMResetFatalErrorHandler*()
proc LLVMEnablePrettyStackTrace*()

{.pop.}
