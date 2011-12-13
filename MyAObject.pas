unit MyAObject;

interface

uses
  TypInfo, Variants, Classes;

type

  TAGenObj = class;

  TTestProc = procedure(var i:string) of object;
  TEventProc = procedure(parentObj: TAGenObj) of object;
  TAObjClass = class of TAObj;

  {$M+}
 { TEventList = class
  private
    fData: TList;
    function GetItem(aIndex: integer): TEventProc;
    function GetCount: integer;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Add(aproc: TEventProc);
    //procedure Remove(amethod: TEventProc);
    property Items[aIndex: integer]: TEventProc read GetItem; default;
    property Count: integer read GetCount;
  end;   }

  TAObj = class
  public
    parent: TAObj;
    constructor Create; overload; virtual;
    constructor Create(aparent: TAObj); overload; virtual;
    function Kopia: TAObj; virtual; abstract;
    procedure PobierzZ(aobj: TAObj); virtual; abstract;
    function EQ(aobj: TAObj): boolean; virtual; abstract;
  end;

  TAGenObj = class (TAObj)
  public
    procedure initTest(i: integer);
    function Kopia: TAObj; override;
    procedure PobierzZ(aobj: TAObj); override;
    function EQ(aobj: TAObj): boolean; override;
  end;

  //Ka¿da klasa dziedzicz¹ca musi mieæ jako podobiekt klasê metody i przeci¹¿yæ
  //Create, aby przyjmowa³o tak¹ klasê
  TAEventWraper = class(TAGenObj)
  private
  //parent to ojciec, czyli obiekt na zmianê którego bêdzie wykonany event.
  //Zazwyczaj bêdzie to AObiekt dla typu prostego
  //parentHolder to "dziadek", czyli obekt, którego "polem" jest ww AObiekt
    parentHolder: TAObj;
  public
  //procedura uruchamiana przez listê eventów
    procedure DoTask; virtual; abstract;
    constructor Create(aparent: TAObj); override;
  end;

  //Lista Eventów
  // - eventy odpalaj¹ siê w kolejnoœci lp: od najmniejszego do najwiêkszego;
  // - jest sotowana po lp dodawanego Eventu po ka¿dym dodaniu Eventu.
  TEventList = class
  private
    evlist: TStringList;
  protected
    constructor CreatePrv; virtual;
  public
    constructor CreatePrv2; virtual;
    constructor Create; reintroduce; virtual;
    procedure Clear;
    procedure AddEvent(aevent: TAEventWraper; lp: Integer); virtual;
    procedure DelEvent(lp: Integer);
  //oddaje evenetn to jego kluczy
    function GetEvByVal(strLp: String): TAEventWraper;
  //oddaje event po jego indeksie
    function GetEvByIdx(lp: Integer): TAEventWraper;
  //oddaje klucz po jego indeksie
    function GetValByIdx(lp: Integer): String;
  //zwraca liczbê eventów w liœcie
    function Count: Integer;
  //odpala ca³¹ listê eventów w kolejnoœci od najmniejszego lp.
    procedure FireEventList;
  end;

  {$M-}

implementation

uses
  MyUtils, SysUtils;

