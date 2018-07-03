# import
#   llvm/Support/DataTypes



type
  ## An opaque reference to a disassembler context.
  LLVMDisasmContextRef* = pointer

  ## The type for the operand information call back function.  This is called to
  ## get the symbolic information for an operand of an instruction.  Typically
  ## this is from the relocation information, symbol table, etc.  That block of
  ## information is saved when the disassembler context is created and passed to
  ## the call back in the DisInfo parameter.  The instruction containing operand
  ## is at the PC parameter.  For some instruction sets, there can be more than
  ## one operand with symbolic information.  To determine the symbolic operand
  ## information for each operand, the bytes for the specific operand in the
  ## instruction are specified by the Offset parameter and its byte widith is the
  ## size parameter.  For instructions sets with fixed widths and one symbolic
  ## operand per instruction, the Offset parameter will be zero and Size parameter
  ## will be the instruction width.  The information is returned in TagBuf and is
  ## Triple specific with its specific information defined by the value of
  ## TagType for that Triple.  If symbolic information is returned the function
  ## returns 1, otherwise it returns 0.
  LLVMOpInfoCallback* = proc (disInfo: pointer; pc: uint64T; offset: uint64T;
                           size: uint64T; tagType: cint; tagBuf: pointer): cint

  ## The initial support in LLVM MC for the most general form of a relocatable
  ## expression is "AddSymbol - SubtractSymbol + Offset".  For some Darwin targets
  ## this full form is encoded in the relocation information so that AddSymbol and
  ## SubtractSymbol can be link edited independent of each other.  Many other
  ## platforms only allow a relocatable expression of the form AddSymbol + Offset
  ## to be encoded.
  ##
  ## The LLVMOpInfoCallback() for the TagType value of 1 uses the struct
  ## LLVMOpInfo1.  The value of the relocatable expression for the operand,
  ## including any PC adjustment, is passed in to the call back in the Value
  ## field.  The symbolic information about the operand is returned using all
  ## the fields of the structure with the Offset of the relocatable expression
  ## returned in the Value field.  It is possible that some symbols in the
  ## relocatable expression were assembly temporary symbols, for example
  ## "Ldata - LpicBase + constant", and only the Values of the symbols without
  ## symbol names are present in the relocation information.  The VariantKind
  ## type is one of the Target specific #defines below and is used to print
  ## operands like "_foo@GOT", ":lower16:_foo", etc.
  LLVMOpInfoSymbol1* {.bycopy.} = object
    present*: uint64T          ##  1 if this symbol is present
    name*: cstring             ##  symbol name if not NULL
    value*: uint64T            ##  symbol value if name is NULL

  LLVMOpInfo1* {.bycopy.} = object
    addSymbol*: LLVMOpInfoSymbol1
    subtractSymbol*: LLVMOpInfoSymbol1
    value*: uint64T
    variantKind*: uint64T

## The operand VariantKinds for symbolic disassembly.
const
  LLVMDisassemblerVariantKindNone* = 0

  ## The ARM target VariantKinds.
  LLVMDisassemblerVariantKindARM_HI16* = 1
  LLVMDisassemblerVariantKindARM_LO16* = 2

  ## The ARM64 target VariantKinds.
  LLVMDisassemblerVariantKindARM64PAGE* = 1
  LLVMDisassemblerVariantKindARM64PAGEOFF* = 2
  LLVMDisassemblerVariantKindARM64GOTPAGE* = 3
  LLVMDisassemblerVariantKindARM64GOTPAGEOFF* = 4
  LLVMDisassemblerVariantKindARM64TLVP* = 5
  LLVMDisassemblerVariantKindARM64TLVOFF* = 6

type
  ## The type for the symbol lookup function.  This may be called by the
  ## disassembler for things like adding a comment for a PC plus a constant
  ## offset load instruction to use a symbol name instead of a load address value.
  ## It is passed the block information is saved when the disassembler context is
  ## created and the ReferenceValue to look up as a symbol.  If no symbol is found
  ## for the ReferenceValue NULL is returned.  The ReferenceType of the
  ## instruction is passed indirectly as is the PC of the instruction in
  ## ReferencePC.  If the output reference can be determined its type is returned
  ## indirectly in ReferenceType along with ReferenceName if any, or that is set
  ## to NULL.
  LLVMSymbolLookupCallback* = proc (disInfo: pointer; referenceValue: uint64T;
                                 referenceType: ptr uint64T; referencePC: uint64T;
                                 referenceName: cstringArray): cstring

## The reference types on input and output.

const
  ## No input reference type or no output reference type.
  LLVMDisassemblerReferenceTypeInOutNone* = 0

  ## The input reference is from a branch instruction.
  LLVMDisassemblerReferenceTypeInBranch* = 1

  ## The input reference is from a PC relative load instruction.
  LLVMDisassemblerReferenceTypeInPCrelLoad* = 2

  ## The input reference is from an ARM64::ADRP instruction.
  LLVMDisassemblerReferenceTypeInARM64ADRP* = 0x0000000100000001'i64

  ## The input reference is from an ARM64::ADDXri instruction.
  LLVMDisassemblerReferenceTypeInARM64ADDXri* = 0x0000000100000002'i64

  ## The input reference is from an ARM64::LDRXui instruction.
  LLVMDisassemblerReferenceTypeInARM64LDRXui* = 0x0000000100000003'i64

