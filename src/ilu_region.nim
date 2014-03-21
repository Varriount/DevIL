#-----------------------------------------------------------------------------
#
# ImageLib Utility Sources
# Copyright (C) 2000-2002 by Denton Woods
# Last modified: 07/09/2002 <--Y2K Compliant! =]
#
# Filename: src-ILU/src/ilu_region.h
#
# Description: Creates an image region.
#
#-----------------------------------------------------------------------------

import 
  "il"

type 
  Edge* {.pure, final.} = object 
    yUpper*: ILint
    xIntersect*: ILfloat
    dxPerScan*: ILfloat
    next*: ptr Edge

