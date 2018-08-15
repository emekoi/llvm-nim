
type
  llvm_lto* = pointer

  llvm_lto_status* {.size: sizeof(cint).} = enum
    LLVM_LTO_UNKNOWN,
    LLVM_LTO_OPT_SUCCESS,
    LLVM_LTO_READ_SUCCESS,
    LLVM_LTO_READ_FAILURE,
    LLVM_LTO_WRITE_FAILURE,
    LLVM_LTO_NO_TARGET,
    LLVM_LTO_NO_WORK,
    LLVM_LTO_MODULE_MERGE_FAILURE,
    LLVM_LTO_ASM_FAILURE,
    LLVM_LTO_NULL_OBJECT

{.push cdecl, importc.}

proc llvm_create_optimizer*(): llvm_lto
proc llvm_destroy_optimizer*(lto: llvm_lto)
proc llvm_read_object_file*(lto: llvm_lto; input_filename: cstring): llvm_lto_status
proc llvm_optimize_modules*(lto: llvm_lto; output_filename: cstring): llvm_lto_status

{.pop.}
