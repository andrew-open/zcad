unit firesensor;
interface
uses system,devices;
usescopy objname;
usescopy objmaterial;
usescopy objgroup;
usescopy blocktype;
var
   Device_Type:TDeviceType;(*'Тип устройства'*) 

   AmountI:GDBInteger;(*'Количество'*)
   
   EL_Cab_AddLength:GDBDouble;(*'Добавлять к длине кабеля'*)
implementation
begin
   BTY_TreeCoord:='PLAN_OPS_PSSENSORS_UNCAT';
   Device_Type:=TDT_SensorPS;
   NMO_Template:='@@[GC_HDShortName]@@[NMO_BaseName]@@[GC_HDGroup].@@[GC_NumberInGroup]';
   EL_Cab_AddLength:=0.1;
   AmountI:=1;


   SerialConnection:=1;
   GC_HeadDevice:='ARK??';
   GC_HDShortName:='??';
   GC_HDGroup:='0';
end.
