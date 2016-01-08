unit RegisterGUI;

interface

uses
  // VCL
  Classes,
  Forms,
  Controls,
  ExtCtrls,
  Dialogs;

type
  IInterfaceRegistry = interface
  ['{1F44813F-A8EA-4C5C-B7E9-34626108C171}']
    procedure RegisterClass(const IID: TGUID; aClass: TComponentClass);
    procedure RegisterInstance(const IID: TGUID; aComponent: TComponent);
    function FindInstance(const IID: TGUID; out Obj): boolean;
    function HasInstance(const IID: TGUID): boolean;
  end;

  IAttracsGui = interface
    ['{49C1E5D8-92CE-486C-9082-FC257C1F2A6A}']
    procedure RegisterForm(const IID: TGUID; aClass: TComponentClass); overload;
    procedure RegisterForm(const IID: TGUID; aComponent: TComponent); overload;
  end;
  
function Gui: IAttracsGui;

implementation

uses
  SysUtils;
  
type
  TInterfaceClassRegistryEntry = record
    IID: TGUID;
    ComponentClass: TComponentClass;
  end;

  TInterfaceInstanceRegistryEntry = record
    IID: TGUID;
    InstanceAsComponent: TComponent;
  end;

  TClassRegistryArray = array of TInterfaceClassRegistryEntry;
  TInterfaceRegistryArray = array of TInterfaceInstanceRegistryEntry;

procedure DeleteItem(var A: TClassRegistryArray; const Index: Cardinal); overload;
var
  ALength: Cardinal;
  i: Cardinal;
begin
  ALength := Length(A);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do
    A[i - 1] := A[i];
  SetLength(A, ALength - 1);
end;

procedure DeleteItem(var A: TInterfaceRegistryArray; const Index: Cardinal); overload;
var
  ALength: Cardinal;
  i: Cardinal;
begin
  ALength := Length(A);
  Assert(ALength > 0);
  Assert(Index < ALength);
  for i := Index + 1 to ALength - 1 do
    A[i - 1] := A[i];
  SetLength(A, ALength - 1);
end;

type
  TInterfaceRegistry = class(TComponent, IInterfaceRegistry)
  private
    fClasses: TClassRegistryArray;
    fInstances: TInterfaceRegistryArray;
    class var _Instance: IInterfaceRegistry;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure InternalRegisterInstance(const IID: TGUID; aComponent: TComponent; out Obj);
    function FindClass(const IID: TGUID): TComponentClass;
    { IInterfaceRegistry }
    procedure RegisterClass(const IID: TGUID; aClass: TComponentClass);
    procedure RegisterInstance(const IID: TGUID; aComponent: TComponent);
    function FindInstance(const IID: TGUID; out Obj): boolean;
    function HasInstance(const IID: TGUID): boolean;
  protected
    procedure EnsureNotRegistered(const IID: TGUID);
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

  TGui = class(TInterfaceRegistry, IAttracsGui)
  private
    procedure RegisterForm(const IID: TGUID; aClass: TComponentClass); overload;
    procedure RegisterForm(const IID: TGUID; aComponent: TComponent); overload;
  end;

var
  _UnitFinalized: boolean;

function Gui: IAttracsGui;
begin
  if not Assigned(TInterfaceRegistry._Instance) then
  begin
    if _UnitFinalized then
      Raise Exception.Create('Attempt to access Gui after finalization.')
    else
      TInterfaceRegistry._Instance := TGui.Create(Application);
  end;
  result := TInterfaceRegistry._Instance as IAttracsGui;
end;

procedure TGui.RegisterForm(const IID: TGUID; aClass: TComponentClass);
begin
  RegisterClass(IID, aClass);
end;

procedure TGui.RegisterForm(const IID: TGUID; aComponent: TComponent);
begin
  RegisterInstance(IID, aComponent);
end;

{ TGui }

procedure TInterfaceRegistry.AfterConstruction;
begin
  inherited;
end;

procedure TInterfaceRegistry.Notification(AComponent: TComponent; Operation: TOperation);
var
  i: integer;
