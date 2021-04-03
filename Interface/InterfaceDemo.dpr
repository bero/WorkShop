program InterfaceDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Invoice in 'Invoice.pas',
  Interfaces in 'Interfaces.pas',
  Finvoice in 'Finvoice.pas',
  EcoNet in 'EcoNet.pas',
  Visma in 'Visma.pas';

begin
  try
    MakeInvoice;
    WriteLn('Press Enter');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
