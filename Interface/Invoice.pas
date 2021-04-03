unit Invoice;

interface

uses
  interfaces;

type
  TInvoice = class
  public
    procedure ExportInvoice(aExporter: IInvoiceExporter);
  end;

procedure MakeInvoice;

implementation

uses
  EcoNet,
  Finvoice,
  Visma;

procedure MakeInvoice;
var
  vInvoice: TInvoice;
  vFinvoice: TFInvoice;
  vEcoNet: TEcoNet;
  vVisma: TVisma;
begin
  vInvoice := TInvoice.Create;
  vFinvoice := TFInvoice.Create;
  vEcoNet := TEcoNet.Create;
  vVisma := TVisma.Create;
  try
    vInvoice.ExportInvoice(vFinvoice);
    vInvoice.ExportInvoice(vEcoNet);
    vInvoice.ExportInvoice(vVisma);
  finally
    vInvoice.Free;
  end;
end;

{ TInvoice }

procedure TInvoice.ExportInvoice(aExporter: IInvoiceExporter);
begin
  aExporter.ExportInvoice;
end;

end.
