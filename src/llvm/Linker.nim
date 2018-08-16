import Types

type
  LLVMLinkerMode* {.size: sizeof(cint).} = enum
    LLVMLinkerDestroySource = 0,
    LLVMLinkerPreserveSource_Removed = 1

{.push cdecl, importc.}

proc LLVMLinkModules2*(Dest: LLVMModuleRef; Src: LLVMModuleRef): bool

{.pop.}
