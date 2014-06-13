unit FolderDialogUnit;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.FileCtrl;

type
  TFolderDialog = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    DirectoryListBox: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FolderDialog: TFolderDialog;

implementation

{$R *.dfm}

uses main;

procedure TFolderDialog.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFolderDialog.DriveComboBox1Change(Sender: TObject);
begin
  DirectoryListBox.Drive:=DriveComboBox1.Drive;
end;

procedure TFolderDialog.OKBtnClick(Sender: TObject);
begin
  Form1.SaveFolder.Text:=DirectoryListBox.Directory;
  Close;
end;

end.
