unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Timer1: TTimer;
    lblCurrentTime: TLabel;
    Edit1: TEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    procedure UpdateTime;
  public
    procedure AfterConstruction; override;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  System.SysUtils;

procedure TForm2.AfterConstruction;
begin
  Edit1.Text := '1000';
  UpdateTime;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
  Timer1.Interval := StrToInt(Edit1.Text);
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  UpdateTime;
end;

procedure TForm2.UpdateTime;
var
  vCurrentTime: TDateTime;
begin
  vCurrentTime := Now;
  lblCurrentTime.Caption := FormatdateTime('dd.mm.yyyy hh:nn:ss zzz', vCurrentTime);
end;

end.
