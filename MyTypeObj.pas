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
    procedure setByteActEvent(aval: Byte);
  published
    property val: Byte read getByte write setByte;
  end;

  //ShortInt
  TAShortInt = class(TAGenObj)
  private
    fval: ShortInt;
    function getShortInt: ShortInt;
    procedure setShortInt(aval: ShortInt);
    procedure setShortIntActEvents(aval: ShortInt);
  published
    property val: ShortInt read getShortInt write setShortInt;
  end;

  //Word
  TAWord = class(TAGenObj)
  private
    fval: Word;
    function getWord: Word;
    procedure setWord(aval: Word);
    procedure setWordActEvents(aval: Word);
  published
    property val: Word read getWord write setWord;
  end;

  //SmallInt
  TASmallInt = class(TAGenObj)
  private
    fval: SmallInt;
    function getSmallInt: SmallInt;
    procedure setSmallInt(aval: SmallInt);
    procedure setSmallIntActEvents(aval: SmallInt);
  published
    property val: SmallInt read getSmallInt write setSmallInt;
  end;

  //LongWord
  TALongWord = class(TAGenObj)
  private
    fval: LongWord;
    function getLongWord: LongWord;
    procedure setLongWord(aval: LongWord);
    procedure setLongWordActEvents(aval: LongWord);
  published
    property val: LongWord read getLongWord write setLongWord;
  end;

  //Cardinal
  TACardinal = class(TAGenObj)
  private
    fval: Cardinal;
    function getCardinal: Cardinal;
    procedure setCardinal(aval: Cardinal);
    procedure setCardinalActEvents(aval: Cardinal);
  published
    property val: Cardinal read getCardinal write setCardinal;
  end;

  //LongInt
  TALongInt = class(TAGenObj)
  private
    fval: LongInt;
    function getLongInt: LongInt;
    procedure setLongInt(aval: LongInt);
    procedure setLongIntActEvents(aval: Cardinal);
  published
    property val: LongInt read getLongInt write setLongInt;
  end;

  //Integer
  TAInteger = class(TAGenObj)
  private
    fval: Integer;
    function getInteger: Integer;
    procedure setInteger(aval: Integer);
    procedure setIntegerActEvents(aval: Integer);
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
    procedure setInt64ActEvents(aval: Int64);
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
    procedure setSingleActEvents(aval: Single);
  published
    property val: Single read getSingle write setSingle;
  end;

  //Currency;
  TACurrency = class(TAGenObj)
  private
    fval: Currency;
    function getCurrency: Currency;
    procedure setCurrency(aval: Currency);
    procedure setCurrencyActEvents(aval: Currency);
  published
    property val: Currency read getCurrency write setCurrency;
  end;

  //Double
  TADouble = class(TAGenObj)
  private
    fval: Double;
    function getDouble: Double;
    procedure setDouble(aval: Double);
    procedure setDoubleActEvents(aval: Double);
  published
    property val: Double read getDouble write setDouble;
  end;

  //Extended
  TAExtended = class(TAGenObj)
  private
    fval: Extended;
    function getExtended: Extended;
    procedure setExtended(aval: Extended);
    procedure setExtendedActEvents(aval: Extended);
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
    procedure setCharActEvents(aval: Char);
  published
    property val: Char read getChar write setChar;
  end;

  //WideChar
  TAWideChar = class(TAGenObj)
  private
    fval: WideChar;
    function getWideChar: WideChar;
    procedure setWideChar(aval: WideChar);
    procedure setWideCharActEvents(aval: WideChar);
  published
    property val: WideChar read getWideChar write setWideChar;
  end;

  //AnsiChar
  TAAnsiChar = class(TAGenObj)
  private
    fval: AnsiChar;
    function getAnsiChar: AnsiChar;
    procedure setAnsiChar(aval: AnsiChar);
    procedure setAnsiCharActEvents(aval: AnsiChar);
  published
    property val: AnsiChar read getAnsiChar write setAnsiChar;
  end;

  //ShortString
  TAShortString = class(TAGenObj)
  private
    fval: ShortString;
    function getShortString: ShortString;
    procedure setShortString(aval: ShortString);
    procedure setShortStringActEvents(aval: ShortString);
  published
    property val: ShortString read getShortString write setShortString;
  end;

  //String
  TAString = class(TAGenObj)
  private
    fval: String;
    function getString: String;
    procedure setString(aval: String);
    procedure setStringActEvents(aval: String);
  published
    property val: String read getString write setString;
  end;

  //AnsiString
  TAAnsiString = class(TAGenObj)
  private
    fval: AnsiString;
    function getAnsiString: AnsiString;
    procedure setAnsiString(aval: AnsiString);
    procedure setAnsiStringActEvents(aval: AnsiString);
  published
    property val: AnsiString read getAnsiString write setAnsiString;
  end;

  //WideString
  TAWideString = class(TAGenObj)
  private
    fval: WideString;
    function getWideString: WideString;
    procedure setWideString(aval: WideString);
    procedure setWideStringActEvents(aval: WideString);
  published
    property val: WideString read getWideString write setWideString;
  end;

 //Boolean
 TABoolean = class(TAGenObj)
  private
    fval: Boolean;
    function getBoolean: Boolean;
    procedure setBoolean(aval: Boolean);
    procedure setBooleanActEvents(aval: Boolean);
  published
    property val: Boolean read getBoolean write setBoolean;
  end;

