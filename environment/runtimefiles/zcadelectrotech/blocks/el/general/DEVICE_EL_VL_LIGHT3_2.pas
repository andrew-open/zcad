unit DEVICE_EL_VL_LIGHT3_2;

interface

uses system,devices;
usescopy blocktype;
usescopy objname_eo;
usescopy objgroup;
usescopy _addtocable;

var

T1:GDBString;(*'Группа'*)
T2:GDBString;(*'Код'*)

implementation

begin

BTY_TreeCoord:='PLAN_EM_Светильник';
Device_Type:=TDT_SilaPotr;
Device_Class:=TDC_Shell;

NMO_Name:='Гр0';
NMO_BaseName:='Гр';
NMO_Suffix:='??';

SerialConnection:=1;
GC_HeadDevice:='ЩО??';
GC_HDShortName:='??';
GC_HDGroup:=0;

end.