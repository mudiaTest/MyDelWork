unit MyTypeObj;

interface

uses
  MyAObject;

Type

  TSetByte = procedure(aval: Byte) of object;
  TSetShortInt = procedure(aval: ShortInt) of object;
  TSetWord = procedure(aval: Word) of object;
  TSetSmallInt = procedure(aval: SmallInt) of object;
  TSetLongWord = procedure(aval: LongWord) of object;
  TSetCardinal = procedure(aval: Cardinal) of object;
  TSetLongInt = procedure(aval: LongInt) of object;
  TSetInteger = procedure(aval: Integer) of object;
  TSetInt64 = procedure(aval: Int64) of object;
  TSetSingle = procedure(aval: Single) of object;
  TSetCurrency = procedure(Currency: Currency) of object;
  TSetDouble = procedure(aval: Double) of object;
  TSetExtended = procedure(aval: Extended) of object;
  TSetChar = procedure(aval: Char) of object;
  TSetWideChar = procedure(aval: WideChar) of object;
  TSetAnsiChar = procedure(aval: AnsiChar) of object;
  TSetShortString = procedure(aval: ShortString) of object;
  TSetString = procedure(aval: String) of object;
  TSetAnsiString = procedure(aval: AnsiString) of object;
  TSetWideString = procedure(aval: WideString) of object;
  TSetBoolean = procedure(aval: Boolean) of object;

  TEventList = class
  end;
  
  TTypeGenObj = class (TAGenObj)
  private
    beforeSet: TEventList;
    afterSet: TEventList;
  //znacznik, czy obiekt odpala eventy, nie
    fblFireEvents: Boolean;
  public
    constructor Create(aparent: TAObj = nil); override;
  published
  //pojemnik na funkcjê ustawiaj¹c¹ wartoœæ val
    //setterFunct: TSetXXX;
    procedure FireEventList(alist: TEventList);
    procedure SetFireEvents(blFireEvents: Boolean); virtual; abstract;
  //ustarwia wartoœæ val
    //procedure SetVal(aval:XXX );
  //wywo³uje SetVal, ale uruchamia eventy przed i po
    //procedure SetValWithEvents(aval: XXX);
  //podstawowy getter
    //function getXXX: Double;
  //podstawowy setter - wywo³uje setterFunct
    //procedure setXXX(aval: XXX);
    property blFireEvents: Boolean read fblFireEvents write SetFireEvents;
  end;

  // : Integer Data Types :

  //Byte
  TAByte = class(TTypeGenObj)
  private
    fval: Byte;
    setterFunct: TSetByte;
    procedure SetVal(aval: Byte);
    procedure SetValWithEvents(aval: Byte);
    function getByte: Byte;
    procedure setByte(aval: Byte);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Byte read getByte write setByte;
  end;

  //ShortInt
  TAShortInt = class(TTypeGenObj)
  private
    fval: ShortInt;
    setterFunct: TSetShortInt;
    procedure SetVal(aval: ShortInt);
    procedure SetValWithEvents(aval: ShortInt);
    function getShortInt: ShortInt;
    procedure setShortInt(aval: ShortInt);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: ShortInt read getShortInt write setShortInt;
  end;

  //Word
  TAWord = class(TTypeGenObj)
  private
    fval: Word;
    setterFunct: TSetWord;
    procedure SetVal(aval: Word);
    procedure SetValWithEvents(aval: Word);
    function getWord: Word;
    procedure setWord(aval: Word);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Word read getWord write setWord;
  end;

  //SmallInt
  TASmallInt = class(TTypeGenObj)
  private
    fval: SmallInt;
    setterFunct: TSetSmallInt;
    procedure SetVal(aval: SmallInt);
    procedure SetValWithEvents(aval: SmallInt);
    function getSmallInt: SmallInt;
    procedure setSmallInt(aval: SmallInt);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: SmallInt read getSmallInt write setSmallInt;
  end;

  //LongWord
  TALongWord = class(TTypeGenObj)
  private
    fval: LongWord;
    setterFunct: TSetLongWord;
    procedure SetVal(aval: LongWord);
    procedure SetValWithEvents(aval: LongWord);
    function getLongWord: LongWord;
    procedure setLongWord(aval: LongWord);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: LongWord read getLongWord write setLongWord;
  end;

  //Cardinal
  TACardinal = class(TTypeGenObj)
  private
    fval: Cardinal;
    setterFunct: TSetCardinal;
    procedure SetVal(aval: Cardinal);
    procedure SetValWithEvents(aval: Cardinal);
    function getCardinal: Cardinal;
    procedure setCardinal(aval: Cardinal);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Cardinal read getCardinal write setCardinal;
  end;

  //LongInt
  TALongInt = class(TTypeGenObj)
  private
    fval: LongInt;
    setterFunct: TSetLongInt;
    procedure SetVal(aval: LongInt);
    procedure SetValWithEvents(aval: LongInt);
    function getLongInt: LongInt;
    procedure setLongInt(aval: LongInt);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: LongInt read getLongInt write setLongInt;
  end;

  //Integer
  TAInteger = class(TTypeGenObj)
  private
    fval: Integer;
    setterFunct: TSetInteger;
    procedure SetVal(aval: Integer);
    procedure SetValWithEvents(aval: Integer);
    function getInteger: Integer;
    procedure setInteger(aval: Integer);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    //property pint: Integer read getInt write setInt;
    property val: Integer read getInteger write setInteger;
  end;

  //Int64
  TAInt64 = class(TTypeGenObj)
  private
    fval: Int64;
    setterFunct: TSetInt64;
    procedure SetVal(aval: Int64);
    procedure SetValWithEvents(aval: Int64);
    function getInt64: Int64;
    procedure setInt64(aval: Int64);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Int64 read getInt64 write setInt64;
  end;

   // : Decimal data types :

  //Single;
  TASingle = class(TTypeGenObj)
  private
    fval: Single;
    setterFunct: TSetSingle;
    procedure SetVal(aval: Single);
    procedure SetValWithEvents(aval: Single);
    function getSingle: Single;
    procedure setSingle(aval: Single);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Single read getSingle write setSingle;
  end;

  //Currency;
  TACurrency = class(TTypeGenObj)
  private
    fval: Currency;
    setterFunct: TSetCurrency;
    procedure SetVal(aval: Currency);
    procedure SetValWithEvents(aval: Currency);
    function getCurrency: Currency;
    procedure setCurrency(aval: Currency);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Currency read getCurrency write setCurrency;
  end;

  //Double
  TADouble = class(TTypeGenObj)
  private
    fval: Double;
    setterFunct: TSetDouble;
    procedure SetVal(aval:Double );
    procedure SetValWithEvents(aval: Double);
    function getDouble: Double;
    procedure setDouble(aval: Double);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Double read getDouble write setDouble;
  end;

  //Extended
  TAExtended = class(TTypeGenObj)
  private
    fval: Extended;
    setterFunct: TSetExtended;
    procedure SetVal(aval: Extended);
    procedure SetValWithEvents(aval: Extended);
    function getExtended: Extended;
    procedure setExtended(aval: Extended);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Extended read getExtended write setExtended;
  end;

  // : Strings :

  //Char
  TAChar = class(TTypeGenObj)
  private
    fval: Char;
    setterFunct: TSetChar;
    procedure SetVal(aval: Char);
    procedure SetValWithEvents(aval: Char);
    function getChar: Char;
    procedure setChar(aval: Char);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Char read getChar write setChar;
  end;

  //WideChar
  TAWideChar = class(TTypeGenObj)
  private
    fval: WideChar;
    setterFunct: TSetWideChar;
    procedure SetVal(aval: WideChar);
    procedure SetValWithEvents(aval: WideChar);
    function getWideChar: WideChar;
    procedure setWideChar(aval: WideChar);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: WideChar read getWideChar write setWideChar;
  end;

  //AnsiChar
  TAAnsiChar = class(TTypeGenObj)
  private
    fval: AnsiChar;
    setterFunct: TSetAnsiChar;
    procedure SetVal(aval: AnsiChar);
    procedure SetValWithEvents(aval: AnsiChar);
    function getAnsiChar: AnsiChar;
    procedure setAnsiChar(aval: AnsiChar);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: AnsiChar read getAnsiChar write setAnsiChar;
  end;

  //ShortString
  TAShortString = class(TTypeGenObj)
  private
    fval: ShortString;
    setterFunct: TSetShortString;
    procedure SetVal(aval: ShortString);
    procedure SetValWithEvents(aval: ShortString);
    function getShortString: ShortString;
    procedure setShortString(aval: ShortString);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: ShortString read getShortString write setShortString;
  end;

  //String
  TAString = class(TTypeGenObj)
  private
    fval: String;
    setterFunct: TSetString;
    procedure SetVal(aval: String);
    procedure SetValWithEvents(aval: String);
    function getString: String;
    procedure setString(aval: String);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: String read getString write setString;
  end;

  //AnsiString
  TAAnsiString = class(TTypeGenObj)
  private
    fval: AnsiString;
    setterFunct: TSetAnsiString;
    procedure SetVal(aval: AnsiString);
    procedure SetValWithEvents(aval: AnsiString);
    function getAnsiString: AnsiString;
    procedure setAnsiString(aval: AnsiString);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: AnsiString read getAnsiString write setAnsiString;
  end;

  //WideString
  TAWideString = class(TTypeGenObj)
  private
    fval: WideString;
    setterFunct: TSetWideString;
    procedure SetVal(aval: WideString);
    procedure SetValWithEvents(aval: WideString);
    function getWideString: WideString;
    procedure setWideString(aval: WideString);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: WideString read getWideString write setWideString;
  end;

 //Boolean
 TABoolean = class(TTypeGenObj)
  private
    fval: Boolean;
    setterFunct: TSetBoolean;
    procedure SetVal(aval: Boolean);
    procedure SetValWithEvents(aval: Boolean);
    function getBoolean: Boolean;
    procedure setBoolean(aval: Boolean);
    procedure SetFireEvents(ablFireEvents: Boolean); override;
  published
    property val: Boolean read getBoolean write setBoolean;
  end;