begin
  inherited;
  if (Operation = opRemove) and (AComponent <> nil) then
    for I := Length(fInstances) - 1 downto 0 do
      if fInstances[i].InstanceAsComponent = AComponent then
      begin
        DeleteItem(fInstances, i);
      end;
end;

type TComponentAccess = class(TComponent);

function TInterfaceRegistry.FindInstance(const IID: TGUID; out Obj): boolean;
var
  i: integer;
begin
  for I := 0 to length(fInstances) - 1 do
    if IsEqualGUID(fInstances[i].IID, IId) then
    begin
      if TComponentAccess(fInstances[i].InstanceAsComponent).QueryInterface(IID, Obj) <> S_OK then
        raise Exception.Create('Instance registered for specified interface does not implement it!.');
      result := true;
      exit;
    end;
  result := false;
end;

function TInterfaceRegistry.HasInstance(const IID: TGUID): boolean;
var
  vDummy: IInterface;
begin
  result := FindInstance(IID, vDummy)
end;

function TInterfaceRegistry.FindClass(const IID: TGUID): TComponentClass;
var
  i: integer;
begin
  for I := 0 to length(fClasses) - 1 do
    if IsEqualGUID(fClasses[i].IID, IId) then
    begin
      result := fClasses[i].ComponentClass;
      exit;
    end;
  result := nil;
end;


function TInterfaceRegistry.QueryInterface(const IID: TGUID; out Obj): HResult;
var
  vComponentClass: TComponentClass;
begin
  if _UnitFinalized then
    raise Exception.Create(ClassName + 'TInterfaceRegistry.QueryInterface: Unit AttracsGUI already finalized.');
  // first see if there is an existing instance registered for specified interface
  if FindInstance(IID, Obj) then
  begin
    result := S_OK;
    exit;
  end;
  vComponentClass := FindClass(IID);
  if Assigned(vComponentClass) then
  begin
    // see if there is class registered for specified interface, if so create an instance
    InternalRegisterInstance(IID, vComponentClass.Create(Application), Obj);
    result := S_OK;
    exit;
  end;
  result := inherited QueryInterface(IID, Obj);
end;

procedure TInterfaceRegistry.RegisterClass(const IID: TGUID; aClass: TComponentClass);
var
  i: integer;
  vComponentClass: TComponentClass;
begin
  if aClass.GetInterfaceEntry(IID) = nil then
    raise Exception.Create(ClassName + '.RegisterClass: ' + aClass.ClassName + ' does not implement the specified interface.');

  EnsureNotRegistered(IID);

  vComponentClass := FindClass(IID);
  if Assigned(vComponentClass) then
    raise Exception.Create('Another class ' + vComponentClass.ClassName + ' already registered for specified interface.');

  i := Length(fClasses);
  SetLength(fClasses, i+1);
  fClasses[i].IID := IID;
  fClasses[i].ComponentClass := aClass;
end;

procedure TInterfaceRegistry.RegisterInstance(const IID: TGUID; aComponent: TComponent);
var
  vDummy: IInterface;
begin
  EnsureNotRegistered(IID);
  InternalRegisterInstance(IID, aComponent, vDummy);
end;

procedure TInterfaceRegistry.BeforeDestruction;
begin
  _Instance := nil;
  SetLength(fClasses, 0);
  SetLength(fInstances, 0);
  inherited;
end;

procedure TInterfaceRegistry.EnsureNotRegistered(const IID: TGUID);
var
  vComponent: TComponent;
begin
  if FindInstance(IID, vComponent) then
    raise Exception.Create('Another class ' + vComponent.ClassName + ' already registered for specified interface.');
end;

procedure TInterfaceRegistry.InternalRegisterInstance(const IID: TGUID; aComponent: TComponent; out Obj);
var
  i: integer;
begin
  aComponent.FreeNotification(self);
  if aComponent.GetInterface(IID, Obj) then
  begin
    i := Length(fInstances);
    SetLength(fInstances, i+1);
    fInstances[i].IID := IID;
    fInstances[i].InstanceAsComponent := aComponent;
  end
  else
    raise Exception.Create(AComponent.ClassName + ' does not implement specified interface');
end;

end.
