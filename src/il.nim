#-----------------------------------------------------------------------------
#
# ImageLib Sources
# Copyright (C) 2000-2009 by Denton Woods
# Last modified: 03/07/2009
#
# Filename: IL/il.h
#
# Description: The main include file for DevIL
#
#-----------------------------------------------------------------------------
#this define controls if floats and doubles are clampled to [0..1]
#during conversion. It takes a little more time, but it is the correct
#way of doing this. If you are sure your floats are always valid,
#you can undefine this value...
when defined(Windows):
  const sourceLib = "DevIL.dll"
elif defined(Linux):
  const sourceLib = "libIL.so"

const 
  CLAMP_HALF* = 1
  CLAMP_FLOATS* = 1
  CLAMP_DOUBLES* = 1

type 
  ILenum* = cuint
  ILboolean* = cuchar
  ILbitfield* = cuint
  ILbyte* = cchar
  ILshort* = cshort
  ILint* = cint
  ILsizei* = csize
  ILubyte* = cuchar
  ILushort* = cushort
  ILuint* = cuint
  ILfloat* = cfloat
  ILclampf* = cfloat
  ILdouble* = cdouble
  ILclampd* = cdouble
  ILint64* = int64
  ILuint64* = uint64

when defined(IL_UNICODE): 
  type 
    ILchar* = wchar_t
    ILstring* = ptr wchar_t
    ILconst_string* = ptr wchar_t
else: 
  type 
    ILchar* = char
    ILstring* = cstring
    ILconst_string* = cstring
const 
  IL_FALSE* = 0
  IL_TRUE* = 1

#  Matches OpenGL's right now.
#! Data formats \link Formats Formats\endlink

const 
  IL_COLOUR_INDEX* = 0x00001900
  IL_COLOR_INDEX* = 0x00001900
  IL_ALPHA* = 0x00001906
  IL_RGB* = 0x00001907
  IL_RGBA* = 0x00001908
  IL_BGR* = 0x000080E0
  IL_BGRA* = 0x000080E1
  IL_LUMINANCE* = 0x00001909
  IL_LUMINANCE_ALPHA* = 0x0000190A

#! Data types \link Types Types\endlink

const 
  cIL_BYTE* = 0x00001400
  cIL_UNSIGNED_BYTE* = 0x00001401
  cIL_SHORT* = 0x00001402
  cIL_UNSIGNED_SHORT* = 0x00001403
  cIL_INT* = 0x00001404
  cIL_UNSIGNED_INT* = 0x00001405
  cIL_FLOAT* = 0x00001406
  cIL_DOUBLE* = 0x0000140A
  cIL_HALF* = 0x0000140B
  cIL_MAX_BYTE* = high(cchar)
  cIL_MAX_UNSIGNED_BYTE* = high(cuchar)
  cIL_MAX_SHORT* = high(cshort)
  cIL_MAX_UNSIGNED_SHORT* = high(cushort)
  cIL_MAX_INT* = high(cint)
  cIL_MAX_UNSIGNED_INT* = high(cuint)

template IL_LIMIT*(x, m, z: expr): expr = 
  (if x < m: m else: (if x > z: z else: x))

template IL_CLAMP*(x: expr): expr = 
  IL_LIMIT(x, 0, 1)

const 
  IL_VENDOR* = 0x00001F00
  IL_LOAD_EXT* = 0x00001F01
  IL_SAVE_EXT* = 0x00001F02

#
# IL-specific #define's
#

const 
  IL_VERSION_1_7_8* = 1
  IL_VERSION* = 178

# Attribute Bits

const 
  IL_ORIGIN_BIT* = 0x00000001
  IL_FILE_BIT* = 0x00000002
  IL_PAL_BIT* = 0x00000004
  IL_FORMAT_BIT* = 0x00000008
  IL_TYPE_BIT* = 0x00000010
  IL_COMPRESS_BIT* = 0x00000020
  IL_LOADFAIL_BIT* = 0x00000040
  IL_FORMAT_SPECIFIC_BIT* = 0x00000080
  IL_ALL_ATTRIB_BITS* = 0x000FFFFF

# Palette types