implementation

{ TAStr }

function TAString.getString: String;
begin
  result := fval;
end;

procedure TAString.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAString.setString(aval: String);
begin
  fval := aval;
end;

procedure TAString.SetVal(aval: String);
begin
  fval := aval;
end;

procedure TAString.SetValWithEvents(aval: String);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TAByte.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAByte.SetVal(aval: Byte);
begin
  fval := aval;
end;

procedure TAByte.SetValWithEvents(aval: Byte);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAShortInt }

function TAShortInt.getShortInt: ShortInt;
begin
  result := fval;
end;

procedure TAShortInt.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAShortInt.setShortInt(aval: ShortInt);
begin
  fval := aval;
end;

procedure TAShortInt.SetVal(aval: ShortInt);
begin
  fval := aval;
end;

procedure TAShortInt.SetValWithEvents(aval: ShortInt);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAInt64 }

function TAInt64.getInt64: Int64;
begin
  result := fval;
end;

procedure TAInt64.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAInt64.setInt64(aval: Int64);
begin
  fval := aval;
end;

procedure TAInt64.SetVal(aval: Int64);
begin
  fval := aval;
end;

procedure TAInt64.SetValWithEvents(aval: Int64);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TALongInt }

function TALongInt.getLongInt: LongInt;
begin
  result := fval;
