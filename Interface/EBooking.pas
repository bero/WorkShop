unit EBooking;

// Logic
// Not aware of XML or JSON

interface

uses
  EBookingInterfaces;

type
  TEBooking = class
  private
    fEbooking: IEBooking;
  public
    constructor Create(aInterface: IEbooking);
    destructor Destroy; override;
    function GetRole: String;
  end;

implementation

constructor TEBooking.Create(aInterface: IEbooking);
begin
  inherited Create;
  fEbooking := aInterface;
end;

destructor TEBooking.Destroy;
begin
  inherited;
end;

function TEBooking.GetRole: String;
begin
  Result := fEbooking.GetRole;
end;

end.
