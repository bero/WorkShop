unit ReadJSON;

// Read JSON
// Not aware of logic

interface

uses
  EBookingInterfaces;

type
  TReadJSON = class(TInterfacedObject, IEbooking)
  private
    fJSON: string;
  public
    constructor Create(const aJSON: string);
    function GetRole: String;
  end;

implementation

{ TReadJSON }

constructor TReadJSON.Create(const aJSON: string);
begin
  fJSON :=aJSON;
end;

function TReadJSON.GetRole: String;
begin
  Result := fJSON;
end;

end.