end;

procedure TALongInt.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TALongInt.setLongInt(aval: LongInt);
begin
  fval := aval;
end;

procedure TALongInt.SetVal(aval: Integer);
begin
  fval := aval;
end;

procedure TALongInt.SetValWithEvents(aval: Integer);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAWord }

function TAWord.getWord: Word;
begin
  result := fval;
end;

procedure TAWord.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAWord.SetVal(aval: Word);
begin
  fval := aval;
end;

procedure TAWord.SetValWithEvents(aval: Word);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TASmallInt.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TASmallInt.setSmallInt(aval: SmallInt);
begin
  fval := aval;
end;

procedure TASmallInt.SetVal(aval: SmallInt);
begin
  fval := aval;
end;

procedure TASmallInt.SetValWithEvents(aval: SmallInt);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TALongWord }

function TALongWord.getLongWord: LongWord;
begin
  result := fval;
end;

procedure TALongWord.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TALongWord.setLongWord(aval: LongWord);
begin
  fval := aval;
end;

procedure TALongWord.SetVal(aval: LongWord);
begin
  fval := aval;
end;

procedure TALongWord.SetValWithEvents(aval: LongWord);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TACardinal.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TACardinal.SetVal(aval: Cardinal);
begin
  fval := aval;
end;

procedure TACardinal.SetValWithEvents(aval: Cardinal);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAInteger }

