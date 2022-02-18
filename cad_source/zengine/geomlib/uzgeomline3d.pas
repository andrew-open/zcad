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

unit uzgeomline3d;
{$INCLUDE zcadconfig.inc}
interface
uses
     sysutils,uzbtypes,uzbtypesbase,uzegeometry,uzgeomentity3d,uzegeometrytypes;
type
{Export+}
{REGISTEROBJECTTYPE TGeomLine3D}
TGeomLine3D= object(TGeomEntity3D)
                                           LineData:GDBLineProp;
                                           StartParam:GDBDouble;
                                           constructor init(const p1,p2:GDBvertex;const sp:GDBDouble);
                                           function GetBB:TBoundingBox;virtual;
                                           end;
{Export-}
implementation
constructor TGeomLine3D.init(const p1,p2:GDBvertex;const sp:GDBDouble);
begin
  LineData.lBegin:=p1;
  LineData.lEnd:=p2;
  StartParam:=sp;
end;
function TGeomLine3D.GetBB:TBoundingBox;
begin
  result:=CreateBBFrom2Point(LineData.lBegin,LineData.lEnd);
end;
begin
end.

