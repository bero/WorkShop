program InterfaceDemo;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  FastMM4 in '..\..\Attracs-Common\components\core\FastMM4.pas',
  FastMM4Messages in '..\..\Attracs-Common\components\core\FastMM4Messages.pas',
  System.SysUtils,
  Invoice in 'Invoice.pas',
  Interfaces in 'Interfaces.pas',
  Finvoice in 'Finvoice.pas',
  EcoNet in 'EcoNet.pas',
  Visma in 'Visma.pas';

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    MakeInvoice;
    WriteLn('Press Enter');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
