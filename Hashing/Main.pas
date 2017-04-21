unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    txtValue: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    txtHash: TEdit;
    Label3: TLabel;
    txtJenkins: TEdit;
    Label4: TLabel;
    txtMD5: TEdit;
    Label5: TLabel;
    txtSHA1: TEdit;
    txtSHA2: TEdit;
    Label6: TLabel;
    procedure txtValueChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  System.Hash;

procedure TForm2.txtValueChange(Sender: TObject);
begin
  txtHash.Text := THash.DigestAsString(TBytes(txtValue.Text));
  txtJenkins.Text := THashBobJenkins.GetHashString(txtValue.Text);
  txtMD5.Text := THashMD5.GetHashString(txtValue.Text);
  txtSHA1.Text := THashSHA1.GetHashString(txtValue.Text);
  txtSHA2.Text := THashSHA2.GetHashString(txtValue.Text);
end;

end.
