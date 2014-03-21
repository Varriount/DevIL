#-----------------------------------------------------------------------------
#
# ImageLib Utility Toolkit Sources
# Copyright (C) 2000-2009 by Denton Woods
# Last modified: 03/07/2009
#
# Filename: IL/ilut.h
#
# Description: The main include file for ILUT
#
#-----------------------------------------------------------------------------
# Doxygen comment
#! \file ilut.h
#    The main include file for ILUT
#
when defined(Windows):
  const sourceLib = "ILUT.dll"
elif defined(Linux):
  const sourceLib = "libILUT.so"

import 
  "Il", "Ilu"

const 
  ILUT_VERSION_1_7_8* = 1
  ILUT_VERSION* = 178

# Attribute Bits

const 
  ILUT_OPENGL_BIT* = 0x00000001
  ILUT_D3D_BIT* = 0x00000002
  ILUT_ALL_ATTRIB_BITS* = 0x000FFFFF

# Error Types

const 
  ILUT_INVALID_ENUM* = 0x00000501
  ILUT_OUT_OF_MEMORY* = 0x00000502
  ILUT_INVALID_VALUE* = 0x00000505
  ILUT_ILLEGAL_OPERATION* = 0x00000506
  ILUT_INVALID_PARAM* = 0x00000509
  ILUT_COULD_NOT_OPEN_FILE* = 0x0000050A
  ILUT_STACK_OVERFLOW* = 0x0000050E
  ILUT_STACK_UNDERFLOW* = 0x0000050F
  ILUT_BAD_DIMENSIONS* = 0x00000511
  ILUT_NOT_SUPPORTED* = 0x00000550

# State Definitions

const 
  ILUT_PALETTE_MODE* = 0x00000600
  ILUT_OPENGL_CONV* = 0x00000610
  ILUT_D3D_MIPLEVELS* = 0x00000620
  ILUT_MAXTEX_WIDTH* = 0x00000630
  ILUT_MAXTEX_HEIGHT* = 0x00000631
  ILUT_MAXTEX_DEPTH* = 0x00000632
  ILUT_GL_USE_S3TC* = 0x00000634
  ILUT_D3D_USE_DXTC* = 0x00000634
  ILUT_GL_GEN_S3TC* = 0x00000635
  ILUT_D3D_GEN_DXTC* = 0x00000635
  ILUT_S3TC_FORMAT* = 0x00000705
  ILUT_DXTC_FORMAT* = 0x00000705
  ILUT_D3D_POOL* = 0x00000706
  ILUT_D3D_ALPHA_KEY_COLOR* = 0x00000707
  ILUT_D3D_ALPHA_KEY_COLOUR* = 0x00000707
  ILUT_FORCE_INTEGER_FORMAT* = 0x00000636

#This new state does automatic texture target detection
#if enabled. Currently, only cubemap detection is supported.
#if the current image is no cubemap, the 2d texture is chosen.

const 
  ILUT_GL_AUTODETECT_TEXTURE_TARGET* = 0x00000807

# Values

const 
  ILUT_VERSION_NUM* = IL_VERSION_NUM
  ILUT_VENDOR* = IL_VENDOR

# The different rendering api's...more to be added later?

const 
  ILUT_OPENGL* = 0
  ILUT_ALLEGRO* = 1
  ILUT_WIN32* = 2
  ILUT_DIRECT3D8* = 3
  ILUT_DIRECT3D9* = 4
  ILUT_X11* = 5
  ILUT_DIRECT3D10* = 6

# ImageLib Utility Toolkit Functions

proc ilutDisable*(Mode: ILenum): ILboolean {.importc: "ilutDisable", 
    dynlib: sourceLib.}
proc ilutEnable*(Mode: ILenum): ILboolean {.importc: "ilutEnable", 
    dynlib: sourceLib.}
proc ilutGetBoolean*(Mode: ILenum): ILboolean {.importc: "ilutGetBoolean", 
    dynlib: sourceLib.}
