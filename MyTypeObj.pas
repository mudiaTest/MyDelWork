unit MyTypeObj;

interface

uses
  MyAObject, Classes;

Type

  TTypeGenObj = class;

  //klasy funkcji setterów
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

  TATypeEvent = class(TAEventWraper)
    owner: TTypeGenObj;
    procedure DoTask; override;
  end;

  TTypeEventList = class(TEventList)
  private
    owner: TTypeGenObj;
  public
    constructor Create; reintroduce; overload;
    constructor Create(aowner: TTypeGenObj); override; overload;
    procedure AddEvent(aevent: TAEventWraper; lp: Integer); override;
  end;

  TTypeGenObj = class (TAGenObj)
  private
  // fnewVal : nowaWartoœæ;
    beforeSet: TEventList;
    afterSet: TEventList;
  //znacznik: czy obiekt odpala eventy, nie
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
  published
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Byte read getByte write setByte;
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: ShortInt read getShortInt write setShortInt;
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Word read getWord write setWord;        
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: SmallInt read getSmallInt write setSmallInt;
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published    
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: LongWord read getLongWord write setLongWord;  
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published    
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Cardinal read getCardinal write setCardinal;  
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: LongInt read getLongInt write setLongInt; 
  public
    constructor Create(aparent: TAObj = nil); override;
  end;

  //Integer
  TAInteger = class(TTypeGenObj)
  private
    fnewVal: Byte;
    fval: Integer;
    setterFunct: TSetInteger;
    procedure SetVal(aval: Integer);
    procedure SetValWithEvents(aval: Integer);
    function getInteger: Integer;
    procedure setInteger(aval: Integer);
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    //property pint: Integer read getInt write setInt;
    property val: Integer read getInteger write setInteger;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Int64 read getInt64 write setInt64;  
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published     
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Single read getSingle write setSingle; 
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published    
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Currency read getCurrency write setCurrency;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published   
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Double read getDouble write setDouble;  
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published   
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Extended read getExtended write setExtended;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published 
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Char read getChar write setChar;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: WideChar read getWideChar write setWideChar; 
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published 
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: AnsiChar read getAnsiChar write setAnsiChar;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published   
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: ShortString read getShortString write setShortString;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: String read getString write setString;  
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published  
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: AnsiString read getAnsiString write setAnsiString;   
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published   
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: WideString read getWideString write setWideString; 
  public
    constructor Create(aparent: TAObj = nil); override;
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
  published
    procedure SetFireEvents(ablFireEvents: Boolean); override;
    property val: Boolean read getBoolean write setBoolean;
  public
    constructor Create(aparent: TAObj = nil); override;
  end;

implementation

uses
  MyUtils, SysUtils;

{ TAStr }

constructor TAString.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TAByte.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TAByte.getByte: Byte;
begin
  result := fval;
end;

procedure TAByte.setByte(aval: Byte);
begin
  setterFunct(aval);
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

constructor TAShortInt.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TAInt64.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TALongInt.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TAWord.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
end;

{ TASmallInt }

constructor TASmallInt.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TALongWord.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TACardinal.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TACardinal.getCardinal: Cardinal;
begin
  result := fval;
end;

procedure TACardinal.setCardinal(aval: Cardinal);
begin
  setterFunct(aval);
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

constructor TAInteger.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
end;

procedure TAInteger.SetVal(aval: Integer);
begin
  fval := aval;
end;

procedure TAInteger.SetValWithEvents(aval: Integer);
begin
  fnewVal := aval;
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
  fnewVal := fVal;
end;

{ TASingle }

constructor TASingle.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
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

constructor TACurrency.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TACurrency.getCurrency: Currency;
begin
  result := fval;
end;

procedure TACurrency.setCurrency(aval: Currency);
begin
  setterFunct(aval);
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

constructor TADouble.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TADouble.getDouble: Double;
begin
  result := fval;
end;

procedure TADouble.setDouble(aval: Double);
begin
  setterFunct(aval);
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

constructor TAExtended.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TAExtended.getExtended: Extended;
begin
  result := fval;
end;

procedure TAExtended.setExtended(aval: Extended);
begin
  setterFunct(aval);
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

constructor TAChar.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TAChar.getChar: Char;
begin
  result := fval;
end;

procedure TAChar.setChar(aval: Char);
begin
  setterFunct(aval);
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

constructor TAWideChar.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
end;

{ TAAnsiChar }

constructor TAAnsiChar.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TAAnsiChar.getAnsiChar: AnsiChar;
begin
  result := fval;
end;

procedure TAAnsiChar.setAnsiChar(aval: AnsiChar);
begin
  setterFunct(aval);
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

constructor TAShortString.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
end;

procedure TAShortString.SetVal(aval: ShortString);
begin
  setterFunct(aval);
end;

procedure TAShortString.SetValWithEvents(aval: ShortString);
begin
  FireEventList(beforeSet);
  SetVal(aval);
  FireEventList(afterSet);
end;

{ TAAnsiString }

constructor TAAnsiString.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TAAnsiString.getAnsiString: AnsiString;
begin
  result := fval;
end;

procedure TAAnsiString.setAnsiString(aval: AnsiString);
begin
  setterFunct(aval);
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

constructor TAWideString.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

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
  setterFunct(aval);
end;

{ TABoolean }

constructor TABoolean.Create(aparent: TAObj);
begin
  inherited;
  setterFunct := SetValWithEvents;
end;

function TABoolean.getBoolean: Boolean;
begin
  result := fval;
end;

procedure TABoolean.setBoolean(aval: Boolean);
begin
  setterFunct(aval);
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
  beforeSet := TEventList.Create;
  afterSet := TEventList.Create;
end;

procedure TTypeGenObj.FireEventList(alist: TEventList);
var
  i: integer;
  obj: TAEventWraper;
begin
  //cia³o odpalacza eventów
  for i:=0 to alist.count-1 do
  begin
    obj := alist.GetEvByIdx(i);
    obj.DoTask;
  end;
  bp;
end;

{ TTypeEventList }

constructor TTypeEventList.Create;
begin
  Assert(false, 'Niedozwolony konstruktor');
end;

procedure TTypeEventList.AddEvent(aevent: TAEventWraper; lp: Integer);
begin
  if not (aevent is TATypeEvent) then
    Assert(false, 'Event klasy:' + aevent.className + ', oczekiwano:' + TATypeEvent.ClassName);
  inherited;
  (aevent as TATypeEvent).owner := owner;
end;

constructor TTypeEventList.Create(aowner: TTypeGenObj);
begin
  inherited Create;
  owner := aowner;
end;

end.
