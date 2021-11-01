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
unit uzccommand_extdrentslist;

{$INCLUDE def.inc}

interface
uses
  LazLogger,SysUtils,
  uzccommandsabstract,uzccommandsimpl,
  uzeentity,gzctnrvectortypes,uzcdrawings,uzcdrawing,uzcstrconsts,uzeentityextender,
  uzcinterface,uzcutils,gzctnrstl,gutil;

function extdrEntsList_com(operands:TCommandOperands):TCommandResult;

implementation

function extdrEntsList_com(operands:TCommandOperands):TCommandResult;
type
  TExtCounter=TMyMapCounter<TMetaEntityExtender>;
var
  pv:pGDBObjEntity;
  ir:itrec;
  i:integer;
  count:integer;
  extcounter:TExtCounter;
  pair:TExtCounter.TDictionaryPair;
begin
  extcounter:=TExtCounter.create;
  try
    count:=0;
    pv:=drawings.GetCurrentROOT^.ObjArray.beginiterate(ir);
    if pv<>nil then
    repeat
      if pv^.Selected then begin
        inc(count);
        if Assigned(pv^.EntExtensions) then begin
          for i:=0 to pv^.EntExtensions.GetExtensionsCount-1 do begin
            extcounter.CountKey(typeof(pv^.EntExtensions.GetExtension(i)),1);
          end;
        end;
      end;
      pv:=drawings.GetCurrentROOT^.ObjArray.iterate(ir);
    until pv=nil;
    ZCMsgCallBackInterface.TextMessage(format(rscmNEntitiesProcessed,[count]),TMWOHistoryOut);
    count:=0;
    for pair in extcounter do begin
      ZCMsgCallBackInterface.TextMessage(format('Extender "%s" found %d times',[pair.Key.getExtenderName,pair.Value]),TMWOHistoryOut);
      inc(count);
    end;
    if count=0 then
      ZCMsgCallBackInterface.TextMessage(format('No extenders found',[]),TMWOHistoryOut);
  finally
    extcounter.Free;
    result:=cmd_ok;
  end;
end;

initialization
  debugln('{I}[UnitsInitialization] Unit "',{$INCLUDE %FILE%},'" initialization');
  CreateCommandFastObjectPlugin(@extdrEntsList_com,'extdrEntsList',CADWG or CASelEnts,0);
finalization
  debugln('{I}[UnitsFinalization] Unit "',{$INCLUDE %FILE%},'" finalization');
end.