proc ilutGetBooleanv*(Mode: ILenum; Param: ptr ILboolean) {.
    importc: "ilutGetBooleanv", dynlib: sourceLib.}
proc ilutGetInteger*(Mode: ILenum): ILint {.importc: "ilutGetInteger", 
    dynlib: sourceLib.}
proc ilutGetIntegerv*(Mode: ILenum; Param: ptr ILint) {.
    importc: "ilutGetIntegerv", dynlib: sourceLib.}
proc ilutGetString*(StringName: ILenum): ILstring {.importc: "ilutGetString", 
    dynlib: sourceLib.}
proc ilutInit*() {.importc: "ilutInit", dynlib: sourceLib.}
proc ilutIsDisabled*(Mode: ILenum): ILboolean {.importc: "ilutIsDisabled", 
    dynlib: sourceLib.}
proc ilutIsEnabled*(Mode: ILenum): ILboolean {.importc: "ilutIsEnabled", 
    dynlib: sourceLib.}
proc ilutPopAttrib*() {.importc: "ilutPopAttrib", dynlib: sourceLib.}
proc ilutPushAttrib*(Bits: ILuint) {.importc: "ilutPushAttrib", 
                                     dynlib: sourceLib.}
proc ilutSetInteger*(Mode: ILenum; Param: ILint) {.importc: "ilutSetInteger", 
    dynlib: sourceLib.}
proc ilutRenderer*(Renderer: ILenum): ILboolean {.importc: "ilutRenderer", 
    dynlib: sourceLib.}
# ImageLib Utility Toolkit's OpenGL Functions

when defined(ILUT_USE_OPENGL): 
  proc ilutGLBindTexImage*(): GLuint {.importc: "ilutGLBindTexImage", 
                                       dynlib: sourceLib.}
  proc ilutGLBindMipmaps*(): GLuint {.importc: "ilutGLBindMipmaps", 
                                      dynlib: sourceLib.}
  proc ilutGLBuildMipmaps*(): ILboolean {.importc: "ilutGLBuildMipmaps", 
      dynlib: sourceLib.}
  proc ilutGLLoadImage*(FileName: ILstring): GLuint {.
      importc: "ilutGLLoadImage", dynlib: sourceLib.}
  proc ilutGLScreen*(): ILboolean {.importc: "ilutGLScreen", dynlib: sourceLib.}
  proc ilutGLScreenie*(): ILboolean {.importc: "ilutGLScreenie", 
                                      dynlib: sourceLib.}
  proc ilutGLSaveImage*(FileName: ILstring; TexID: GLuint): ILboolean {.
      importc: "ilutGLSaveImage", dynlib: sourceLib.}
  proc ilutGLSubTex2D*(TexID: GLuint; XOff: ILuint; YOff: ILuint): ILboolean {.
      importc: "ilutGLSubTex2D", dynlib: sourceLib.}
  proc ilutGLSubTex3D*(TexID: GLuint; XOff: ILuint; YOff: ILuint; ZOff: ILuint): ILboolean {.
      importc: "ilutGLSubTex3D", dynlib: sourceLib.}
  proc ilutGLSetTex2D*(TexID: GLuint): ILboolean {.importc: "ilutGLSetTex2D", 
      dynlib: sourceLib.}
  proc ilutGLSetTex3D*(TexID: GLuint): ILboolean {.importc: "ilutGLSetTex3D", 
      dynlib: sourceLib.}
  proc ilutGLTexImage*(Level: GLuint): ILboolean {.importc: "ilutGLTexImage", 
      dynlib: sourceLib.}
  proc ilutGLSubTex*(TexID: GLuint; XOff: ILuint; YOff: ILuint): ILboolean {.
      importc: "ilutGLSubTex", dynlib: sourceLib.}
  proc ilutGLSetTex*(TexID: GLuint): ILboolean {.importc: "ilutGLSetTex", 
      dynlib: sourceLib.}
  # Deprecated - use ilutGLSetTex2D.
  proc ilutGLSubTex*(TexID: GLuint; XOff: ILuint; YOff: ILuint): ILboolean {.
      importc: "ilutGLSubTex", dynlib: sourceLib.}
  # Use ilutGLSubTex2D.
