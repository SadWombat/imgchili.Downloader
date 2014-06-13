program imgchiliDownloader;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  FolderDialogUnit in 'FolderDialogUnit.pas' {FolderDialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'imgchili.Downloader';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFolderDialog, FolderDialog);
  Application.Run;
end.