const 
  IL_PAL_NONE* = 0x00000400
  IL_PAL_RGB24* = 0x00000401
  IL_PAL_RGB32* = 0x00000402
  IL_PAL_RGBA32* = 0x00000403
  IL_PAL_BGR24* = 0x00000404
  IL_PAL_BGR32* = 0x00000405
  IL_PAL_BGRA32* = 0x00000406

# Image types

const 
  IL_TYPE_UNKNOWN* = 0x00000000
  IL_BMP* = 0x00000420
  IL_CUT* = 0x00000421
  IL_DOOM* = 0x00000422
  IL_DOOM_FLAT* = 0x00000423
  IL_ICO* = 0x00000424
  IL_JPG* = 0x00000425
  IL_JFIF* = 0x00000425
  IL_ILBM* = 0x00000426
  IL_PCD* = 0x00000427
  IL_PCX* = 0x00000428
  IL_PIC* = 0x00000429
  IL_PNG* = 0x0000042A
  IL_PNM* = 0x0000042B
  IL_SGI* = 0x0000042C
  IL_TGA* = 0x0000042D
  IL_TIF* = 0x0000042E
  IL_CHEAD* = 0x0000042F
  IL_RAW* = 0x00000430
  IL_MDL* = 0x00000431
  IL_WAL* = 0x00000432
  IL_LIF* = 0x00000434
  IL_MNG* = 0x00000435
  IL_JNG* = 0x00000435
  IL_GIF* = 0x00000436
  IL_DDS* = 0x00000437
  IL_DCX* = 0x00000438
  IL_PSD* = 0x00000439
  IL_EXIF* = 0x0000043A
  IL_PSP* = 0x0000043B
  IL_PIX* = 0x0000043C
  IL_PXR* = 0x0000043D
  IL_XPM* = 0x0000043E
  IL_HDR* = 0x0000043F
  IL_ICNS* = 0x00000440
  IL_JP2* = 0x00000441
  IL_EXR* = 0x00000442
  IL_WDP* = 0x00000443
  IL_VTF* = 0x00000444
  IL_WBMP* = 0x00000445
  IL_SUN* = 0x00000446
  IL_IFF* = 0x00000447
  IL_TPL* = 0x00000448
  IL_FITS* = 0x00000449
  IL_DICOM* = 0x0000044A
  IL_IWI* = 0x0000044B
  IL_BLP* = 0x0000044C
  IL_FTX* = 0x0000044D
  IL_ROT* = 0x0000044E
  IL_TEXTURE* = 0x0000044F
  IL_DPX* = 0x00000450
  IL_UTX* = 0x00000451
  IL_MP3* = 0x00000452
  IL_JASC_PAL* = 0x00000475

# Error Types

const 
  IL_NO_ERROR* = 0x00000000
  IL_INVALID_ENUM* = 0x00000501
  IL_OUT_OF_MEMORY* = 0x00000502
  IL_FORMAT_NOT_SUPPORTED* = 0x00000503
  IL_INTERNAL_ERROR* = 0x00000504
  IL_INVALID_VALUE* = 0x00000505
  IL_ILLEGAL_OPERATION* = 0x00000506
  IL_ILLEGAL_FILE_VALUE* = 0x00000507
  IL_INVALID_FILE_HEADER* = 0x00000508
  IL_INVALID_PARAM* = 0x00000509
  IL_COULD_NOT_OPEN_FILE* = 0x0000050A
  IL_INVALID_EXTENSION* = 0x0000050B
  IL_FILE_ALREADY_EXISTS* = 0x0000050C
  IL_OUT_FORMAT_SAME* = 0x0000050D
  IL_STACK_OVERFLOW* = 0x0000050E
  IL_STACK_UNDERFLOW* = 0x0000050F
  IL_INVALID_CONVERSION* = 0x00000510
  IL_BAD_DIMENSIONS* = 0x00000511
  IL_FILE_READ_ERROR* = 0x00000512
  IL_FILE_WRITE_ERROR* = 0x00000512
  IL_LIB_GIF_ERROR* = 0x000005E1
  IL_LIB_JPEG_ERROR* = 0x000005E2
  IL_LIB_PNG_ERROR* = 0x000005E3
  IL_LIB_TIFF_ERROR* = 0x000005E4
  IL_LIB_MNG_ERROR* = 0x000005E5
  IL_LIB_JP2_ERROR* = 0x000005E6
  IL_LIB_EXR_ERROR* = 0x000005E7
  IL_UNKNOWN_ERROR* = 0x000005FF