# ImageLib Utility Toolkit's Allegro Functions

when defined(ILUT_USE_ALLEGRO): 
  proc ilutAllegLoadImage*(FileName: ILstring): ptr BITMAP {.
      importc: "ilutAllegLoadImage", dynlib: sourceLib.}
  proc ilutConvertToAlleg*(Pal: PALETTE): ptr BITMAP {.
      importc: "ilutConvertToAlleg", dynlib: sourceLib.}
# ImageLib Utility Toolkit's SDL Functions

when defined(ILUT_USE_SDL): 
  proc ilutConvertToSDLSurface*(flags: cuint): ptr SDL_Surface {.
      importc: "ilutConvertToSDLSurface", dynlib: sourceLib.}
  proc ilutSDLSurfaceLoadImage*(FileName: ILstring): ptr SDL_Surface {.
      importc: "ilutSDLSurfaceLoadImage", dynlib: sourceLib.}
  proc ilutSDLSurfaceFromBitmap*(Bitmap: ptr SDL_Surface): ILboolean {.
      importc: "ilutSDLSurfaceFromBitmap", dynlib: sourceLib.}
# ImageLib Utility Toolkit's BeOS Functions

when defined(ILUT_USE_BEOS): 
  proc ilutConvertToBBitmap*(): BBitmap {.importc: "ilutConvertToBBitmap", 
      dynlib: sourceLib.}
# ImageLib Utility Toolkit's Win32 GDI Functions

when defined(ILUT_USE_WIN32): 
  proc ilutConvertToHBitmap*(hDC: HDC): HBITMAP {.
      importc: "ilutConvertToHBitmap", dynlib: sourceLib.}
  proc ilutConvertSliceToHBitmap*(hDC: HDC; slice: ILuint): HBITMAP {.
      importc: "ilutConvertSliceToHBitmap", dynlib: sourceLib.}
  proc ilutFreePaddedData*(Data: ptr ILubyte) {.importc: "ilutFreePaddedData", 
      dynlib: sourceLib.}
  proc ilutGetBmpInfo*(Info: ptr BITMAPINFO) {.importc: "ilutGetBmpInfo", 
      dynlib: sourceLib.}
  proc ilutGetHPal*(): HPALETTE {.importc: "ilutGetHPal", dynlib: sourceLib.}
  proc ilutGetPaddedData*(): ptr ILubyte {.importc: "ilutGetPaddedData", 
      dynlib: sourceLib.}
  proc ilutGetWinClipboard*(): ILboolean {.importc: "ilutGetWinClipboard", 
      dynlib: sourceLib.}
  proc ilutLoadResource*(hInst: HINSTANCE; ID: ILint; ResourceType: ILstring; 
                         Typ: ILenum): ILboolean {.importc: "ilutLoadResource", 
      dynlib: sourceLib.}
  proc ilutSetHBitmap*(Bitmap: HBITMAP): ILboolean {.importc: "ilutSetHBitmap", 
      dynlib: sourceLib.}
  proc ilutSetHPal*(Pal: HPALETTE): ILboolean {.importc: "ilutSetHPal", 
      dynlib: sourceLib.}
  proc ilutSetWinClipboard*(): ILboolean {.importc: "ilutSetWinClipboard", 
      dynlib: sourceLib.}
  proc ilutWinLoadImage*(FileName: ILstring; hDC: HDC): HBITMAP {.
      importc: "ilutWinLoadImage", dynlib: sourceLib.}
  proc ilutWinLoadUrl*(Url: ILstring): ILboolean {.importc: "ilutWinLoadUrl", 
      dynlib: sourceLib.}
  proc ilutWinPrint*(XPos: ILuint; YPos: ILuint; Width: ILuint; Height: ILuint; 
                     hDC: HDC): ILboolean {.importc: "ilutWinPrint", 
      dynlib: sourceLib.}
  proc ilutWinSaveImage*(FileName: ILstring; Bitmap: HBITMAP): ILboolean {.
      importc: "ilutWinSaveImage", dynlib: sourceLib.}