{ TMethodList }
 {
procedure TEventList.Add(aproc: TEventProc);
begin
  fData.Add( TMethod(aproc).Data );
  //fData.Add( aHandler.Code );
end;

constructor TEventList.Create;
begin
  fData := TList.Create;
end;

destructor TEventList.Destroy;
begin
  fData.Free;
end;

function TEventList.GetCount: integer;
begin
  Result := fData.Count div 2;
end;

function TEventList.GetItem(aIndex: integer): TEventProc;
begin
  result := TEventProc(fData[aindex]^);
  //aIndex := aIndex * 2;
  //Result.Data := fData[aIndex];
  //Result.Code := fData[aIndex+1];
end;

{procedure TEventList.Remove(aHandler: TMethod);
var
  cPos: integer;
begin
  cPos := fData.Count -2;
  while cPos >= 0 do
  begin
    if (fData.List[cPos] = aHandler.Data) and (fData.List[cPos +1] = aHandler.Code) then
    begin
      fData.Delete( cPos );
      fData.Delete( cPos );
      Exit;
    end;
    Dec( cPos, 2 );
  end;
end;}

{ TEventList }
{ TEventList }

procedure TEventList.AddEvent(aevent: TAEventWraper; lp: integer);
var
  i: integer;
  strLp: String;
begin
  strLp := IntToStr(lp);
  if evList.IndexOf(strLp) > -1 then
  begin
    Assert(false, 'Istnieje ju¿ Event o numerze ' + IntToStr(lp));
    Exit;
  end;
  evList.AddObject(strLp, aevent);
  evList.CustomSort(StringListNrSort);
end;

procedure TEventList.Clear;
begin
  evList.Clear;
end;

function TEventList.Count: integer;
begin
  result := evList.Count;
end;

constructor TEventList.Create;
begin
  Assert(false, 'Niedozwolony konstruktor');
end;

constructor TEventList.CreatePrv;
begin
  evlist := TStringList.Create;
end;

constructor TEventList.CreatePrv2;
begin

end;

function TEventList.GetEvByIdx(lp: Integer): TAEventWraper;
var
  strLp: String;
begin
  if evList.Count-1 < lp then
  begin
    Assert(false, 'Brak Eventu o indeksie ' + IntToStr(lp));
    Exit;
  end;
  result := evList.Objects[lp] as TAEventWraper;
end;

function TEventList.GetEvByVal(strLp: String): TAEventWraper;
begin
  if evList.IndexOf(strLp) = -1 then
  begin
    Assert(false, 'Brak Eventu o numerze ' + strLp);
    Exit;
  end;
  result := evList.Objects[evList.indexOf(strLp)] as TAEventWraper;
end;

function TEventList.GetValByIdx(lp: Integer): String;
begin
  if evList.Count-1 < lp then
   begin
    Assert(false, 'Brak wartoœci: lp:' + IntToStr(lp) + '; count:' + IntToStr(evList.Count));
    Exit;
  end;
  result := evList[lp];
end;

procedure TEventList.DelEvent(lp: integer);
var
  strLp: String;
begin
  strLp := IntToStr(lp);
  if evList.IndexOf(strLp) = -1 then
  begin
    Assert(false, 'Brak Eventu o numerze ' + IntToStr(lp));
    Exit;
  end;
  evList.Delete(lp);
end;

procedure TEventList.FireEventList;
var
  i: integer;
  obj: TAEventWraper;
begin
  for i:=0 to count-1 do
  begin
    obj := GetEvByIdx(i);
    obj.DoTask;
  end;
  bp;
end;

{ TAGenObj }

function TAGenObj.EQ(aobj: TAObj): boolean;
var
  propCount: integer;
  i: integer;
  list: TPropList;
  propInfo: PPropInfo;
  propObjSelf, propObjAObj: TAObj;
begin
  result := self.ClassType = aobj.ClassType;
  if result = false then
    Exit;
  propCount := GetPropList(self.classInfo, tkAny, @list);
  for i:=0 to propCount-1 do
  begin
    propInfo := list[i];
    if propInfo^.PropType^.Kind = tkClass then
    begin
      propObjSelf := getObjectProp(self, propInfo^.Name) as TAObj;
      propObjAObj := getObjectProp(aObj, propInfo^.Name) as TAObj;
      result := result and propObjSelf.EQ(propObjAObj);
    end
    else
      result := result and (GetPropValue(self, propInfo^.Name) = GetPropValue(aObj, propInfo^.Name));
    if not result then
      Exit;
  end;
end;

function TAGenObj.Kopia: TAObj;
begin
  result := self.ClassType.Create as TAObj;
  result.parent := self.parent;
  result.PobierzZ(self);
end;

procedure TAGenObj.PobierzZ(aobj: TAObj);
var
  i, propCount: Integer;
  list: TPropList;
  propInfo: PPropInfo;
  propObj: TAGenObj;
begin
  if self.ClassName <> aobj.ClassName then
    Assert(false, 'PobierzZ: self: ' + self.ClassName +
                  ', aobj: ' + aobj.ClassName);
  propCount := GetPropList(self.classInfo, tkAny, @list);
  for i:=0 to Pred(propCount) do
  begin
    propInfo := list[i];
    case propInfo^.proptype^.kind of
      tkClass :
      begin
        if not (GetObjectProp(aobj, propInfo^.Name) is TAGenObj) then
          Assert(false, 'Obiekt z property jest klasy ' + GetObjectProp(aobj, propInfo^.Name).ClassName);
        propObj := (GetObjectProp(self, propInfo^.Name) as TAGenObj);
        FreeNil(propObj);
        propObj := TAObjClass(GetObjectProp(aobj, propInfo^.Name).ClassType).Create(self) as TAGenObj;
        SetObjectProp(self, propInfo^.Name, propObj);
        propObj.PObierzZ(GetObjectProp(aobj, propInfo^.Name) as TAObj);
      end;
      tkMethod :
      begin
        SetMethodProp(self, propInfo^.Name, GetMethodProp(aobj, propInfo^.Name));
      end
      else
        SetPropValue(self, propInfo^.Name, GetPropValue(aobj, propInfo^.Name, false));
    end;
  end;
end;

procedure TAGenObj.initTest(i: integer);
var
  t: variant;
begin
  if i=2 then
  begin
    varastype(t, varstring);
    GetordProp(self, '');
    GetstrProp(self, '');
    GetfloatProp(self, '');
    GetVariantProp(self, '');
    GetmethodProp(self, '');
    Getint64Prop(self, '');
  end;
end;

{ TAEventWraper }

constructor TAEventWraper.Create(aparent: TAObj);
begin
  inherited;
  parentHolder := aparent.parent;
end;

{ TAObj }

constructor TAObj.Create(aparent: TAObj);
begin
  parent := aparent;
end;

constructor TAObj.Create;
begin
  Assert(false, 'Niedozwolony konstruktor');
end;

end.
