unit MyAObject;

interface

uses
  TypInfo, Variants, Classes;

type

  TAGenObj = class;

  TTestProc = procedure(var i:string) of object;
  TEventProc = procedure(parentObj: TAGenObj) of object;

  {$M+}
  TEventList = class
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
  end;

  TAObj = class
  public
    parent: TAObj;
    constructor Create(aparent: TAObj = nil); virtual;
    function Kopia: TAObj; virtual; abstract;
    procedure PobierzZ(aobj: TAObj); virtual; abstract;
    function EQ(aobj: TAObj): boolean; virtual; abstract;
  end;

  TAGenObj = class (TAObj)
  public
    //afterInsert: TEventList;
    constructor Create(aparent: TAObj = nil); override;
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
  //dla typu prostego.
    parentHolder: TAObj;
  public
    constructor Create(aparent: TAObj); override;
  //dziedzicz¹ce funkcje bêd¹ mia³y w Exec kod wywo³uj¹cy odpowiedni¹ procedurê
    procedure Exec; virtual; abstract;
  end;

  {$M-}

implementation

uses
  MyUtils, SysUtils;

{ TMethodList }

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

{ TAGenObj }

constructor TAGenObj.Create(aparent: TAObj = nil);
begin
  inherited;
  //afterInsert := TEventList.Create;
end;

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
    begin
      result := result and (GetPropValue(self, propInfo^.Name) = GetPropValue(aObj, propInfo^.Name))
    end;
    if not result then
      Exit;
  end;
end;

function TAGenObj.Kopia: TAObj;
begin
  result := self.ClassType.Create as TAObj;
  result.PobierzZ(self);
end;

procedure TAGenObj.PobierzZ(aobj: TAObj);
var
  i, propCount: integer;
  list: TPropList;
  propInfo: PPropInfo;
  propObj: TObject;
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
        propObj := GetObjectProp(self, propInfo^.Name);
        FreeNil(propObj);
        propObj := GetObjectProp(aobj, propInfo^.Name).ClassType.Create;
        SetObjectProp(self, propInfo^.Name, propObj);
        (propObj as TAGenObj).PObierzZ(GetObjectProp(aobj, propInfo^.Name) as TAObj);
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

constructor TAObj.Create(aparent: TAObj = nil);
begin
  parent := aparent;
end;

end.