# ImageLib Utility Toolkit's DirectX 8 Functions

when defined(ILUT_USE_DIRECTX8): 
  proc ilutD3D8Texture*(Device: ptr IDirect3DDevice8): ptr IDirect3DTexture8 {.
      importc: "ilutD3D8Texture", dynlib: sourceLib.}
  proc ilutD3D8VolumeTexture*(Device: ptr IDirect3DDevice8): ptr IDirect3DVolumeTexture8 {.
      importc: "ilutD3D8VolumeTexture", dynlib: sourceLib.}
  proc ilutD3D8TexFromFile*(Device: ptr IDirect3DDevice8; FileName: cstring; 
                            Texture: ptr ptr IDirect3DTexture8): ILboolean {.
      importc: "ilutD3D8TexFromFile", dynlib: sourceLib.}
  proc ilutD3D8VolTexFromFile*(Device: ptr IDirect3DDevice8; FileName: cstring; 
                               Texture: ptr ptr IDirect3DVolumeTexture8): ILboolean {.
      importc: "ilutD3D8VolTexFromFile", dynlib: sourceLib.}
  proc ilutD3D8TexFromFileInMemory*(Device: ptr IDirect3DDevice8; Lump: pointer; 
                                    Size: ILuint; 
                                    Texture: ptr ptr IDirect3DTexture8): ILboolean {.
      importc: "ilutD3D8TexFromFileInMemory", dynlib: sourceLib.}
  proc ilutD3D8VolTexFromFileInMemory*(Device: ptr IDirect3DDevice8; 
                                       Lump: pointer; Size: ILuint; 
                                       Texture: ptr ptr IDirect3DVolumeTexture8): ILboolean {.
      importc: "ilutD3D8VolTexFromFileInMemory", dynlib: sourceLib.}
  proc ilutD3D8TexFromFileHandle*(Device: ptr IDirect3DDevice8; File: ILHANDLE; 
                                  Texture: ptr ptr IDirect3DTexture8): ILboolean {.
      importc: "ilutD3D8TexFromFileHandle", dynlib: sourceLib.}
  proc ilutD3D8VolTexFromFileHandle*(Device: ptr IDirect3DDevice8; 
                                     File: ILHANDLE; 
                                     Texture: ptr ptr IDirect3DVolumeTexture8): ILboolean {.
      importc: "ilutD3D8VolTexFromFileHandle", dynlib: sourceLib.}
  # These two are not tested yet.
  proc ilutD3D8TexFromResource*(Device: ptr IDirect3DDevice8; 
                                SrcModule: HMODULE; SrcResource: cstring; 
                                Texture: ptr ptr IDirect3DTexture8): ILboolean {.
      importc: "ilutD3D8TexFromResource", dynlib: sourceLib.}
  proc ilutD3D8VolTexFromResource*(Device: ptr IDirect3DDevice8; 
                                   SrcModule: HMODULE; SrcResource: cstring; 
                                   Texture: ptr ptr IDirect3DVolumeTexture8): ILboolean {.
      importc: "ilutD3D8VolTexFromResource", dynlib: sourceLib.}
  proc ilutD3D8LoadSurface*(Device: ptr IDirect3DDevice8; 
                            Surface: ptr IDirect3DSurface8): ILboolean {.
      importc: "ilutD3D8LoadSurface", dynlib: sourceLib.}
