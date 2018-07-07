# import
#   llvm-c/Types

type
  ##  This enum is provided for backwards-compatibility only. It has no effect.
  LLVMLinkerMode* = enum
    LLVMLinkerDestroySource = 0, ##  This is the default behavior.
    LLVMLinkerPreserveSourceRemoved = 1


##  Links the source module into the destination module. The source module is destroyed.
##  The return value is true if an error occurred, false otherwise.
##  Use the diagnostic handler to get any diagnostic message.
proc LLVMLinkModules2*(dest: LLVMModuleRef; src: LLVMModuleRef): LLVMBool
