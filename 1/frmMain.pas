unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMain = class(TForm)
    btnOpenGeneral: TButton;
    btnOpenA: TButton;
    btnOpenB: TButton;
    procedure btnOpenAClick(Sender: TObject);
    procedure btnOpenGeneralClick(Sender: TObject);
    procedure btnOpenBClick(Sender: TObject);
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

uses
  frmDialog,
  frmdialogA,
  frmDialogB;

procedure TMain.btnOpenGeneralClick(Sender: TObject);
begin
  TDialogForm.Create(nil).Show;
end;

procedure TMain.btnOpenAClick(Sender: TObject);
begin
  TDialogAForm.Execute(self, 'Hi A!');
end;

procedure TMain.btnOpenBClick(Sender: TObject);
begin
  TDialogBForm.Execute(self, 'Hi B!');
end;

end.