when defined(ILUT_USE_DIRECTX9): 
  proc ilutD3D9Texture*(Device: ptr IDirect3DDevice9): ptr IDirect3DTexture9 {.
      importc: "ilutD3D9Texture", dynlib: sourceLib.}
  proc ilutD3D9VolumeTexture*(Device: ptr IDirect3DDevice9): ptr IDirect3DVolumeTexture9 {.
      importc: "ilutD3D9VolumeTexture", dynlib: sourceLib.}
  proc ilutD3D9CubeTexture*(Device: ptr IDirect3DDevice9): ptr IDirect3DCubeTexture9 {.
      importc: "ilutD3D9CubeTexture", dynlib: sourceLib.}
  proc ilutD3D9CubeTexFromFile*(Device: ptr IDirect3DDevice9; 
                                FileName: ILconst_string; 
                                Texture: ptr ptr IDirect3DCubeTexture9): ILboolean {.
      importc: "ilutD3D9CubeTexFromFile", dynlib: sourceLib.}
  proc ilutD3D9CubeTexFromFileInMemory*(Device: ptr IDirect3DDevice9; 
                                        Lump: pointer; Size: ILuint; 
                                        Texture: ptr ptr IDirect3DCubeTexture9): ILboolean {.
      importc: "ilutD3D9CubeTexFromFileInMemory", dynlib: sourceLib.}
  proc ilutD3D9CubeTexFromFileHandle*(Device: ptr IDirect3DDevice9; 
                                      File: ILHANDLE; 
                                      Texture: ptr ptr IDirect3DCubeTexture9): ILboolean {.
      importc: "ilutD3D9CubeTexFromFileHandle", dynlib: sourceLib.}
  proc ilutD3D9CubeTexFromResource*(Device: ptr IDirect3DDevice9; 
                                    SrcModule: HMODULE; 
                                    SrcResource: ILconst_string; 
                                    Texture: ptr ptr IDirect3DCubeTexture9): ILboolean {.
      importc: "ilutD3D9CubeTexFromResource", dynlib: sourceLib.}
  proc ilutD3D9TexFromFile*(Device: ptr IDirect3DDevice9; 
                            FileName: ILconst_string; 
                            Texture: ptr ptr IDirect3DTexture9): ILboolean {.
      importc: "ilutD3D9TexFromFile", dynlib: sourceLib.}
  proc ilutD3D9VolTexFromFile*(Device: ptr IDirect3DDevice9; 
                               FileName: ILconst_string; 
                               Texture: ptr ptr IDirect3DVolumeTexture9): ILboolean {.
      importc: "ilutD3D9VolTexFromFile", dynlib: sourceLib.}
  proc ilutD3D9TexFromFileInMemory*(Device: ptr IDirect3DDevice9; Lump: pointer; 
                                    Size: ILuint; 
                                    Texture: ptr ptr IDirect3DTexture9): ILboolean {.
      importc: "ilutD3D9TexFromFileInMemory", dynlib: sourceLib.}
  proc ilutD3D9VolTexFromFileInMemory*(Device: ptr IDirect3DDevice9; 
                                       Lump: pointer; Size: ILuint; 
                                       Texture: ptr ptr IDirect3DVolumeTexture9): ILboolean {.
      importc: "ilutD3D9VolTexFromFileInMemory", dynlib: sourceLib.}
  proc ilutD3D9TexFromFileHandle*(Device: ptr IDirect3DDevice9; File: ILHANDLE; 
                                  Texture: ptr ptr IDirect3DTexture9): ILboolean {.
      importc: "ilutD3D9TexFromFileHandle", dynlib: sourceLib.}
  proc ilutD3D9VolTexFromFileHandle*(Device: ptr IDirect3DDevice9; 
                                     File: ILHANDLE; 
                                     Texture: ptr ptr IDirect3DVolumeTexture9): ILboolean {.
      importc: "ilutD3D9VolTexFromFileHandle", dynlib: sourceLib.}
  # These three are not tested yet.
  proc ilutD3D9TexFromResource*(Device: ptr IDirect3DDevice9; 
                                SrcModule: HMODULE; SrcResource: ILconst_string; 
                                Texture: ptr ptr IDirect3DTexture9): ILboolean {.
      importc: "ilutD3D9TexFromResource", dynlib: sourceLib.}
  proc ilutD3D9VolTexFromResource*(Device: ptr IDirect3DDevice9; 
                                   SrcModule: HMODULE; 
                                   SrcResource: ILconst_string; 
                                   Texture: ptr ptr IDirect3DVolumeTexture9): ILboolean {.
      importc: "ilutD3D9VolTexFromResource", dynlib: sourceLib.}
  proc ilutD3D9LoadSurface*(Device: ptr IDirect3DDevice9; 
                            Surface: ptr IDirect3DSurface9): ILboolean {.
      importc: "ilutD3D9LoadSurface", dynlib: sourceLib.}
