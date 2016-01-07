inherited DialogAForm: TDialogAForm
  Caption = 'Dialog A'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited btnOk: TButton
    OnClick = btnOkClick
  end
  inherited btnCancel: TButton
    OnClick = btnCancelClick
  end
end