# Origin Definitions

const 
  IL_ORIGIN_SET* = 0x00000600
  IL_ORIGIN_LOWER_LEFT* = 0x00000601
  IL_ORIGIN_UPPER_LEFT* = 0x00000602
  IL_ORIGIN_MODE* = 0x00000603

# Format and Type Mode Definitions

const 
  IL_FORMAT_SET* = 0x00000610
  IL_FORMAT_MODE* = 0x00000611
  IL_TYPE_SET* = 0x00000612
  IL_TYPE_MODE* = 0x00000613

# File definitions

const 
  IL_FILE_OVERWRITE* = 0x00000620
  IL_FILE_MODE* = 0x00000621

# Palette definitions

const 
  IL_CONV_PAL* = 0x00000630

# Load fail definitions

const 
  IL_DEFAULT_ON_FAIL* = 0x00000632

# Key colour and alpha definitions

const 
  IL_USE_KEY_COLOUR* = 0x00000635
  IL_USE_KEY_COLOR* = 0x00000635
  IL_BLIT_BLEND* = 0x00000636

# Interlace definitions

const 
  IL_SAVE_INTERLACED* = 0x00000639
  IL_INTERLACE_MODE* = 0x0000063A

# Quantization definitions

const 
  IL_QUANTIZATION_MODE* = 0x00000640
  IL_WU_QUANT* = 0x00000641
  IL_NEU_QUANT* = 0x00000642
  IL_NEU_QUANT_SAMPLE* = 0x00000643
  IL_MAX_QUANT_INDEXS* = 0x00000644
  IL_MAX_QUANT_INDICES* = 0x00000644

# Hints

const 
  IL_FASTEST* = 0x00000660
  IL_LESS_MEM* = 0x00000661
  IL_DONT_CARE* = 0x00000662
  IL_MEM_SPEED_HINT* = 0x00000665
  IL_USE_COMPRESSION* = 0x00000666
  IL_NO_COMPRESSION* = 0x00000667
  IL_COMPRESSION_HINT* = 0x00000668

# Compression

const 
  IL_NVIDIA_COMPRESS* = 0x00000670
  IL_SQUISH_COMPRESS* = 0x00000671

# Subimage types

const 
  IL_SUB_NEXT* = 0x00000680
  IL_SUB_MIPMAP* = 0x00000681
  IL_SUB_LAYER* = 0x00000682

# Compression definitions

const 
  IL_COMPRESS_MODE* = 0x00000700
  IL_COMPRESS_NONE* = 0x00000701
  IL_COMPRESS_RLE* = 0x00000702
  IL_COMPRESS_LZO* = 0x00000703
  IL_COMPRESS_ZLIB* = 0x00000704

# File format-specific values

const 
  IL_TGA_CREATE_STAMP* = 0x00000710
  IL_JPG_QUALITY* = 0x00000711
  IL_PNG_INTERLACE* = 0x00000712
  IL_TGA_RLE* = 0x00000713
  IL_BMP_RLE* = 0x00000714
  IL_SGI_RLE* = 0x00000715
  IL_TGA_ID_STRING* = 0x00000717
  IL_TGA_AUTHNAME_STRING* = 0x00000718
  IL_TGA_AUTHCOMMENT_STRING* = 0x00000719
  IL_PNG_AUTHNAME_STRING* = 0x0000071A
  IL_PNG_TITLE_STRING* = 0x0000071B
  IL_PNG_DESCRIPTION_STRING* = 0x0000071C
  IL_TIF_DESCRIPTION_STRING* = 0x0000071D
  IL_TIF_HOSTCOMPUTER_STRING* = 0x0000071E
  IL_TIF_DOCUMENTNAME_STRING* = 0x0000071F
  IL_TIF_AUTHNAME_STRING* = 0x00000720
  IL_JPG_SAVE_FORMAT* = 0x00000721
  IL_CHEAD_HEADER_STRING* = 0x00000722
  IL_PCD_PICNUM* = 0x00000723
  IL_PNG_ALPHA_INDEX* = 0x00000724
  IL_JPG_PROGRESSIVE* = 0x00000725
  IL_VTF_COMP* = 0x00000726

