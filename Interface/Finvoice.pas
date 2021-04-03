unit Finvoice;

interface

uses
  Interfaces;

type
  TFInvoice = class(TInterfacedObject, IInvoiceExporter)
  public
    procedure ExportInvoice;
  end;

implementation

procedure TFInvoice.ExportInvoice;
begin
  WriteLn('Exporting Finvoice');
end;

end.
