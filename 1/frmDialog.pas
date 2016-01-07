unit frmDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TDialogForm = class(TForm)
    btnOpenA: TButton;
    btnOpenB: TButton;
    procedure btnOpenAClick(Sender: TObject);
    procedure btnOpenBClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  frmDialogB, frmDialogA;

{$R *.dfm}

procedure TDialogForm.btnOpenAClick(Sender: TObject);
begin
  TDialogAForm.Execute(self, 'Hi A!');
end;

procedure TDialogForm.btnOpenBClick(Sender: TObject);
begin
  TDialogAForm.Execute(self, 'Hi B!');
end;

end.
