unit MyTypeObj;

interface

uses
  MyAObject;

Type

  // : Integer Data Types :

  //Byte
  TAByte = class(TAGenObj)
  private
    fval: Byte;
    function getByte: Byte;
    procedure setByte(aval: Byte);
  published
    property val: Byte read getByte write setByte;
  end;

  //ShortInt
  TAShortInt = class(TAGenObj)
  private
    fval: ShortInt;
    function getShortInt: ShortInt;
    procedure setShortInt(aval: ShortInt);
  published
    property val: ShortInt read getShortInt write setShortInt;
  end;

  //Word
  TAWord = class(TAGenObj)
  private
    fval: Word;
    function getWord: Word;
    procedure setWord(aval: Word);
  published
    property val: Word read getWord write setWord;
  end;

  //SmallInt
  TASmallInt = class(TAGenObj)
  private
    fval: SmallInt;
    function getSmallInt: SmallInt;
    procedure setSmallInt(aval: SmallInt);
  published
    property val: SmallInt read getSmallInt write setSmallInt;
  end;

  //LongWord
  TALongWord = class(TAGenObj)
  private
    fval: LongWord;
    function getLongWord: LongWord;
    procedure setLongWord(aval: LongWord);
  published
    property val: LongWord read getLongWord write setLongWord;
  end;

  //Cardinal
  TACardinal = class(TAGenObj)
  private
    fval: Cardinal;
    function getCardinal: Cardinal;
    procedure setCardinal(aval: Cardinal);
  published
    property val: Cardinal read getCardinal write setCardinal;
  end;

  //LongInt
  TALongInt = class(TAGenObj)
  private
    fval: LongInt;
    function getLongInt: LongInt;
    procedure setLongInt(aval: LongInt);
  published
    property val: LongInt read getLongInt write setLongInt;
  end;

  //Integer
  TAInteger = class(TAGenObj)
  private
    fval: Integer;
    function getInteger: Integer;
    procedure setInteger(aval: Integer);
  published
    //property pint: Integer read getInt write setInt;
    property val: Integer read getInteger write setInteger;
  end;

  //Int64
  TAInt64 = class(TAGenObj)
  private
    fval: Int64;
    function getInt64: Int64;
    procedure setInt64(aval: Int64);
  published
    property val: Int64 read getInt64 write setInt64;
  end;

   // : Decimal data types :

  //Single;
  TASingle = class(TAGenObj)
  private
    fval: Single;
    function getSingle: Single;
    procedure setSingle(aval: Single);
  published
    property val: Single read getSingle write setSingle;
  end;

  //Currency;
  TACurrency = class(TAGenObj)
  private
    fval: Currency;
    function getCurrency: Currency;
    procedure setCurrency(aval: Currency);
  published
    property val: Currency read getCurrency write setCurrency;
  end;

  //Double
  TADouble = class(TAGenObj)
  private
    fval: Double;
    function getDouble: Double;
    procedure setDouble(aval: Double);
  published
    property val: Double read getDouble write setDouble;
  end;

  //Extended
  TAExtended = class(TAGenObj)
  private
    fval: Extended;
    function getExtended: Extended;
    procedure setExtended(aval: Extended);
  published
    property val: Extended read getExtended write setExtended;
  end;

  // : Strings :

  //Char
  TAChar = class(TAGenObj)
  private
    fval: Char;
    function getChar: Char;
    procedure setChar(aval: Char);
  published
    property val: Char read getChar write setChar;
  end;

  //WideChar
  TAWideChar = class(TAGenObj)
  private
    fval: WideChar;
    function getWideChar: WideChar;
    procedure setWideChar(aval: WideChar);
  published
    property val: WideChar read getWideChar write setWideChar;
  end;

  //AnsiChar
  TAAnsiChar = class(TAGenObj)
  private
    fval: AnsiChar;
    function getAnsiChar: AnsiChar;
    procedure setAnsiChar(aval: AnsiChar);
  published
    property val: AnsiChar read getAnsiChar write setAnsiChar;
  end;

  //ShortString
  TAShortString = class(TAGenObj)
  private
    fval: ShortString;
    function getShortString: ShortString;
    procedure setShortString(aval: ShortString);
  published
    property val: ShortString read getShortString write setShortString;
  end;

  //String
  TAString = class(TAGenObj)
  private
    fval: String;
    function getString: String;
    procedure setString(aval: String);
    function getStr: String;
    procedure setStr(aval: String);
  published
    property val: String read getString write setString;
  end;

  //AnsiString
  TAAnsiString = class(TAGenObj)
  private
    fval: AnsiString;
    function getAnsiString: AnsiString;
    procedure setAnsiString(aval: AnsiString);
  published
    property val: AnsiString read getAnsiString write setAnsiString;
  end;

  //WideString
  TAWideString = class(TAGenObj)
  private
    fval: WideString;
    function getWideString: WideString;
    procedure setWideString(aval: WideString);
  published
    property val: WideString read getWideString write setWideString;
  end;

 //Boolean
 TABoolean = class(TAGenObj)
  private
    fval: Boolean;
    function getBoolean: Boolean;
    procedure setBoolean(aval: Boolean);
  published
    property val: Boolean read getBoolean write setBoolean;
  end;

