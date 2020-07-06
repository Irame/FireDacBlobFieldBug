program MinimalFDTest;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {MainFrom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainFrom, MainFrom);
  Application.Run;
end.
