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
{$mode delphi}
unit uzccommand_saveoptions;

{$INCLUDE zcadconfig.inc}

interface
uses
  LazLogger,
  uzccommandsabstract,uzccommandsimpl,
  UGDBOpenArrayOfByte,
  uzbpaths,
  Varman,
  uzcsysparams;

implementation

function SaveOptions_com(operands:TCommandOperands):TCommandResult;
var
   mem:GDBOpenArrayOfByte;
begin
  mem.init(1024);
  SysVarUnit^.SavePasToMem(mem);
  mem.SaveToFile(expandpath(ProgramPath+'rtl/sysvar.pas'));
  mem.done;
  SaveParams(expandpath(ProgramPath+'rtl/config.xml'),SysParam.saved);
  result:=cmd_ok;
end;

initialization
  debugln('{I}[UnitsInitialization] Unit "',{$INCLUDE %FILE%},'" initialization');
  CreateCommandFastObjectPlugin(@SaveOptions_com,'SaveOptions',0,0);
finalization
  debugln('{I}[UnitsFinalization] Unit "',{$INCLUDE %FILE%},'" finalization');
end.