when defined(ILUT_USE_DIRECTX10): 
  proc ilutD3D10Texture*(Device: ptr ID3D10Device): ptr ID3D10Texture2D {.
      importc: "ilutD3D10Texture", dynlib: sourceLib.}
  proc ilutD3D10TexFromFile*(Device: ptr ID3D10Device; FileName: ILconst_string; 
                             Texture: ptr ptr ID3D10Texture2D): ILboolean {.
      importc: "ilutD3D10TexFromFile", dynlib: sourceLib.}
  proc ilutD3D10TexFromFileInMemory*(Device: ptr ID3D10Device; Lump: pointer; 
                                     Size: ILuint; 
                                     Texture: ptr ptr ID3D10Texture2D): ILboolean {.
      importc: "ilutD3D10TexFromFileInMemory", dynlib: sourceLib.}
  proc ilutD3D10TexFromResource*(Device: ptr ID3D10Device; SrcModule: HMODULE; 
                                 SrcResource: ILconst_string; 
                                 Texture: ptr ptr ID3D10Texture2D): ILboolean {.
      importc: "ilutD3D10TexFromResource", dynlib: sourceLib.}
  proc ilutD3D10TexFromFileHandle*(Device: ptr ID3D10Device; File: ILHANDLE; 
                                   Texture: ptr ptr ID3D10Texture2D): ILboolean {.
      importc: "ilutD3D10TexFromFileHandle", dynlib: sourceLib.}
when defined(ILUT_USE_X11): 
  proc ilutXCreateImage*(a2: ptr Display): ptr XImage {.
      importc: "ilutXCreateImage", dynlib: sourceLib.}
  proc ilutXCreatePixmap*(a2: ptr Display; a3: Drawable): Pixmap {.
      importc: "ilutXCreatePixmap", dynlib: sourceLib.}
  proc ilutXLoadImage*(a2: ptr Display; a3: cstring): ptr XImage {.
      importc: "ilutXLoadImage", dynlib: sourceLib.}
  proc ilutXLoadPixmap*(a2: ptr Display; a3: Drawable; a4: cstring): Pixmap {.
      importc: "ilutXLoadPixmap", dynlib: sourceLib.}
  when defined(ILUT_USE_XSHM): 
    proc ilutXShmCreateImage*(a2: ptr Display; a3: ptr XShmSegmentInfo): ptr XImage {.
        importc: "ilutXShmCreateImage", dynlib: sourceLib.}
    proc ilutXShmDestroyImage*(a2: ptr Display; a3: ptr XImage; 
                               a4: ptr XShmSegmentInfo) {.
        importc: "ilutXShmDestroyImage", dynlib: sourceLib.}
    proc ilutXShmCreatePixmap*(a2: ptr Display; a3: Drawable; 
                               a4: ptr XShmSegmentInfo): Pixmap {.
        importc: "ilutXShmCreatePixmap", dynlib: sourceLib.}
    proc ilutXShmFreePixmap*(a2: ptr Display; a3: Pixmap; 
                             a4: ptr XShmSegmentInfo) {.
        importc: "ilutXShmFreePixmap", dynlib: sourceLib.}
    proc ilutXShmLoadImage*(a2: ptr Display; a3: cstring; 
                            a4: ptr XShmSegmentInfo): ptr XImage {.
        importc: "ilutXShmLoadImage", dynlib: sourceLib.}
    proc ilutXShmLoadPixmap*(a2: ptr Display; a3: Drawable; a4: cstring; 
                             a5: ptr XShmSegmentInfo): Pixmap {.
        importc: "ilutXShmLoadPixmap", dynlib: sourceLib.}