unit frmDialogB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmAbstractDialog, StdCtrls;

type
  TDialogBForm = class(TAbstractDialog)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  public
    class procedure Execute(aParent: TForm; aMsg: string);
  end;

implementation

{$R *.dfm}

uses
  frmMain, frmDialog;

class procedure TDialogBForm.Execute(aParent: TForm; aMsg: string);
var
  aForm: TDialogBForm;
begin
  aForm := TDialogBForm.Create(nil);
  if aParent is TMain then
    aForm.MemSomeText.Text := 'Called from Main ' + #10#13 + aMsg
  else if aParent is TDialogForm then
    aForm.MemSomeText.Text := 'Called from Dialog ' + #10#13 + aMsg;

  aForm.Show;
end;

procedure TDialogBForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
