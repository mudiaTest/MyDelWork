unit MyTests;

interface

uses
  MyAObject, MyTypeObj;

type

  TSub = class(TAGenObj)
  private
    fsubstr: String;
  published
    property psubstr: String read fsubstr write fsubstr;
  end;

  TTest = class(TAGenObj)
  private
    fostr: TAString;
    foint: TAInteger;
  public
    fproc1: TEventProc;
    fproc2: TEventProc;
  published
    property postr: TAString read fostr write fostr;
    property point: TAInteger read foint write foint;
  end;

  TTestEnum = (jeden, dwa);
  TTestSet = set of TTestEnum;

  TFullTest = class(TAGenObj)
  private
    fint: Integer;
    fchar: Char;
    fbool: boolean;
    ffl:  Double;
    fstr: String;
    fset: TTestSet;
    fsub: TSub;
    fproc: TTestProc;
    fwchar: WideChar;
    //tkLString
    //tkLWString
    //tkWString
    fvar: Variant;
    //farr: array[1..5] of string; - array nie mo¿e byæ published
    //thRecord
    //thInterface
    //fint64: integer64;
    //fdynarray: array of string;
  published

    property pint: Integer read fInt write fInt;
    property pchar: Char read fchar write fchar;
    property pbool: boolean read fbool write fbool;
    property pfl: Double read ffl write ffl;
    property pstr: String read fStr write fStr;
    property pset: TTestSet read fset write fset;
    property psub: TSub read fsub write fsub;
    property pproc: TTestProc read fproc write fproc;
    property pwchar: WideChar read fwchar write fwchar;
    //
    //
    //
    property pvar: Variant read fvar write fvar;
    //property parr[Index : integer]: string read farr write farr;
    //
    //
    //
    //property pdynarray[Index : integer]: string read fdynarray write fdynarray;
  end;

  TTestEvent = class(TAGenObj)
  private
    fint: TAInteger;
  published
    property pint: TAInteger read fInt write fInt;
  end;

  TATypeEventTest = class(TAEventWraper)
    procedure DoTask; override;
  end;

implementation

{ TATypeEventTest }

procedure TATypeEventTest.DoTask;
begin
  inherited;
  
end;

end.