# DXTC definitions

const 
  IL_DXTC_FORMAT* = 0x00000705
  IL_DXT1* = 0x00000706
  IL_DXT2* = 0x00000707
  IL_DXT3* = 0x00000708
  IL_DXT4* = 0x00000709
  IL_DXT5* = 0x0000070A
  IL_DXT_NO_COMP* = 0x0000070B
  IL_KEEP_DXTC_DATA* = 0x0000070C
  IL_DXTC_DATA_FORMAT* = 0x0000070D
  IL_3DC* = 0x0000070E
  IL_RXGB* = 0x0000070F
  IL_ATI1N* = 0x00000710
  IL_DXT1A* = 0x00000711

# Environment map definitions

const 
  IL_CUBEMAP_POSITIVEX* = 0x00000400
  IL_CUBEMAP_NEGATIVEX* = 0x00000800
  IL_CUBEMAP_POSITIVEY* = 0x00001000
  IL_CUBEMAP_NEGATIVEY* = 0x00002000
  IL_CUBEMAP_POSITIVEZ* = 0x00004000
  IL_CUBEMAP_NEGATIVEZ* = 0x00008000
  IL_SPHEREMAP* = 0x00010000

# Values

const 
  IL_VERSION_NUM* = 0x00000DE2
  IL_IMAGE_WIDTH* = 0x00000DE4
  IL_IMAGE_HEIGHT* = 0x00000DE5
  IL_IMAGE_DEPTH* = 0x00000DE6
  IL_IMAGE_SIZE_OF_DATA* = 0x00000DE7
  IL_IMAGE_BYTES_PER_PIXEL* = 0x00000DE8
  IL_IMAGE_BPP* = 0x00000DE8
  IL_IMAGE_BITS_PER_PIXEL* = 0x00000DE9
  IL_IMAGE_FORMAT* = 0x00000DEA
  IL_IMAGE_TYPE* = 0x00000DEB
  IL_PALETTE_TYPE* = 0x00000DEC
  IL_PALETTE_SIZE* = 0x00000DED
  IL_PALETTE_BPP* = 0x00000DEE
  IL_PALETTE_NUM_COLS* = 0x00000DEF
  IL_PALETTE_BASE_TYPE* = 0x00000DF0
  IL_NUM_FACES* = 0x00000DE1
  IL_NUM_IMAGES* = 0x00000DF1
  IL_NUM_MIPMAPS* = 0x00000DF2
  cIL_NUM_LAYERS* = 0x00000DF3
  cIL_ACTIVE_IMAGE* = 0x00000DF4
  cIL_ACTIVE_MIPMAP* = 0x00000DF5
  cIL_ACTIVE_LAYER* = 0x00000DF6
  cIL_ACTIVE_FACE* = 0x00000E00
  IL_CUR_IMAGE* = 0x00000DF7
  IL_IMAGE_DURATION* = 0x00000DF8
  IL_IMAGE_PLANESIZE* = 0x00000DF9
  IL_IMAGE_BPC* = 0x00000DFA
  IL_IMAGE_OFFX* = 0x00000DFB
  IL_IMAGE_OFFY* = 0x00000DFC
  IL_IMAGE_CUBEFLAGS* = 0x00000DFD
  IL_IMAGE_ORIGIN* = 0x00000DFE
  IL_IMAGE_CHANNELS* = 0x00000DFF
  IL_SEEK_SET* = 0
  IL_SEEK_CUR* = 1
  IL_SEEK_END* = 2
  IL_EOF* = - 1

# Callback functions for file reading

type 
  ILHANDLE* = pointer
  fCloseRProc* = proc (a2: ILHANDLE)
  fEofProc* = proc (a2: ILHANDLE): ILboolean
  fGetcProc* = proc (a2: ILHANDLE): ILint
  fOpenRProc* = proc (a2: ILconst_string): ILHANDLE
  fReadProc* = proc (a2: pointer; a3: ILuint; a4: ILuint; a5: ILHANDLE): ILint
  fSeekRProc* = proc (a2: ILHANDLE; a3: ILint; a4: ILint): ILint
  fTellRProc* = proc (a2: ILHANDLE): ILint

# Callback functions for file writing