function TAInteger.getInteger: Integer;
begin
  result := fval;
end;

procedure TAInteger.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAInteger.setInteger(aval: Integer);
begin
  fval := aval;
end;

procedure TAInteger.SetVal(aval: Integer);
begin
  fval := aval;
end;

procedure TAInteger.SetValWithEvents(aval: Integer);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TASingle }

function TASingle.getSingle: Single;
begin
  result := fval;
end;

procedure TASingle.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TASingle.setSingle(aval: Single);
begin
  fval := aval;
end;

procedure TASingle.SetVal(aval: Single);
begin
  fval := aval;
end;

procedure TASingle.SetValWithEvents(aval: Single);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TACurrency.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TACurrency.SetVal(aval: Currency);
begin
  fval := aval;
end;

procedure TACurrency.SetValWithEvents(aval: Currency);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TADouble.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TADouble.SetVal(aval: Double);
begin
  fval := aval;
end;

procedure TADouble.SetValWithEvents(aval: Double);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TAExtended.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAExtended.SetVal(aval: Extended);
begin
  fval := aval;
end;

procedure TAExtended.SetValWithEvents(aval: Extended);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TAChar.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAChar.SetVal(aval: Char);
begin
  fval := aval;
end;

procedure TAChar.SetValWithEvents(aval: Char);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAWideChar }

function TAWideChar.getWideChar: WideChar;
begin
  result := fval;
end;

procedure TAWideChar.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAWideChar.SetVal(aval: WideChar);
begin
  fval := aval;
end;

procedure TAWideChar.SetValWithEvents(aval: WideChar);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TAAnsiChar.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAAnsiChar.SetVal(aval: AnsiChar);
begin
  fval := aval;
end;

procedure TAAnsiChar.SetValWithEvents(aval: AnsiChar);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAShortString }

function TAShortString.getShortString: ShortString;
begin
  result := fval;
end;

procedure TAShortString.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAShortString.setShortString(aval: ShortString);
begin
  fval := aval;
end;

procedure TAShortString.SetVal(aval: ShortString);
begin
  fval := aval;
end;

procedure TAShortString.SetValWithEvents(aval: ShortString);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TAAnsiString.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAAnsiString.SetVal(aval: AnsiString);
begin
  fval := aval;
end;

procedure TAAnsiString.SetValWithEvents(aval: AnsiString);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAWideString }

function TAWideString.getWideString: WideString;
begin
  result := fval;
end;

procedure TAWideString.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TAWideString.SetVal(aval: WideString);
begin
  fval := aval;
end;

procedure TAWideString.SetValWithEvents(aval: WideString);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
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

procedure TABoolean.SetFireEvents(ablFireEvents: Boolean);
begin
  fblFireEvents := ablFireEvents;
  if ablFireEvents then
    setterFunct := SetValWithEvents
  else
    setterFunct := SetVal;
end;

procedure TABoolean.SetVal(aval: Boolean);
begin
  fval := aval;
end;

procedure TABoolean.SetValWithEvents(aval: Boolean);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TTypeGenObj }

constructor TTypeGenObj.Create(aparent: TAObj);
begin
  inherited;
  fblFireEvents := false;
end;

procedure TTypeGenObj.FireEventList(alist: TEventList);
begin
  //cia³o odpalacza eventów
end;

end.
