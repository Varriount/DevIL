#-----------------------------------------------------------------------------
#
# ImageLib Utility Sources
# Copyright (C) 2000-2009 by Denton Woods
# Last modified: 03/07/2009
#
# Filename: IL/ilu.h
#
# Description: The main include file for ILU
#
#-----------------------------------------------------------------------------
# Doxygen comment
#! \file ilu.h
#    The main include file for ILU
#

when defined(Windows):
  const sourceLib = "ILU.dll"
elif defined(Linux):
  const sourceLib = "libILU.so"

import 
  "il"

const 
  ILU_VERSION_1_7_8* = 1
  ILU_VERSION* = 178
  ILU_FILTER* = 0x00002600
  ILU_NEAREST* = 0x00002601
  ILU_LINEAR* = 0x00002602
  ILU_BILINEAR* = 0x00002603
  ILU_SCALE_BOX* = 0x00002604
  ILU_SCALE_TRIANGLE* = 0x00002605
  ILU_SCALE_BELL* = 0x00002606
  ILU_SCALE_BSPLINE* = 0x00002607
  ILU_SCALE_LANCZOS3* = 0x00002608
  ILU_SCALE_MITCHELL* = 0x00002609

# Error types

const 
  ILU_INVALID_ENUM* = 0x00000501
  ILU_OUT_OF_MEMORY* = 0x00000502
  ILU_INTERNAL_ERROR* = 0x00000504
  ILU_INVALID_VALUE* = 0x00000505
  ILU_ILLEGAL_OPERATION* = 0x00000506
  ILU_INVALID_PARAM* = 0x00000509

# Values

const 
  ILU_PLACEMENT* = 0x00000700
  ILU_LOWER_LEFT* = 0x00000701
  ILU_LOWER_RIGHT* = 0x00000702
  ILU_UPPER_LEFT* = 0x00000703
  ILU_UPPER_RIGHT* = 0x00000704
  ILU_CENTER* = 0x00000705
  ILU_CONVOLUTION_MATRIX* = 0x00000710
  ILU_VERSION_NUM* = IL_VERSION_NUM
  ILU_VENDOR* = IL_VENDOR

# Languages

const 
  ILU_ENGLISH* = 0x00000800
  ILU_ARABIC* = 0x00000801
  ILU_DUTCH* = 0x00000802
  ILU_JAPANESE* = 0x00000803
  ILU_SPANISH* = 0x00000804
  ILU_GERMAN* = 0x00000805
  ILU_FRENCH* = 0x00000806

type 
  ILinfo* {.pure, final.} = object 
    Id*: ILuint               # the image's id
    Data*: ptr ILubyte        # the image's data
    Width*: ILuint            # the image's width
    Height*: ILuint           # the image's height
    Depth*: ILuint            # the image's depth
    Bpp*: ILubyte             # bytes per pixel (not bits) of the image
    SizeOfData*: ILuint       # the total size of the data (in bytes)
    Format*: ILenum           # image format (in IL enum style)
    ImageType*: ILenum        # image type (in IL enum style)
    Origin*: ILenum           # origin of the image
    Palette*: ptr ILubyte     # the image's palette
    PalType*: ILenum          # palette type
    PalSize*: ILuint          # palette size
    CubeFlags*: ILenum        # flags for what cube map sides are present
    NumNext*: ILuint          # number of images following
    NumMips*: ILuint          # number of mipmaps
    NumLayers*: ILuint        # number of layers
  
  ILpointf* {.pure, final.} = object 
    x*: ILfloat
    y*: ILfloat

  ILpointi* {.pure, final.} = object 
    x*: ILint
    y*: ILint


proc iluAlienify*(): ILboolean {.importc: "iluAlienify", dynlib: sourceLib.}
proc iluBlurAvg*(Iter: ILuint): ILboolean {.importc: "iluBlurAvg", 
    dynlib: sourceLib.}
proc iluBlurGaussian*(Iter: ILuint): ILboolean {.importc: "iluBlurGaussian", 
    dynlib: sourceLib.}
proc iluBuildMipmaps*(): ILboolean {.importc: "iluBuildMipmaps", 
                                     dynlib: sourceLib.}
proc iluColoursUsed*(): ILuint {.importc: "iluColoursUsed", dynlib: sourceLib.}
proc iluCompareImage*(Comp: ILuint): ILboolean {.importc: "iluCompareImage", 
    dynlib: sourceLib.}
proc iluContrast*(Contrast: ILfloat): ILboolean {.importc: "iluContrast", 
    dynlib: sourceLib.}
proc iluCrop*(XOff: ILuint; YOff: ILuint; ZOff: ILuint; Width: ILuint; 
              Height: ILuint; Depth: ILuint): ILboolean {.importc: "iluCrop", 
    dynlib: sourceLib.}