type 
  fCloseWProc* = proc (a2: ILHANDLE)
  fOpenWProc* = proc (a2: ILconst_string): ILHANDLE
  fPutcProc* = proc (a2: ILubyte; a3: ILHANDLE): ILint
  fSeekWProc* = proc (a2: ILHANDLE; a3: ILint; a4: ILint): ILint
  fTellWProc* = proc (a2: ILHANDLE): ILint
  fWriteProc* = proc (a2: pointer; a3: ILuint; a4: ILuint; a5: ILHANDLE): ILint

# Callback functions for allocation and deallocation

type 
  mAlloc* = proc (a2: ILsizei): pointer
  mFree* = proc (CONST_RESTRICT: pointer)

# Registered format procedures

type 
  IL_LOADPROC* = proc (a2: ILconst_string): ILenum
  IL_SAVEPROC* = proc (a2: ILconst_string): ILenum

# ImageLib Functions

proc ilActiveFace*(Number: ILuint): ILboolean {.importc: "ilActiveFace", 
    dynlib: sourceLib.}
proc ilActiveImage*(Number: ILuint): ILboolean {.importc: "ilActiveImage", 
    dynlib: sourceLib.}
proc ilActiveLayer*(Number: ILuint): ILboolean {.importc: "ilActiveLayer", 
    dynlib: sourceLib.}
proc ilActiveMipmap*(Number: ILuint): ILboolean {.importc: "ilActiveMipmap", 
    dynlib: sourceLib.}
proc ilApplyPal*(FileName: ILconst_string): ILboolean {.importc: "ilApplyPal", 
    dynlib: sourceLib.}
proc ilApplyProfile*(InProfile: ILstring; OutProfile: ILstring): ILboolean {.
    importc: "ilApplyProfile", dynlib: sourceLib.}
proc ilBindImage*(Image: ILuint) {.importc: "ilBindImage", dynlib: sourceLib.}
proc ilBlit*(Source: ILuint; DestX: ILint; DestY: ILint; DestZ: ILint; 
             SrcX: ILuint; SrcY: ILuint; SrcZ: ILuint; Width: ILuint; 
             Height: ILuint; Depth: ILuint): ILboolean {.importc: "ilBlit", 
    dynlib: sourceLib.}
proc ilClampNTSC*(): ILboolean {.importc: "ilClampNTSC", dynlib: sourceLib.}
proc ilClearColour*(Red: ILclampf; Green: ILclampf; Blue: ILclampf; 
                    Alpha: ILclampf) {.importc: "ilClearColour", 
                                       dynlib: sourceLib.}
proc ilClearImage*(): ILboolean {.importc: "ilClearImage", dynlib: sourceLib.}
proc ilCloneCurImage*(): ILuint {.importc: "ilCloneCurImage", dynlib: sourceLib.}
proc ilCompressDXT*(Data: ptr ILubyte; Width: ILuint; Height: ILuint; 
                    Depth: ILuint; DXTCFormat: ILenum; DXTCSize: ptr ILuint): ptr ILubyte {.
    importc: "ilCompressDXT", dynlib: sourceLib.}
proc ilCompressFunc*(Mode: ILenum): ILboolean {.importc: "ilCompressFunc", 
    dynlib: sourceLib.}
proc ilConvertImage*(DestFormat: ILenum; DestType: ILenum): ILboolean {.
    importc: "ilConvertImage", dynlib: sourceLib.}
proc ilConvertPal*(DestFormat: ILenum): ILboolean {.importc: "ilConvertPal", 
    dynlib: sourceLib.}
proc ilCopyImage*(Src: ILuint): ILboolean {.importc: "ilCopyImage", 
    dynlib: sourceLib.}
proc ilCopyPixels*(XOff: ILuint; YOff: ILuint; ZOff: ILuint; Width: ILuint; 
                   Height: ILuint; Depth: ILuint; Format: ILenum; Typ: ILenum; 
                   Data: pointer): ILuint {.importc: "ilCopyPixels", 
    dynlib: sourceLib.}
proc ilCreateSubImage*(Typ: ILenum; Num: ILuint): ILuint {.
    importc: "ilCreateSubImage", dynlib: sourceLib.}
