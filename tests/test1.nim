import LLVM,LLVM/[Types]

const
  NUM_CELLS = 30000
  CELL_SIZE_IN_BYTES = 1

type
  Instruction = ref object of RootObj

  Program = object
    module: LLVMModuleRef
    context: LLVMContextRef
    builder: LLVMBuilderRef
    cells_ptr: LLVMValueRef
    cell_index_ptr: LLVMValueRef

method compile(self: Instruction; program: Program; bb: LLVMBasicBlockRef): LLVMBasicBlockRef =
  raise newException(Exception, "overide compile")

type Increment = ref object of Instruction
  amount: int32

method compile(self: Increment; program: Program; bb: LLVMBasicBlockRef): LLVMBasicBlockRef =
  var builder = program


type DataIncrement = ref object of Instruction

type Read = ref object of Instruction

type Write = ref object of Instruction

type Loop = ref object of Instruction


  