proc iluDeleteImage*(Id: ILuint) {.importc: "iluDeleteImage", dynlib: sourceLib.}
proc iluEdgeDetectE*(): ILboolean {.importc: "iluEdgeDetectE", dynlib: sourceLib.}
proc iluEdgeDetectP*(): ILboolean {.importc: "iluEdgeDetectP", dynlib: sourceLib.}
proc iluEdgeDetectS*(): ILboolean {.importc: "iluEdgeDetectS", dynlib: sourceLib.}
proc iluEmboss*(): ILboolean {.importc: "iluEmboss", dynlib: sourceLib.}
proc iluEnlargeCanvas*(Width: ILuint; Height: ILuint; Depth: ILuint): ILboolean {.
    importc: "iluEnlargeCanvas", dynlib: sourceLib.}
proc iluEnlargeImage*(XDim: ILfloat; YDim: ILfloat; ZDim: ILfloat): ILboolean {.
    importc: "iluEnlargeImage", dynlib: sourceLib.}
proc iluEqualize*(): ILboolean {.importc: "iluEqualize", dynlib: sourceLib.}
proc iluErrorString*(Error: ILenum): ILconst_string {.importc: "iluErrorString", 
    dynlib: sourceLib.}
proc iluConvolution*(matrix: ptr ILint; scale: ILint; bias: ILint): ILboolean {.
    importc: "iluConvolution", dynlib: sourceLib.}
proc iluFlipImage*(): ILboolean {.importc: "iluFlipImage", dynlib: sourceLib.}
proc iluGammaCorrect*(Gamma: ILfloat): ILboolean {.importc: "iluGammaCorrect", 
    dynlib: sourceLib.}
proc iluGenImage*(): ILuint {.importc: "iluGenImage", dynlib: sourceLib.}
proc iluGetImageInfo*(Info: ptr ILinfo) {.importc: "iluGetImageInfo", 
    dynlib: sourceLib.}
proc iluGetInteger*(Mode: ILenum): ILint {.importc: "iluGetInteger", 
    dynlib: sourceLib.}
proc iluGetIntegerv*(Mode: ILenum; Param: ptr ILint) {.
    importc: "iluGetIntegerv", dynlib: sourceLib.}
proc iluGetString*(StringName: ILenum): ILstring {.importc: "iluGetString", 
    dynlib: sourceLib.}
proc iluImageParameter*(PName: ILenum; Param: ILenum) {.
    importc: "iluImageParameter", dynlib: sourceLib.}
proc iluInit*() {.importc: "iluInit", dynlib: sourceLib.}
proc iluInvertAlpha*(): ILboolean {.importc: "iluInvertAlpha", dynlib: sourceLib.}
proc iluLoadImage*(FileName: ILconst_string): ILuint {.importc: "iluLoadImage", 
    dynlib: sourceLib.}
proc iluMirror*(): ILboolean {.importc: "iluMirror", dynlib: sourceLib.}
proc iluNegative*(): ILboolean {.importc: "iluNegative", dynlib: sourceLib.}
proc iluNoisify*(Tolerance: ILclampf): ILboolean {.importc: "iluNoisify", 
    dynlib: sourceLib.}
proc iluPixelize*(PixSize: ILuint): ILboolean {.importc: "iluPixelize", 
    dynlib: sourceLib.}
proc iluRegionfv*(Points: ptr ILpointf; n: ILuint) {.importc: "iluRegionfv", 
    dynlib: sourceLib.}
proc iluRegioniv*(Points: ptr ILpointi; n: ILuint) {.importc: "iluRegioniv", 
    dynlib: sourceLib.}
proc iluReplaceColour*(Red: ILubyte; Green: ILubyte; Blue: ILubyte; 
                       Tolerance: ILfloat): ILboolean {.
    importc: "iluReplaceColour", dynlib: sourceLib.}
proc iluRotate*(Angle: ILfloat): ILboolean {.importc: "iluRotate", 
    dynlib: sourceLib.}
proc iluRotate3D*(x: ILfloat; y: ILfloat; z: ILfloat; Angle: ILfloat): ILboolean {.
    importc: "iluRotate3D", dynlib: sourceLib.}
proc iluSaturate1f*(Saturation: ILfloat): ILboolean {.importc: "iluSaturate1f", 
    dynlib: sourceLib.}
proc iluSaturate4f*(r: ILfloat; g: ILfloat; b: ILfloat; Saturation: ILfloat): ILboolean {.
    importc: "iluSaturate4f", dynlib: sourceLib.}
proc iluScale*(Width: ILuint; Height: ILuint; Depth: ILuint): ILboolean {.
    importc: "iluScale", dynlib: sourceLib.}
proc iluScaleAlpha*(scale: ILfloat): ILboolean {.importc: "iluScaleAlpha", 
    dynlib: sourceLib.}
proc iluScaleColours*(r: ILfloat; g: ILfloat; b: ILfloat): ILboolean {.
    importc: "iluScaleColours", dynlib: sourceLib.}
proc iluSetLanguage*(Language: ILenum): ILboolean {.importc: "iluSetLanguage", 
    dynlib: sourceLib.}
proc iluSharpen*(Factor: ILfloat; Iter: ILuint): ILboolean {.
    importc: "iluSharpen", dynlib: sourceLib.}
proc iluSwapColours*(): ILboolean {.importc: "iluSwapColours", dynlib: sourceLib.}
proc iluWave*(Angle: ILfloat): ILboolean {.importc: "iluWave", dynlib: sourceLib.}