proc ilDefaultImage*(): ILboolean {.importc: "ilDefaultImage", dynlib: sourceLib.}
proc ilDeleteImage*(Num: ILuint) {.importc: "ilDeleteImage", dynlib: sourceLib.}
proc ilDeleteImages*(Num: ILsizei; Images: ptr ILuint) {.
    importc: "ilDeleteImages", dynlib: sourceLib.}
proc ilDetermineType*(FileName: ILconst_string): ILenum {.
    importc: "ilDetermineType", dynlib: sourceLib.}
proc ilDetermineTypeF*(File: ILHANDLE): ILenum {.importc: "ilDetermineTypeF", 
    dynlib: sourceLib.}
proc ilDetermineTypeL*(Lump: pointer; Size: ILuint): ILenum {.
    importc: "ilDetermineTypeL", dynlib: sourceLib.}
proc ilDisable*(Mode: ILenum): ILboolean {.importc: "ilDisable", 
    dynlib: sourceLib.}
proc ilDxtcDataToImage*(): ILboolean {.importc: "ilDxtcDataToImage", 
                                       dynlib: sourceLib.}
proc ilDxtcDataToSurface*(): ILboolean {.importc: "ilDxtcDataToSurface", 
    dynlib: sourceLib.}
proc ilEnable*(Mode: ILenum): ILboolean {.importc: "ilEnable", dynlib: sourceLib.}
proc ilFlipSurfaceDxtcData*() {.importc: "ilFlipSurfaceDxtcData", 
                                dynlib: sourceLib.}
proc ilFormatFunc*(Mode: ILenum): ILboolean {.importc: "ilFormatFunc", 
    dynlib: sourceLib.}
proc ilGenImages*(Num: ILsizei; Images: ptr ILuint) {.importc: "ilGenImages", 
    dynlib: sourceLib.}
proc ilGenImage*(): ILuint {.importc: "ilGenImage", dynlib: sourceLib.}
proc ilGetAlpha*(Typ: ILenum): ptr ILubyte {.importc: "ilGetAlpha", 
    dynlib: sourceLib.}
proc ilGetBoolean*(Mode: ILenum): ILboolean {.importc: "ilGetBoolean", 
    dynlib: sourceLib.}
proc ilGetBooleanv*(Mode: ILenum; Param: ptr ILboolean) {.
    importc: "ilGetBooleanv", dynlib: sourceLib.}
proc ilGetData*(): ptr ILubyte {.importc: "ilGetData", dynlib: sourceLib.}
proc ilGetDXTCData*(Buffer: pointer; BufferSize: ILuint; DXTCFormat: ILenum): ILuint {.
    importc: "ilGetDXTCData", dynlib: sourceLib.}
proc ilGetError*(): ILenum {.importc: "ilGetError", dynlib: sourceLib.}
proc ilGetInteger*(Mode: ILenum): ILint {.importc: "ilGetInteger", 
    dynlib: sourceLib.}
proc ilGetIntegerv*(Mode: ILenum; Param: ptr ILint) {.importc: "ilGetIntegerv", 
    dynlib: sourceLib.}
proc ilGetLumpPos*(): ILuint {.importc: "ilGetLumpPos", dynlib: sourceLib.}
proc ilGetPalette*(): ptr ILubyte {.importc: "ilGetPalette", dynlib: sourceLib.}
proc ilGetString*(StringName: ILenum): ILconst_string {.importc: "ilGetString", 
    dynlib: sourceLib.}
proc ilHint*(Target: ILenum; Mode: ILenum) {.importc: "ilHint", 
    dynlib: sourceLib.}
proc ilInvertSurfaceDxtcDataAlpha*(): ILboolean {.
    importc: "ilInvertSurfaceDxtcDataAlpha", dynlib: sourceLib.}
proc ilInit*() {.importc: "ilInit", dynlib: sourceLib.}
proc ilImageToDxtcData*(Format: ILenum): ILboolean {.
    importc: "ilImageToDxtcData", dynlib: sourceLib.}
proc ilIsDisabled*(Mode: ILenum): ILboolean {.importc: "ilIsDisabled", 
    dynlib: sourceLib.}
proc ilIsEnabled*(Mode: ILenum): ILboolean {.importc: "ilIsEnabled", 
    dynlib: sourceLib.}
proc ilIsImage*(Image: ILuint): ILboolean {.importc: "ilIsImage", 
    dynlib: sourceLib.}
