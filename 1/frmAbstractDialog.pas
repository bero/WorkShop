unit frmAbstractDialog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAbstractDialog = class(TForm)
    memSomeText: TMemo;
  protected
    function GetMemoText: string; virtual;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TAbstractDialog }

function TAbstractDialog.GetMemoText: string;
begin

end;

end.
