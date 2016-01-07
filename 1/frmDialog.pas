unit frmDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormDlg = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    btnHi: TButton;
    procedure btnHiClick(Sender: TObject);
  private
    fSomeThing: String;
  public
    class procedure Execute(aSomeThing: string);
  end;

implementation

{$R *.dfm}

procedure TFormDlg.btnHiClick(Sender: TObject);
begin
  ShowMessage(fSomeThing);
end;

class procedure TFormDlg.Execute(aSomeThing: string);
var
  aForm: TFormDlg;
begin
  aForm := TFormDlg.Create(nil);
  try
    aForm.fSomeThing := aSomeThing;
    aForm.ShowModal;
  finally
    aForm.Free;
  end;
end;

end.