proc ilIsValid*(Typ: ILenum; FileName: ILconst_string): ILboolean {.
    importc: "ilIsValid", dynlib: sourceLib.}
proc ilIsValidF*(Typ: ILenum; File: ILHANDLE): ILboolean {.
    importc: "ilIsValidF", dynlib: sourceLib.}
proc ilIsValidL*(Typ: ILenum; Lump: pointer; Size: ILuint): ILboolean {.
    importc: "ilIsValidL", dynlib: sourceLib.}
proc ilKeyColour*(Red: ILclampf; Green: ILclampf; Blue: ILclampf; 
                  Alpha: ILclampf) {.importc: "ilKeyColour", dynlib: sourceLib.}
proc ilLoad*(Typ: ILenum; FileName: ILconst_string): ILboolean {.
    importc: "ilLoad", dynlib: sourceLib.}
proc ilLoadF*(Typ: ILenum; File: ILHANDLE): ILboolean {.importc: "ilLoadF", 
    dynlib: sourceLib.}
proc ilLoadImage*(FileName: ILconst_string): ILboolean {.importc: "ilLoadImage", 
    dynlib: sourceLib.}
proc ilLoadL*(Typ: ILenum; Lump: pointer; Size: ILuint): ILboolean {.
    importc: "ilLoadL", dynlib: sourceLib.}
proc ilLoadPal*(FileName: ILconst_string): ILboolean {.importc: "ilLoadPal", 
    dynlib: sourceLib.}
proc ilModAlpha*(AlphaValue: ILdouble) {.importc: "ilModAlpha", 
    dynlib: sourceLib.}
proc ilOriginFunc*(Mode: ILenum): ILboolean {.importc: "ilOriginFunc", 
    dynlib: sourceLib.}
proc ilOverlayImage*(Source: ILuint; XCoord: ILint; YCoord: ILint; ZCoord: ILint): ILboolean {.
    importc: "ilOverlayImage", dynlib: sourceLib.}
proc ilPopAttrib*() {.importc: "ilPopAttrib", dynlib: sourceLib.}
proc ilPushAttrib*(Bits: ILuint) {.importc: "ilPushAttrib", dynlib: sourceLib.}
proc ilRegisterFormat*(Format: ILenum) {.importc: "ilRegisterFormat", 
    dynlib: sourceLib.}
proc ilRegisterLoad*(Ext: ILconst_string; Load: IL_LOADPROC): ILboolean {.
    importc: "ilRegisterLoad", dynlib: sourceLib.}
proc ilRegisterMipNum*(Num: ILuint): ILboolean {.importc: "ilRegisterMipNum", 
    dynlib: sourceLib.}
proc ilRegisterNumFaces*(Num: ILuint): ILboolean {.
    importc: "ilRegisterNumFaces", dynlib: sourceLib.}
proc ilRegisterNumImages*(Num: ILuint): ILboolean {.
    importc: "ilRegisterNumImages", dynlib: sourceLib.}
proc ilRegisterOrigin*(Origin: ILenum) {.importc: "ilRegisterOrigin", 
    dynlib: sourceLib.}
proc ilRegisterPal*(Pal: pointer; Size: ILuint; Typ: ILenum) {.
    importc: "ilRegisterPal", dynlib: sourceLib.}
proc ilRegisterSave*(Ext: ILconst_string; Save: IL_SAVEPROC): ILboolean {.
    importc: "ilRegisterSave", dynlib: sourceLib.}
proc ilRegisterType*(Typ: ILenum) {.importc: "ilRegisterType", dynlib: sourceLib.}
proc ilRemoveLoad*(Ext: ILconst_string): ILboolean {.importc: "ilRemoveLoad", 
    dynlib: sourceLib.}
proc ilRemoveSave*(Ext: ILconst_string): ILboolean {.importc: "ilRemoveSave", 
    dynlib: sourceLib.}
proc ilResetMemory*() {.importc: "ilResetMemory", dynlib: sourceLib.}
# Deprecated

proc ilResetRead*() {.importc: "ilResetRead", dynlib: sourceLib.}
proc ilResetWrite*() {.importc: "ilResetWrite", dynlib: sourceLib.}
proc ilSave*(Typ: ILenum; FileName: ILconst_string): ILboolean {.
    importc: "ilSave", dynlib: sourceLib.}
