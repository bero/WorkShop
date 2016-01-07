unit frmDialogA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frmAbstractDialog, StdCtrls;

type
  TDialogAForm = class(TAbstractDialog)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  public
    class procedure Execute(aParent: TForm; aMsg: string);
  end;

implementation

uses
  frmMain, frmDialog;

{$R *.dfm}

{ TDialogAForm }

procedure TDialogAForm.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TDialogAForm.btnOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

class procedure TDialogAForm.Execute(aParent: TForm; aMsg: string);
var
  aForm: TDialogAForm;
begin
  aForm := TDialogAForm.Create(nil);
  if aParent is TMain then
    aForm.MemSomeText.Text := 'Called from Main ' + #10#13 + aMsg
  else if aParent is TDialogForm then
    aForm.MemSomeText.Text := 'Called from Dialog ' + #10#13 + aMsg;

  aForm.Show;
end;

procedure TDialogAForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
