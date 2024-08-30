program Ascii_to_BrainF_Converter;

uses
  Vcl.Forms,
  Main in 'Main.pas' {BFForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TBFForm, BFForm);
  Application.Run;
end.
