type
  lto_bool* = bool

  lto_symbol_attributes* {.size: sizeof(cint).} = enum
    LTO_SYMBOL_ALIGNMENT_MASK = 0x0000001F,
    LTO_SYMBOL_PERMISSIONS_RODATA = 0x00000080,
    LTO_SYMBOL_PERMISSIONS_CODE = 0x000000A0,
    LTO_SYMBOL_PERMISSIONS_DATA = 0x000000C0,
    LTO_SYMBOL_PERMISSIONS_MASK = 0x000000E0,
    LTO_SYMBOL_DEFINITION_REGULAR = 0x00000100,
    LTO_SYMBOL_DEFINITION_TENTATIVE = 0x00000200,
    LTO_SYMBOL_DEFINITION_WEAK = 0x00000300,
    LTO_SYMBOL_DEFINITION_UNDEFINED = 0x00000400,
    LTO_SYMBOL_DEFINITION_WEAKUNDEF = 0x00000500,
    LTO_SYMBOL_DEFINITION_MASK = 0x00000700,
    LTO_SYMBOL_SCOPE_INTERNAL = 0x00000800, LTO_SYMBOL_SCOPE_HIDDEN = 0x00001000,
    LTO_SYMBOL_SCOPE_DEFAULT = 0x00001800, LTO_SYMBOL_SCOPE_PROTECTED = 0x00002000,
    LTO_SYMBOL_SCOPE_DEFAULT_CAN_BE_HIDDEN = 0x00002800,
    LTO_SYMBOL_SCOPE_MASK = 0x00003800, LTO_SYMBOL_COMDAT = 0x00004000,
    LTO_SYMBOL_ALIAS = 0x00008000
  lto_debug_model* {.size: sizeof(cint).} = enum
    LTO_DEBUG_MODEL_NONE = 0, LTO_DEBUG_MODEL_DWARF = 1
  lto_codegen_model* {.size: sizeof(cint).} = enum
    LTO_CODEGEN_PIC_MODEL_STATIC = 0, LTO_CODEGEN_PIC_MODEL_DYNAMIC = 1,
    LTO_CODEGEN_PIC_MODEL_DYNAMIC_NO_PIC = 2, LTO_CODEGEN_PIC_MODEL_DEFAULT = 3
  lto_module* = ptr LLVMOpaqueLTOModule
  lto_code_gen* = ptr LLVMOpaqueLTOCodeGenerator
  thinlto_code_gen* = ptr LLVMOpaqueThinLTOCodeGenerator




proc lto_get_version(): cstring {.cdecl.}
proc lto_get_error_message(): cstring {.cdecl.}
proc lto_module_is_object_file(path: cstring): lto_bool {.cdecl.}
proc lto_module_is_object_file_for_target(path: cstring;
    target_triple_prefix: cstring): lto_bool {.cdecl.}
proc lto_module_has_objc_category(mem: pointer; length: csize): lto_bool {.cdecl.}
proc lto_module_is_object_file_in_memory(mem: pointer; length: csize): lto_bool {.
    cdecl.}
proc lto_module_is_object_file_in_memory_for_target(mem: pointer; length: csize;
    target_triple_prefix: cstring): lto_bool {.cdecl.}
proc lto_module_create(path: cstring): lto_module {.cdecl.}
proc lto_module_create_from_memory(mem: pointer; length: csize): lto_module {.cdecl.}
proc lto_module_create_from_memory_with_path(mem: pointer; length: csize;
    path: cstring): lto_module {.cdecl.}
proc lto_module_create_in_local_context(mem: pointer; length: csize; path: cstring): lto_module {.
    cdecl.}
proc lto_module_create_in_codegen_context(mem: pointer; length: csize; path: cstring;
    cg: lto_code_gen): lto_module {.cdecl.}
proc lto_module_create_from_fd(fd: cint; path: cstring; file_size: csize): lto_module {.
    cdecl.}
proc lto_module_create_from_fd_at_offset(fd: cint; path: cstring; file_size: csize;
                                        map_size: csize; offset: off): lto_module {.
    cdecl.}
proc lto_module_dispose(`mod`: lto_module) {.cdecl.}
proc lto_module_get_target_triple(`mod`: lto_module): cstring {.cdecl.}
proc lto_module_set_target_triple(`mod`: lto_module; triple: cstring) {.cdecl.}
proc lto_module_get_num_symbols(`mod`: lto_module): cuint {.cdecl.}
proc lto_module_get_symbol_name(`mod`: lto_module; index: cuint): cstring {.cdecl.}
proc lto_module_get_symbol_attribute(`mod`: lto_module; index: cuint): lto_symbol_attributes {.
    cdecl.}
proc lto_module_get_linkeropts(`mod`: lto_module): cstring {.cdecl.}
type
  lto_codegen_diagnostic_severity {.size: sizeof(cint).} = enum
    LTO_DS_ERROR = 0, LTO_DS_WARNING = 1, LTO_DS_NOTE = 2, LTO_DS_REMARK = 3
  lto_diagnostic_handler = proc (severity: lto_codegen_diagnostic_severity;
                              diag: cstring; ctxt: pointer) {.cdecl.}


proc lto_codegen_set_diagnostic_handler(a2: lto_code_gen;
                                       a3: lto_diagnostic_handler; a4: pointer) {.
    cdecl.}
