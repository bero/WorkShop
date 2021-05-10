program XML_JSON;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  EBookingInterfaces in 'EBookingInterfaces.pas',
  ReadXML in 'ReadXML.pas',
  ReadJSON in 'ReadJSON.pas',
  EBooking in 'EBooking.pas';

var
  EbookingLogic: TEBooking;
begin
  ReportMemoryLeaksOnShutdown := True;
  IsConsole:= False;
  try
    if ParamCount < 1 then
    begin
      Writeln('XML_JSON /XML /JSON');
      Exit;
    end;

    if FindCmdLineSwitch('XML') then
    begin
      EbookingLogic := TEBooking.Create(TReadXML.Create('test.xml'));
      try
        Writeln(EbookingLogic.GetRole);
      finally
        EbookingLogic.Free;
      end;
    end;

    if FindCmdLineSwitch('JSON') then
    begin
      EbookingLogic := TEBooking.Create(TReadJSON.Create('{ "Role":"Attracs"}'));
      try
        Writeln(EbookingLogic.GetRole);
      finally
        EbookingLogic.Free;
      end;
    end;
    WriteLn('Press <ENTER> to exit');
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
