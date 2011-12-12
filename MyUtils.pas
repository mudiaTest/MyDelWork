unit MyUtils;

interface

Uses
  Classes;

  const
    lpPinecha = -1;
    unPinecha = -1;

  procedure bp;
  procedure FreeNil(aobj: TObject);
  function StrConcat(dividor, prefix, sufix: String): String;
  function StrAnsiConcat(dividor, prefix, sufix: AnsiString): AnsiString;
  function StringListNrSort(lst: TStringList; i1, i2: integer): integer;

implementation

uses
  SysUtils;

//funkcja nic nie robi¹ca. S³u¿y jako miejsce pozwalaj¹ce za³o¿yæ brakepointa
procedure bp;
begin
end;

procedure FreeNil(aobj: TObject);
begin
  if aobj <> nil then
  begin
    aobj.Free;
  end;
end;

// String
function StrConcat(dividor, prefix, sufix: String): String;
begin
  if prefix <> '' then
    result := prefix + dividor + sufix
  else
    result := sufix;
end;

function StrAnsiConcat(dividor, prefix, sufix: AnsiString): AnsiString;
begin
  if prefix <> '' then
    result := prefix + dividor + sufix
  else
    result := sufix;
end;

function StringListNrSort(lst: TStringList; i1, i2: integer): integer;
begin
  if StrToInt(lst[i1]) < StrToInt(lst[i2]) then
    result := -1
  else if StrToInt(lst[i1]) > StrToInt(lst[i2]) then
    result := 1
  else
    result := 0;
end;

end.
