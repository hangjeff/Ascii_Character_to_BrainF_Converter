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

function process(str: String): String;
var
  i, prev: Integer;
  output: String;
begin
  output := '';
  prev := 0;
  for i := 1 to Length(str) do
  begin
    if (Ord(str[i]) > -1) and (Ord(str[i]) < 256) then
    begin
      output := output + BF_Process(Ord(str[i]) - prev);
      prev := Ord(str[i]);
    end
    else
    begin
      ShowMessage(Format(
      'Error! The character in position %d is Not an Ascii Character!', [i]));
      Exit('');
    end;
  end;

    process := output;
end;

{$R *.dfm}
procedure TBFForm.btnCopyClick(Sender: TObject);
var
output: String;
begin
	output := process(Memo1.Text);
  if output <> '' then
  begin
    Clipboard.AsText := output;
    ShowMessage('The result has been copied to clipboard successfully!');
  end;
end;

procedure TBFForm.btnMdClick(Sender: TObject);
var
  output: String;
begin
  output := process(Memo1.Text);
  if output <> '' then
  begin
    Clipboard.AsText := '```brainfuck' + sLineBreak + process(Memo1.Text) + '```';
    ShowMessage('The result has been copied to clipboard successfully!');
  end;
end;
end.
