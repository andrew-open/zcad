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
unit uzccommand_debclip;

{$INCLUDE zcadconfig.inc}

interface
uses
  Classes,SysUtils,
  LazLogger,LCLType,LCLIntf,Clipbrd,
  uzcinfoform,
  uzcinterface,
  uzccommandsabstract,uzccommandsimpl;

implementation

function DebClip_com(operands:TCommandOperands):TCommandResult;
var
   pbuf:pansichar;
   i:integer;
   cf:TClipboardFormat;
   ts:string;

   memsubstr:TMemoryStream;
   InfoForm:TInfoForm;
begin
     InfoForm:=TInfoForm.create(nil);
     InfoForm.DialogPanel.HelpButton.Hide;
     InfoForm.DialogPanel.CancelButton.Hide;
     InfoForm.DialogPanel.CloseButton.Hide;
     InfoForm.caption:=('Clipboard:');

     memsubstr:=TMemoryStream.Create;
     ts:=Clipboard.AsText;
     i:=Clipboard.FormatCount;
     for i:=0 to Clipboard.FormatCount-1 do
     begin
          cf:=Clipboard.Formats[i];
          ts:=ClipboardFormatToMimeType(cf);
          if ts='' then
                       ts:=inttostr(cf);
          InfoForm.Memo.lines.Add(ts);
          Clipboard.GetFormat(cf,memsubstr);
          pbuf:=memsubstr.Memory;
          InfoForm.Memo.lines.Add('  ANSI: '+pbuf);
          memsubstr.Clear;
     end;
     memsubstr.Free;

     ZCMsgCallBackInterface.DOShowModal(InfoForm);
     InfoForm.Free;

     result:=cmd_ok;
end;

initialization
  debugln('{I}[UnitsInitialization] Unit "',{$INCLUDE %FILE%},'" initialization');
  CreateCommandFastObjectPlugin(@DebClip_com,'DebClip',0,0);
finalization
  debugln('{I}[UnitsFinalization] Unit "',{$INCLUDE %FILE%},'" finalization');
end.
