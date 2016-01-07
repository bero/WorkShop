unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMain = class(TForm)
    btnOpen: TButton;
    procedure btnOpenClick(Sender: TObject);
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses
  frmDialog;

procedure TMain.btnOpenClick(Sender: TObject);
begin
  TFormDlg.Execute('Hi!');
end;

end.
