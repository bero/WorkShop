unit ReadXML;

// Read XML
// Not aware of logic

interface

uses
  Classes,
  SysUtils,
  XMLDoc,
  XMLIntf,
  EBookingInterfaces;

type
  TReadXML = class(TInterfacedObject, IEbooking)
  private
    fXML: TStringList;
    procedure LoadXML(const aXMLfile: string);
  public
    constructor Create(const aXMLfile: string);
    destructor Destroy; override;
    function GetRole: String;
  end;

implementation

constructor TReadXML.Create(const aXMLfile: string);
begin
  inherited Create;
  LoadXML(aXMLfile);
end;

destructor TReadXML.Destroy;
begin
  fXML.Free;
end;

function TReadXML.GetRole: String;
begin
  Result := fXML.Text;
end;

procedure TReadXML.LoadXML(const aXMLfile: string);
begin
  fXML := TStringList.Create;
  fXML.LoadFromFile(aXMLfile);
end;

end.
