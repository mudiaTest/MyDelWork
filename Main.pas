unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAObject, MyTests, MyTypeObj, StdCtrls;

type
  TMainForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure proc(i: integer);
    procedure akttest;
    procedure full;
    procedure DoAfterPOStrInsert(inObj: TAObj);
    procedure EventSimpleTest;
    { Private declarations }
  public
    { Public declarations }
    procedure tp(var kkk: String);
  end;

var
  MainForm: TMainForm;

implementation                                                      

uses
   MyUtils;

{$R *.dfm}

procedure TMainForm.proc(i: integer);
var
  j: integer;
begin
  j := i;
  i := j;
  bp;
end;

procedure TMainForm.tp(var kkk: String);
begin
  kkk := 'u';
end;

procedure TMainForm.DoAfterPOStrInsert(inObj: TAObj);
var
  o: TTest;
begin
  o := inObj as TTest;
  bp;
end;

//test kopiowania prostego obiektu o kilku polach
procedure TMainForm.Akttest;
var
  aobj: TTest;
  kaobj: TTest;
  i: integer;
  b: boolean;
  l: String;
begin
  aobj:=TTest.create;
  aobj.postr:=TAString.create;
  aobj.postr.Val := 'jjj';
  aobj.point:=TAInteger.create;
  aobj.point.Val := 111;
  //aobj.postr.afterInsert.Add( DoAfterPOStrInsert );
  //aobj.fproc1 := DoAfterPOStrInsert;
  //aobj.fproc2 := aobj.postr.afterInsert.Items[0];
  //aobj.fproc1(aobj);
  //aobj.fproc2(aobj);
  kaobj := aobj.kopia as TTest;

  bp;
end;

//test kopiowania obiektu o wszystkich mo�liwych polach
procedure TMainForm.Full;
var
  aobj: TfullTest;
  kaobj: TfullTest;
begin
  aobj:=TFullTest.create;
  aobj.pint:=6;
  aobj.pchar:=#88;
  aobj.pbool:=true;
  aobj.pfl:=5.55;
  aobj.pstr:='hhh';
  aobj.pset:= [jeden];
  aobj.psub:= TSub.Create;
  aobj.psub.psubstr := 'subTxt';
  aobj.pproc:= tp;
  aobj.pwchar:= #99;
  aobj.pvar:= 8.9;
  kaobj := aobj.kopia as tfulltest;
  bp;
end;

procedure TMainForm.EventSimpleTest;
var
  obj: TTestEvent;
  obj2: TTestEvent;
  v: Integer;
begin
  obj := TTestEvent.Create(nil);
  obj.pint := TAInteger.Create(obj);
  obj.pint.AddBeforeEv(TATypeEventBeforeTest.Create(obj.pint, v));
  obj.pint.AddAfterEv(TATypeEventAfterTest.Create(obj.pint, v));
  obj.pint.Val := 7;
  obj.pint.SetFireEvents(true);
  obj.pint.Val := 8;

  obj2 := (obj.Kopia as TTestEvent);
  obj2.pint.SetFireEvents(false);
  obj2.pint.Val := 7;
  obj2.pint.SetFireEvents(true);
  obj2.pint.Val := 8;
  bp;


end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  //full;
  //akttest;
  EventSimpleTest;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  self.Close;
end;

end.

