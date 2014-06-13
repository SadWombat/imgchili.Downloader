object FolderDialog: TFolderDialog
  Left = 227
  Top = 108
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 351
  ClientWidth = 302
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object OKBtn: TButton
    Left = 219
    Top = 319
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 138
    Top = 319
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object DirectoryListBox: TDirectoryListBox
    Left = 8
    Top = 33
    Width = 286
    Height = 280
    TabOrder = 2
  end
  object DriveComboBox1: TDriveComboBox
    Left = 8
    Top = 8
    Width = 286
    Height = 19
    TabOrder = 3
    OnChange = DriveComboBox1Change
  end
end
