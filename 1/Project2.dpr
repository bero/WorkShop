program Project2;

uses
  Forms,
  frmMain in 'frmMain.pas' {Main},
  frmDialog in 'frmDialog.pas' {FormDlg};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
