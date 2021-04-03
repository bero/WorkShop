unit EcoNet;

interface

uses
  Interfaces;

type
  TEcoNet = class(TInterfacedObject, IInvoiceExporter)
  public
    procedure ExportInvoice;
  end;

implementation

procedure TEcoNet.ExportInvoice;
begin
  WriteLn('Exporting EcoNet');
end;

end.
