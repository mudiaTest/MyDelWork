unit MyUtils;

interface

  procedure bp;
  procedure FreeNil(aobj: TObject);
  function StrConcat(dividor, prefix, sufix: String): String;
  function StrAnsiConcat(dividor, prefix, sufix: AnsiString): AnsiString;

implementation

//funkcja nic nie robi�ca. S�u�y jako miejsce pozwalaj�ce za�o�y� brakepointa
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

end.