##  The input reference is from an ARM64::LDRXl instruction.

const
  LLVMDisassemblerReferenceTypeInARM64LDRXl* = 0x0000000100000004'i64

##  The input reference is from an ARM64::ADR instruction.

const
  LLVMDisassemblerReferenceTypeInARM64ADR* = 0x0000000100000005'i64

##  The output reference is to as symbol stub.

const
  LLVMDisassemblerReferenceTypeOutSymbolStub* = 1

##  The output reference is to a symbol address in a literal pool.

const
  LLVMDisassemblerReferenceTypeOutLitPoolSymAddr* = 2

##  The output reference is to a cstring address in a literal pool.

const
  LLVMDisassemblerReferenceTypeOutLitPoolCstrAddr* = 3

##  The output reference is to a Objective-C CoreFoundation string.

const
  LLVMDisassemblerReferenceTypeOutObjcCFStringRef* = 4

##  The output reference is to a Objective-C message.

const
  LLVMDisassemblerReferenceTypeOutObjcMessage* = 5

##  The output reference is to a Objective-C message ref.

const
  LLVMDisassemblerReferenceTypeOutObjcMessageRef* = 6

##  The output reference is to a Objective-C selector ref.

const
  LLVMDisassemblerReferenceTypeOutObjcSelectorRef* = 7

##  The output reference is to a Objective-C class ref.

const
  LLVMDisassemblerReferenceTypeOutObjcClassRef* = 8

##  The output reference is to a C++ symbol name.

const
  LLVMDisassemblerReferenceTypeDeMangledName* = 9

## *
##  Create a disassembler for the TripleName.  Symbolic disassembly is supported
##  by passing a block of information in the DisInfo parameter and specifying the
##  TagType and callback functions as described above.  These can all be passed
##  as NULL.  If successful, this returns a disassembler context.  If not, it
##  returns NULL. This function is equivalent to calling
##  LLVMCreateDisasmCPUFeatures() with an empty CPU name and feature set.
##

proc LLVMCreateDisasm*(tripleName: cstring; disInfo: pointer; tagType: cint;
                      getOpInfo: LLVMOpInfoCallback;
                      symbolLookUp: LLVMSymbolLookupCallback): LLVMDisasmContextRef
## *
##  Create a disassembler for the TripleName and a specific CPU.  Symbolic
##  disassembly is supported by passing a block of information in the DisInfo
##  parameter and specifying the TagType and callback functions as described
##  above.  These can all be passed * as NULL.  If successful, this returns a
##  disassembler context.  If not, it returns NULL. This function is equivalent
##  to calling LLVMCreateDisasmCPUFeatures() with an empty feature set.
##

proc LLVMCreateDisasmCPU*(triple: cstring; cpu: cstring; disInfo: pointer;
                         tagType: cint; getOpInfo: LLVMOpInfoCallback;
                         symbolLookUp: LLVMSymbolLookupCallback): LLVMDisasmContextRef
## *
##  Create a disassembler for the TripleName, a specific CPU and specific feature
##  string.  Symbolic disassembly is supported by passing a block of information
##  in the DisInfo parameter and specifying the TagType and callback functions as
##  described above.  These can all be passed * as NULL.  If successful, this
##  returns a disassembler context.  If not, it returns NULL.
##

proc LLVMCreateDisasmCPUFeatures*(triple: cstring; cpu: cstring; features: cstring;
                                 disInfo: pointer; tagType: cint;
                                 getOpInfo: LLVMOpInfoCallback;
                                 symbolLookUp: LLVMSymbolLookupCallback): LLVMDisasmContextRef
## *
##  Set the disassembler's options.  Returns 1 if it can set the Options and 0
##  otherwise.
##

proc LLVMSetDisasmOptions*(dc: LLVMDisasmContextRef; options: uint64T): cint
##  The option to produce marked up assembly.

const
  LLVMDisassemblerOptionUseMarkup* = 1

##  The option to print immediates as hex.

const
  LLVMDisassemblerOptionPrintImmHex* = 2

##  The option use the other assembler printer variant

const
  LLVMDisassemblerOptionAsmPrinterVariant* = 4

##  The option to set comment on instructions

const
  LLVMDisassemblerOptionSetInstrComments* = 8

##  The option to print latency information alongside instructions

const
  LLVMDisassemblerOptionPrintLatency* = 16

## *
##  Dispose of a disassembler context.
##

proc LLVMDisasmDispose*(dc: LLVMDisasmContextRef)
## *
##  Disassemble a single instruction using the disassembler context specified in
##  the parameter DC.  The bytes of the instruction are specified in the
##  parameter Bytes, and contains at least BytesSize number of bytes.  The
##  instruction is at the address specified by the PC parameter.  If a valid
##  instruction can be disassembled, its string is returned indirectly in
##  OutString whose size is specified in the parameter OutStringSize.  This
##  function returns the number of bytes in the instruction or zero if there was
##  no valid instruction.
##

proc LLVMDisasmInstruction*(dc: LLVMDisasmContextRef; bytes: ptr uint8T;
                           bytesSize: uint64T; pc: uint64T; outString: cstring;
                           outStringSize: csize): csize
## *
##  @}
##
