unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MyAObject, MyTests, MyTypeObj;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    procedure proc(i: integer);
    procedure akttest;
    procedure full;
    procedure DoAfterPOStrInsert(inObj: TAObj);
    { Private declarations }
  public
    { Public declarations }
    procedure tp(var kkk: String);
  end;

var
  Form1: TForm1;

implementation                                                      

uses
   MyUtils;

{$R *.dfm}

procedure TForm1.proc(i: integer);
var
  j: integer;
begin
 j := i;
 bp;
end;

procedure TForm1.tp(var kkk: String);
var
  jjj: integer;
begin
  kkk := 'u';
end;

procedure TForm1.DoAfterPOStrInsert(inObj: TAObj);
var
  o: TTest;
begin
  o := inObj as TTest;
  bp;
end;

procedure TForm1.akttest;
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

procedure TForm1.FormCreate(Sender: TObject);
begin
  //full;
  akttest;
end;

procedure TForm1.full;
var
  aobj: TfullTest;
  kaobj: TfullTest;
  i: integer;
  b: boolean;
  l: String;
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

end.

