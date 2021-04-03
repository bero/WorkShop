unit Visma;

interface

uses
  Interfaces;

type
  TVisma = class(TInterfacedObject, IInvoiceExporter)
  public
    procedure ExportInvoice;
  end;

implementation

procedure TVisma.ExportInvoice;
begin
  WriteLn('Exporting Visma');
end;

end.
