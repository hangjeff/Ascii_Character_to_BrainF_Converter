unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, ClipBrd, BrainF;

type
  TBFForm = class(TForm)
    Memo1: TMemo;
    btnCopy: TButton;
    btnMd: TButton;
    procedure btnCopyClick(Sender: TObject);
    procedure btnMdClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BFForm: TBFForm;

implementation

{$R *.dfm}
procedure TBFForm.btnCopyClick(Sender: TObject);
var
  i, prev: Integer;
  flag:  boolean;
  output: String;
begin
  flag := true;
  output := '';
  prev := 0;
  for i := 1 to Length(Memo1.Text) do
  begin
    if (Ord(Memo1.Text[i]) > -1) and (Ord(Memo1.Text[i]) < 256) then
    begin
      output := output + BF_Process(Ord(Memo1.Text[i]) - prev);
      prev := Ord(Memo1.Text[i]);
    end
    else
    begin
      ShowMessage(Format(
      'Error! The character in position %d is Not an Ascii Character!', [i]));
      flag := false;
      break;
    end;
  end;

  if flag then
  begin
    Clipboard.AsText := output;
    ShowMessage('The result has been copied to clipboard successfully!');
  end;
end;

procedure TBFForm.btnMdClick(Sender: TObject);
var
  i, prev: Integer;
  flag: boolean;
  output: String;
begin
  flag := true;
  output := '```brainfuck' + sLineBreak;
  prev := 0;
  for i := 1 to Length(Memo1.Text) do
  begin
    if (Ord(Memo1.Text[i]) > -1) and (Ord(Memo1.Text[i]) < 256) then
    begin
      output := output + BF_Process(Ord(Memo1.Text[i]) - prev);
      prev := Ord(Memo1.Text[i]);
    end
    else
    begin
      ShowMessage(Format(
      'Error! The character in position %d is Not an Ascii Character!', [i]));
      flag := false;
      break;
    end;
  end;

  if flag then
  begin
      Clipboard.AsText := output + sLineBreak + '```';
      ShowMessage('The result has been copied to clipboard successfully!');
  end;
end;
end.
