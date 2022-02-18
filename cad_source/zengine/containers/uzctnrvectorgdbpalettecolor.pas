{
*****************************************************************************
*                                                                           *
*  This file is part of the ZCAD                                            *
*                                                                           *
*  See the file COPYING.modifiedLGPL.txt, included in this distribution,    *
*  for details about the copyright.                                         *
*                                                                           *
*  This program is distributed in the hope that it will be useful,          *
*  but WITHOUT ANY WARRANTY; without even the implied warranty of           *
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     *
*                                                                           *
*****************************************************************************
}
{
@author(Andrey Zubarev <zamtmn@yandex.ru>) 
}

unit uzctnrvectorgdbpalettecolor;
{$INCLUDE zcadconfig.inc}
interface
uses uzepalette,gzctnrvectorsimple;
type
{Export+}
PTZctnrVectorTGDBPaletteColor=^TZctnrVectorTGDBPaletteColor;
TZctnrVectorTGDBPaletteColor=GZVectorSimple{-}<TGDBPaletteColor>{//};
{Export-}
implementation
begin
end.