implementation

{ TAStr }

function TAString.getStr: String;
begin
  result := fval;
end;

function TAString.getString: String;
begin

end;

procedure TAString.setStr(aval: String);
begin
  fval := val;
end;

procedure TAString.setString(aval: String);
begin
  fval := aval;
end;

{ TAByte }

function TAByte.getByte: Byte;
begin
  result := fval;
end;

procedure TAByte.setByte(aval: Byte);
begin
  fval := aval;
end;

{ TAShortInt }

function TAShortInt.getShortInt: ShortInt;
begin
  result := fval;
end;

procedure TAShortInt.setShortInt(aval: ShortInt);
begin
  fval := aval;
end;

{ TAInt64 }

function TAInt64.getInt64: Int64;
begin
  result := fval;
end;

procedure TAInt64.setInt64(aval: Int64);
begin
  fval := aval;
end;

{ TALongInt }

function TALongInt.getLongInt: LongInt;
begin
  result := fval;
end;

procedure TALongInt.setLongInt(aval: LongInt);
begin
  fval := aval;
end;

{ TAWord }

function TAWord.getWord: Word;
begin
  result := fval;
end;

procedure TAWord.setWord(aval: Word);
begin
  fval := aval;
end;

{ TASmallInt }

function TASmallInt.getSmallInt: SmallInt;
begin
  result := fval;
end;

procedure TASmallInt.setSmallInt(aval: SmallInt);
begin
  fval := aval;
end;

{ TALongWord }

function TALongWord.getLongWord: LongWord;
begin
  result := fval;
end;

procedure TALongWord.setLongWord(aval: LongWord);
begin
  fval := aval;
end;

{ TACardinal }

function TACardinal.getCardinal: Cardinal;
begin
  result := fval;
end;

procedure TACardinal.setCardinal(aval: Cardinal);
begin
  fval := aval;
end;

{ TAInteger }

function TAInteger.getInteger: Integer;
begin
  result := fval;
end;

procedure TAInteger.setInteger(aval: Integer);
begin
  fval := aval;
end;

{ TASingle }

function TASingle.getSingle: Single;
begin
  result := fval;
end;

procedure TASingle.setSingle(aval: Single);
begin
  fval := aval;
end;

{ TACurrency }

function TACurrency.getCurrency: Currency;
begin
  result := fval;
end;

procedure TACurrency.setCurrency(aval: Currency);
begin
  fval := aval;
end;

{ TADouble }

function TADouble.getDouble: Double;
begin
  result := fval;
end;

procedure TADouble.setDouble(aval: Double);
begin
  fval := aval;
end;

{ TAExtended }

function TAExtended.getExtended: Extended;
begin
  result := fval;
end;

procedure TAExtended.setExtended(aval: Extended);
begin
  fval := aval;
end;

{ TAChar }

function TAChar.getChar: Char;
begin
  result := fval;
end;

procedure TAChar.setChar(aval: Char);
begin
  fval := aval;
end;

{ TAWideChar }

function TAWideChar.getWideChar: WideChar;
begin
  result := fval;
end;

procedure TAWideChar.setWideChar(aval: WideChar);
begin
  fval := aval;
end;

{ TAAnsiChar }

function TAAnsiChar.getAnsiChar: AnsiChar;
begin
  result := fval;
end;

procedure TAAnsiChar.setAnsiChar(aval: AnsiChar);
begin
  fval := aval;
end;

{ TAShortString }

function TAShortString.getShortString: ShortString;
begin
  result := fval;
end;

procedure TAShortString.setShortString(aval: ShortString);
begin
  fval := aval;
end;

{ TAAnsiString }

function TAAnsiString.getAnsiString: AnsiString;
begin
  result := fval;
end;

procedure TAAnsiString.setAnsiString(aval: AnsiString);
begin
  fval := aval;
end;

{ TAWideString }

function TAWideString.getWideString: WideString;
begin
  result := fval;
end;

procedure TAWideString.setWideString(aval: WideString);
begin
  fval := aval;
end;

{ TABoolean }

function TABoolean.getBoolean: Boolean;
begin
  result := fval;
end;

procedure TABoolean.setBoolean(aval: Boolean);
begin
  fval := aval;
end;

end.
