unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, IdCookieManager, RegularExpressions;

type
  TForm1 = class(TForm)
    IdHTTP: TIdHTTP;
    DownloadButton: TButton;
    AlbumHTTPAdress: TEdit;
    FoundenPics: TListBox;
    Label1: TLabel;
    IdCookieManager: TIdCookieManager;
    SaveFolder: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    CencelButton: TButton;
    procedure DownloadButtonClick(Sender: TObject);
    procedure CencelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AlbumHTTPAdressEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

TLoopThread = class(TThread)
    private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

var
  Form1: TForm1;
  LoopThread: TLoopThread;
  RegEx, RegEx2: TRegEx;

implementation

{$R *.dfm}



procedure TForm1.AlbumHTTPAdressEnter(Sender: TObject);
begin
  if AlbumHTTPAdress.SelText<>AlbumHTTPAdress.Text then AlbumHTTPAdress.SelectAll;
end;

procedure TForm1.CencelButtonClick(Sender: TObject);
begin
  if not LoopThread.Terminated then
    if MessageDlg('Currently in progress. Are you want terminate downloading files?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
    begin
      LoopThread.Terminate;
    end;
end;

procedure TForm1.DownloadButtonClick(Sender: TObject);
var
  FS:TFileStream;
  s: string;
begin
  FoundenPics.Clear;

  RegEx:=TRegEx.Create('http:\/\/[a-z][0-9].imgchili.net\/[0-9]*\/\w*.jpg');
  RegEx2:=TRegEx.Create('\w*.jpg');

  if FileExists('data.tmp') then DeleteFile('data.tmp');
  FS:=TFileStream.Create('data.tmp', fmCreate);
  IdHTTP.ConnectTimeout:=1000;
  IdHTTP.Get(AlbumHTTPAdress.Text,FS);
  FS.Free;

  if not DirectoryExists(SaveFolder.Text) then
    CreateDir(SaveFolder.Text);
  s:=SaveFolder.Text;
  if s[Length(s)]<>'\' then
  begin
    Insert('\', s, Length(s)+1);
    SaveFolder.Text:=s;
  end;

  LoopThread:=TLoopThread.Create(False);
  LoopThread.Priority:=tpNormal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LoopThread.Free;
end;

procedure TLoopThread.Execute;
var
  i:Integer;
  s2, sLine, ImgName:string;
  F: TextFile;
  FS:  TFileStream;
  LoopBreaked: Boolean;
begin
  Form1.CencelButton.Enabled:=True;
  if FileExists('data.tmp') then
  begin
    Assign(F, 'data.tmp');
    Reset(f);
    LoopBreaked:=False;
    while not Eof(f) do
    if not Terminated then
    begin
      Readln(f, sLine);
      if RegEx.IsMatch(sLine) then
      begin
        sLine:=RegEx.Match(sLine).Value;
        sLine[8]:='i';
        Form1.FoundenPics.Items.Add(sLine);
        Form1.Label1.Caption:='Founded '+IntToStr(Form1.FoundenPics.Count)+' pictures!';
        Form1.Refresh;
        ImgName:=RegEx2.Match(sLine).Value;
        if not FileExists(Form1.SaveFolder.Text+ImgName) then
        begin
          try
            FS:=TFileStream.Create(Form1.SaveFolder.Text+ImgName,fmCreate);
            Form1.IdHTTP.Get(sLine,FS);
          except
            FS.Free;
          end;
        end;
      end;
    end else
    begin
      LoopBreaked:=True;
      Break;
    end;
  end;
  LoopThread.Terminate;
  if LoopBreaked=False then
    MessageDlg('All images downloaded', mtInformation, [mbOK], 0);
  CloseFile(F);
  Form1.CencelButton.Enabled:=False;
end;
end.