proc ilSaveF*(Typ: ILenum; File: ILHANDLE): ILuint {.importc: "ilSaveF", 
    dynlib: sourceLib.}
proc ilSaveImage*(FileName: ILconst_string): ILboolean {.importc: "ilSaveImage", 
    dynlib: sourceLib.}
proc ilSaveL*(Typ: ILenum; Lump: pointer; Size: ILuint): ILuint {.
    importc: "ilSaveL", dynlib: sourceLib.}
proc ilSavePal*(FileName: ILconst_string): ILboolean {.importc: "ilSavePal", 
    dynlib: sourceLib.}
proc ilSetAlpha*(AlphaValue: ILdouble): ILboolean {.importc: "ilSetAlpha", 
    dynlib: sourceLib.}
proc ilSetData*(Data: pointer): ILboolean {.importc: "ilSetData", 
    dynlib: sourceLib.}
proc ilSetDuration*(Duration: ILuint): ILboolean {.importc: "ilSetDuration", 
    dynlib: sourceLib.}
proc ilSetInteger*(Mode: ILenum; Param: ILint) {.importc: "ilSetInteger", 
    dynlib: sourceLib.}
proc ilSetMemory*(a2: mAlloc; a3: mFree) {.importc: "ilSetMemory", 
    dynlib: sourceLib.}
proc ilSetPixels*(XOff: ILint; YOff: ILint; ZOff: ILint; Width: ILuint; 
                  Height: ILuint; Depth: ILuint; Format: ILenum; Typ: ILenum; 
                  Data: pointer) {.importc: "ilSetPixels", dynlib: sourceLib.}
proc ilSetRead*(a2: fOpenRProc; a3: fCloseRProc; a4: fEofProc; a5: fGetcProc; 
                a6: fReadProc; a7: fSeekRProc; a8: fTellRProc) {.
    importc: "ilSetRead", dynlib: sourceLib.}
proc ilSetString*(Mode: ILenum; String: cstring) {.importc: "ilSetString", 
    dynlib: sourceLib.}
proc ilSetWrite*(a2: fOpenWProc; a3: fCloseWProc; a4: fPutcProc; a5: fSeekWProc; 
                 a6: fTellWProc; a7: fWriteProc) {.importc: "ilSetWrite", 
    dynlib: sourceLib.}
proc ilShutDown*() {.importc: "ilShutDown", dynlib: sourceLib.}
proc ilSurfaceToDxtcData*(Format: ILenum): ILboolean {.
    importc: "ilSurfaceToDxtcData", dynlib: sourceLib.}
proc ilTexImage*(Width: ILuint; Height: ILuint; Depth: ILuint; 
                 NumChannels: ILubyte; Format: ILenum; Typ: ILenum; 
                 Data: pointer): ILboolean {.importc: "ilTexImage", 
    dynlib: sourceLib.}
proc ilTexImageDxtc*(w: ILint; h: ILint; d: ILint; DxtFormat: ILenum; 
                     data: ptr ILubyte): ILboolean {.importc: "ilTexImageDxtc", 
    dynlib: sourceLib.}
proc ilTypeFromExt*(FileName: ILconst_string): ILenum {.
    importc: "ilTypeFromExt", dynlib: sourceLib.}
proc ilTypeFunc*(Mode: ILenum): ILboolean {.importc: "ilTypeFunc", 
    dynlib: sourceLib.}
proc ilLoadData*(FileName: ILconst_string; Width: ILuint; Height: ILuint; 
                 Depth: ILuint; Bpp: ILubyte): ILboolean {.
    importc: "ilLoadData", dynlib: sourceLib.}
proc ilLoadDataF*(File: ILHANDLE; Width: ILuint; Height: ILuint; Depth: ILuint; 
                  Bpp: ILubyte): ILboolean {.importc: "ilLoadDataF", 
    dynlib: sourceLib.}
proc ilLoadDataL*(Lump: pointer; Size: ILuint; Width: ILuint; Height: ILuint; 
                  Depth: ILuint; Bpp: ILubyte): ILboolean {.
    importc: "ilLoadDataL", dynlib: sourceLib.}
proc ilSaveData*(FileName: ILconst_string): ILboolean {.importc: "ilSaveData", 
    dynlib: sourceLib.}