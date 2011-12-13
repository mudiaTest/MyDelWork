program Workshop;

uses
  Forms,
  MyUtils in 'MyUtils.pas',
  Main in 'Main.pas' {MainForm},
  MyAObject in 'MyAObject.pas',
  MyTests in 'MyTests.pas',
  MyTypeObj in 'MyTypeObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
