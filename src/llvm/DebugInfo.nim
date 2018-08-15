import Types, Core

proc `or`[T: Ordinal | enum](a, b: T): T =
  ord(a) or ord(b)

type
  LLVMDIFlags* {.size: sizeof(cint).} = enum
    LLVMDIFlagZero = 0,
    LLVMDIFlagPrivate = 1,
    LLVMDIFlagProtected = 2,
    LLVMDIFlagPublic = 3, LLVMDIFlagAccessibility = LLVMDIFlagPrivate or LLVMDIFlagProtected or LLVMDIFlagPublic,
    LLVMDIFlagFwdDecl = 1 shl 2,
    LLVMDIFlagAppleBlock = 1 shl 3,
    LLVMDIFlagBlockByrefStruct = 1 shl 4,
    LLVMDIFlagVirtual = 1 shl 5,
    LLVMDIFlagIndirectVirtualBase = (1 shl 2) or (1 shl 5),
    LLVMDIFlagArtificial = 1 shl 6,
    LLVMDIFlagExplicit = 1 shl 7,
    LLVMDIFlagPrototyped = 1 shl 8,
    LLVMDIFlagObjcClassComplete = 1 shl 9,
    LLVMDIFlagObjectPointer = 1 shl 10,
    LLVMDIFlagVector = 1 shl 11,
    LLVMDIFlagStaticMember = 1 shl 12,
    LLVMDIFlagLValueReference = 1 shl 13,
    LLVMDIFlagRValueReference = 1 shl 14,
    LLVMDIFlagReserved = 1 shl 15,
    LLVMDIFlagSingleInheritance = 1 shl 16,
    LLVMDIFlagMultipleInheritance = 2 shl 16,
    LLVMDIFlagVirtualInheritance = 3 shl 16,
    LLVMDIFlagIntroducedVirtual = 1 shl 18,
    LLVMDIFlagPtrToMemberRep = LLVMDIFlagSingleInheritance or LLVMDIFlagMultipleInheritance or LLVMDIFlagVirtualInheritance
    LLVMDIFlagBitField = 1 shl 19,
    LLVMDIFlagNoReturn = 1 shl 20,
    LLVMDIFlagMainSubprogram = 1 shl 21,

  LLVMDWARFSourceLanguage* {.size: sizeof(cint).} = enum
    LLVMDWARFSourceLanguageC89,
    LLVMDWARFSourceLanguageC,
    LLVMDWARFSourceLanguageAda83,
    LLVMDWARFSourceLanguageC_plus_plus,
    LLVMDWARFSourceLanguageCobol74,
    LLVMDWARFSourceLanguageCobol85,
    LLVMDWARFSourceLanguageFortran77,
    LLVMDWARFSourceLanguageFortran90,
    LLVMDWARFSourceLanguagePascal83,
    LLVMDWARFSourceLanguageModula2,
    LLVMDWARFSourceLanguageJava,
    LLVMDWARFSourceLanguageC99,
    LLVMDWARFSourceLanguageAda95,
    LLVMDWARFSourceLanguageFortran95,
    LLVMDWARFSourceLanguagePLI,
    LLVMDWARFSourceLanguageObjC,
    LLVMDWARFSourceLanguageObjC_plus_plus,
    LLVMDWARFSourceLanguageUPC,
    LLVMDWARFSourceLanguageD,
    LLVMDWARFSourceLanguagePython,
    LLVMDWARFSourceLanguageOpenCL,
    LLVMDWARFSourceLanguageGo,
    LLVMDWARFSourceLanguageModula3,
    LLVMDWARFSourceLanguageHaskell,
    LLVMDWARFSourceLanguageC_plus_plus_03,
    LLVMDWARFSourceLanguageC_plus_plus_11,
    LLVMDWARFSourceLanguageOCaml,
    LLVMDWARFSourceLanguageRust,
    LLVMDWARFSourceLanguageC11,
    LLVMDWARFSourceLanguageSwift,
    LLVMDWARFSourceLanguageJulia,
    LLVMDWARFSourceLanguageDylan,
    LLVMDWARFSourceLanguageC_plus_plus_14,
    LLVMDWARFSourceLanguageFortran03,
    LLVMDWARFSourceLanguageFortran08,
    LLVMDWARFSourceLanguageRenderScript,
    LLVMDWARFSourceLanguageBLISS,
    LLVMDWARFSourceLanguageMips_Assembler,
    LLVMDWARFSourceLanguageGOOGLE_RenderScript,
    LLVMDWARFSourceLanguageBORLAND_Delphi

  LLVMDWARFEmissionKind* {.size: sizeof(cint).} = enum
    LLVMDWARFEmissionNone = 0,
    LLVMDWARFEmissionFull,
    LLVMDWARFEmissionLineTablesOnly

{.push cdecl, importc.}

proc LLVMDebugMetadataVersion*(): cuint
proc LLVMGetModuleDebugMetadataVersion*(Module: LLVMModuleRef): cuint
proc LLVMStripModuleDebugInfo*(Module: LLVMModuleRef): bool
proc LLVMCreateDIBuilderDisallowUnresolved*(M: LLVMModuleRef): LLVMDIBuilderRef
proc LLVMCreateDIBuilder*(M: LLVMModuleRef): LLVMDIBuilderRef
proc LLVMDisposeDIBuilder*(Builder: LLVMDIBuilderRef)
proc LLVMDIBuilderFinalize*(Builder: LLVMDIBuilderRef)
proc LLVMDIBuilderCreateCompileUnit*(Builder: LLVMDIBuilderRef; Lang: LLVMDWARFSourceLanguage; FileRef: LLVMMetadataRef; Producer: cstring; ProducerLen: csize; isOptimized: bool; Flags: cstring; FlagsLen: csize; RuntimeVer: cuint; SplitName: cstring; SplitNameLen: csize; Kind: LLVMDWARFEmissionKind; DWOId: cuint; SplitDebugInlining: bool; DebugInfoForProfiling: bool): LLVMMetadataRef
proc LLVMDIBuilderCreateFile*(Builder: LLVMDIBuilderRef; Filename: cstring; FilenameLen: csize; Directory: cstring; DirectoryLen: csize): LLVMMetadataRef
proc LLVMDIBuilderCreateDebugLocation*(Ctx: LLVMContextRef; Line: cuint; Column: cuint; Scope: LLVMMetadataRef; InlinedAt: LLVMMetadataRef): LLVMMetadataRef

{.pop.}
