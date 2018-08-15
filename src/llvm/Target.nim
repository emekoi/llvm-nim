import ospaths, strutils
const sourcePath = currentSourcePath().split({'\\', '/'})[0..^2].join("/")
const headerTarget = sourcePath & "Target.h"
type
  LLVMByteOrdering {.size: sizeof(cint).} = enum
    LLVMBigEndian, LLVMLittleEndian


type
  LLVMTargetDataRef = ptr LLVMOpaqueTargetData
  LLVMTargetLibraryInfoRef = ptr LLVMOpaqueTargetLibraryInfotData

proc LLVMInitializeAllTargetInfos() {.inline, cdecl.}
proc LLVMInitializeAllTargets() {.inline, cdecl.}
proc LLVMInitializeAllTargetMCs() {.inline, cdecl.}
proc LLVMInitializeAllAsmPrinters() {.inline, cdecl.}
proc LLVMInitializeAllAsmParsers() {.inline, cdecl.}
proc LLVMInitializeAllDisassemblers() {.inline, cdecl.}
proc LLVMInitializeNativeTarget(): bool {.inline, cdecl.}
proc LLVMInitializeNativeAsmParser(): bool {.inline, cdecl.}
proc LLVMInitializeNativeAsmPrinter(): bool {.inline, cdecl.}
proc LLVMInitializeNativeDisassembler(): bool {.inline, cdecl.}
proc LLVMGetModuleDataLayout(M: LLVMModuleRef): LLVMTargetDataRef {.cdecl.}
proc LLVMSetModuleDataLayout(M: LLVMModuleRef; DL: LLVMTargetDataRef) {.cdecl.}
proc LLVMCreateTargetData(StringRep: cstring): LLVMTargetDataRef {.cdecl.}
proc LLVMDisposeTargetData(TD: LLVMTargetDataRef) {.cdecl.}
proc LLVMAddTargetLibraryInfo(TLI: LLVMTargetLibraryInfoRef; PM: LLVMPassManagerRef) {.
    cdecl.}
proc LLVMCopyStringRepOfTargetData(TD: LLVMTargetDataRef): cstring {.cdecl.}
proc LLVMByteOrder(TD: LLVMTargetDataRef): LLVMByteOrdering {.cdecl.}
proc LLVMPointerSize(TD: LLVMTargetDataRef): cuint {.cdecl.}
proc LLVMPointerSizeForAS(TD: LLVMTargetDataRef; AS: cuint): cuint {.cdecl.}
proc LLVMIntPtrType(TD: LLVMTargetDataRef): LLVMTypeRef {.cdecl.}
proc LLVMIntPtrTypeForAS(TD: LLVMTargetDataRef; AS: cuint): LLVMTypeRef {.cdecl.}
proc LLVMIntPtrTypeInContext(C: LLVMContextRef; TD: LLVMTargetDataRef): LLVMTypeRef {.
    cdecl.}
proc LLVMIntPtrTypeForASInContext(C: LLVMContextRef; TD: LLVMTargetDataRef; AS: cuint): LLVMTypeRef {.
    cdecl.}
proc LLVMSizeOfTypeInBits(TD: LLVMTargetDataRef; Ty: LLVMTypeRef): culonglong {.cdecl.}
proc LLVMStoreSizeOfType(TD: LLVMTargetDataRef; Ty: LLVMTypeRef): culonglong {.cdecl.}
proc LLVMABISizeOfType(TD: LLVMTargetDataRef; Ty: LLVMTypeRef): culonglong {.cdecl.}
proc LLVMABIAlignmentOfType(TD: LLVMTargetDataRef; Ty: LLVMTypeRef): cuint {.cdecl.}
proc LLVMCallFrameAlignmentOfType(TD: LLVMTargetDataRef; Ty: LLVMTypeRef): cuint {.
    cdecl.}
proc LLVMPreferredAlignmentOfType(TD: LLVMTargetDataRef; Ty: LLVMTypeRef): cuint {.
    cdecl.}
proc LLVMPreferredAlignmentOfGlobal(TD: LLVMTargetDataRef; GlobalVar: LLVMValueRef): cuint {.
    cdecl.}
proc LLVMElementAtOffset(TD: LLVMTargetDataRef; StructTy: LLVMTypeRef;
                        Offset: culonglong): cuint {.cdecl.}
proc LLVMOffsetOfElement(TD: LLVMTargetDataRef; StructTy: LLVMTypeRef; Element: cuint): culonglong {.
    cdecl.}