implementation

{ TAStr }

function TAString.getString: String;
begin
  result := fval;
end;

procedure TAString.setString(aval: String);
begin
  fval := aval;
end;

procedure TAString.setStringActEvents(aval: String);
begin
  //do before events
  setString(aval);
  //do after events
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

procedure TAByte.setByteActEvent(aval: Byte);
begin
  //do before events
  setByte(aval);
  //do after events
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

procedure TAShortInt.setShortIntActEvents(aval: ShortInt);
begin
  //do before events
  setShortInt(aval);
  //do after events

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

procedure TAInt64.setInt64ActEvents(aval: Int64);
begin
  //do before events
  setInt64(aval);
  //do after events
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

procedure TALongInt.setLongIntActEvents(aval: Cardinal);
begin
  //do before events
  setLongInt(aval);
  //do after events
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

procedure TAWord.setWordActEvents(aval: Word);
begin
  //do before events
  setWord(aval);
  //do after events
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

procedure TASmallInt.setSmallIntActEvents(aval: SmallInt);
begin
  //do before events
  setSmallInt(aval);
  //do after events
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

procedure TALongWord.setLongWordActEvents(aval: LongWord);
begin
  //do before events
  setLongWord(aval);
  //do after events
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

procedure TACardinal.setCardinalActEvents(aval: Cardinal);
begin
  //do before events
  setCardinal(aval);
  //do after events
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

procedure TAInteger.setIntegerActEvents(aval: Integer);
begin
  //do before events
  setInteger(aval);
  //do after events
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

procedure TASingle.setSingleActEvents(aval: Single);
begin
  //do before events
  setSingle(aval);
  //do after events
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

procedure TACurrency.setCurrencyActEvents(aval: Currency);
begin
  //do before events
  setCurrency(aval);
  //do after events
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

procedure TADouble.setDoubleActEvents(aval: Double);
begin
  //do before events
  setDouble(aval);
  //do after events
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

procedure TAExtended.setExtendedActEvents(aval: Extended);
begin
  //do before events
  setExtended(aval);
  //do after events
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

procedure TAChar.setCharActEvents(aval: Char);
begin
  //do before events
  setChar(aval);
  //do after events
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

procedure TAWideChar.setWideCharActEvents(aval: WideChar);
begin
  //do before events
  setWideChar(aval);
  //do after events
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

procedure TAAnsiChar.setAnsiCharActEvents(aval: AnsiChar);
begin
  //do before events
  setAnsiChar(aval);
  //do after events
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

procedure TAShortString.setShortStringActEvents(aval: ShortString);
begin
  //do before events
  setShortString(aval);
  //do after events
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

procedure TAAnsiString.setAnsiStringActEvents(aval: AnsiString);
begin
  //do before events
  setAnsiString(aval);
  //do after events
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

procedure TAWideString.setWideStringActEvents(aval: WideString);
begin
  //do before events
  setWideString(aval);
  //do after events
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

procedure TABoolean.setBooleanActEvents(aval: Boolean);
begin
  //do before events
  setBoolean(aval);
  //do after events
end;

end.
