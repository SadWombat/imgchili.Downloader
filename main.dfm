object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'imgchili.Downloader'
  ClientHeight = 324
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 79
    Width = 87
    Height = 13
    Caption = 'Founded Pictures:'
  end
  object Label2: TLabel
    Left = 8
    Top = 11
    Width = 63
    Height = 13
    Caption = 'Album odres:'
  end
  object Label3: TLabel
    Left = 8
    Top = 47
    Width = 89
    Height = 13
    Caption = 'Destination folder:'
  end
  object DownloadButton: TButton
    Left = 406
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Download'
    TabOrder = 4
    OnClick = DownloadButtonClick
  end
  object AlbumHTTPAdress: TEdit
    Left = 103
    Top = 8
    Width = 378
    Height = 21
    TabOrder = 0
    OnClick = AlbumHTTPAdressClick
    OnKeyPress = AlbumHTTPAdressKeyPress
  end
  object FoundenPics: TListBox
    Left = 8
    Top = 98
    Width = 472
    Height = 187
    ItemHeight = 13
    TabOrder = 2
  end
  object SaveFolder: TEdit
    Left = 103
    Top = 44
    Width = 297
    Height = 21
    TabOrder = 1
    Text = 'D:\Downloads\imgchili.net\'
    OnKeyPress = AlbumHTTPAdressKeyPress
  end
  object CencelButton: TButton
    Left = 325
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Cencel'
    Enabled = False
    TabOrder = 3
    OnClick = CencelButtonClick
  end
  object Button1: TButton
    Left = 406
    Top = 42
    Width = 75
    Height = 25
    Caption = 'Browse'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 244
    Top = 291
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = Button2Click
  end
  object IdHTTP: TIdHTTP
    AllowCookies = True
    HandleRedirects = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.Connection = 'keep-alive'
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 
      #39'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Fir' +
      'efox/12.0'#39
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    CookieManager = IdCookieManager
    Left = 24
    Top = 120
  end
  object IdCookieManager: TIdCookieManager
    Left = 96
    Top = 120
  end
end