proc lto_codegen_create(): lto_code_gen {.cdecl.}
proc lto_codegen_create_in_local_context(): lto_code_gen {.cdecl.}
proc lto_codegen_dispose(a2: lto_code_gen) {.cdecl.}
proc lto_codegen_add_module(cg: lto_code_gen; `mod`: lto_module): lto_bool {.cdecl.}
proc lto_codegen_set_module(cg: lto_code_gen; `mod`: lto_module) {.cdecl.}
proc lto_codegen_set_debug_model(cg: lto_code_gen; a3: lto_debug_model): lto_bool {.
    cdecl.}
proc lto_codegen_set_pic_model(cg: lto_code_gen; a3: lto_codegen_model): lto_bool {.
    cdecl.}
proc lto_codegen_set_cpu(cg: lto_code_gen; cpu: cstring) {.cdecl.}
proc lto_codegen_set_assembler_path(cg: lto_code_gen; path: cstring) {.cdecl.}
proc lto_codegen_set_assembler_args(cg: lto_code_gen; args: cstringArray; nargs: cint) {.
    cdecl.}
proc lto_codegen_add_must_preserve_symbol(cg: lto_code_gen; symbol: cstring) {.cdecl.}
proc lto_codegen_write_merged_modules(cg: lto_code_gen; path: cstring): lto_bool {.
    cdecl.}
proc lto_codegen_compile(cg: lto_code_gen; length: ptr csize): pointer {.cdecl.}
proc lto_codegen_compile_to_file(cg: lto_code_gen; name: cstringArray): lto_bool {.
    cdecl.}
proc lto_codegen_optimize(cg: lto_code_gen): lto_bool {.cdecl.}
proc lto_codegen_compile_optimized(cg: lto_code_gen; length: ptr csize): pointer {.
    cdecl.}
proc lto_api_version(): cuint {.cdecl.}
proc lto_codegen_debug_options(cg: lto_code_gen; a3: cstring) {.cdecl.}
proc lto_initialize_disassembler() {.cdecl.}
proc lto_codegen_set_should_internalize(cg: lto_code_gen;
                                       ShouldInternalize: lto_bool) {.cdecl.}
proc lto_codegen_set_should_embed_uselists(cg: lto_code_gen;
    ShouldEmbedUselists: lto_bool) {.cdecl.}

type
  LTOObjectBuffer {.importc: "LTOObjectBuffer", bycopy.} = object
    Buffer: cstring
    Size: csize


proc thinlto_create_codegen(): thinlto_code_gen {.cdecl.}
proc thinlto_codegen_dispose(cg: thinlto_code_gen) {.cdecl.}
proc thinlto_codegen_add_module(cg: thinlto_code_gen; identifier: cstring;
                               data: cstring; length: cint) {.cdecl.}
proc thinlto_codegen_process(cg: thinlto_code_gen) {.cdecl.}
proc thinlto_module_get_num_objects(cg: thinlto_code_gen): cuint {.cdecl.}
proc thinlto_module_get_object(cg: thinlto_code_gen; index: cuint): LTOObjectBuffer {.
    cdecl.}
proc thinlto_module_get_num_object_files(cg: thinlto_code_gen): cuint {.cdecl.}
proc thinlto_module_get_object_file(cg: thinlto_code_gen; index: cuint): cstring {.
    cdecl.}
proc thinlto_codegen_set_pic_model(cg: thinlto_code_gen; a3: lto_codegen_model): lto_bool {.
    cdecl.}
proc thinlto_codegen_set_savetemps_dir(cg: thinlto_code_gen;
                                      save_temps_dir: cstring) {.cdecl.}
proc thinlto_set_generated_objects_dir(cg: thinlto_code_gen;
                                      save_temps_dir: cstring) {.cdecl.}
proc thinlto_codegen_set_cpu(cg: thinlto_code_gen; cpu: cstring) {.cdecl.}
proc thinlto_codegen_disable_codegen(cg: thinlto_code_gen; disable: lto_bool) {.cdecl.}
proc thinlto_codegen_set_codegen_only(cg: thinlto_code_gen; codegen_only: lto_bool) {.
    cdecl.}
proc thinlto_debug_options(options: cstringArray; number: cint) {.cdecl.}
proc lto_module_is_thinlto(`mod`: lto_module): lto_bool {.cdecl.}
proc thinlto_codegen_add_must_preserve_symbol(cg: thinlto_code_gen; name: cstring;
    length: cint) {.cdecl.}
proc thinlto_codegen_add_cross_referenced_symbol(cg: thinlto_code_gen;
    name: cstring; length: cint) {.cdecl.}
proc thinlto_codegen_set_cache_dir(cg: thinlto_code_gen; cache_dir: cstring) {.cdecl.}
proc thinlto_codegen_set_cache_pruning_interval(cg: thinlto_code_gen;
    interval: cint) {.cdecl.}
proc thinlto_codegen_set_final_cache_size_relative_to_available_space(
    cg: thinlto_code_gen; percentage: cuint) {.cdecl.}
proc thinlto_codegen_set_cache_entry_expiration(cg: thinlto_code_gen;
    expiration: cuint) {.cdecl.}
