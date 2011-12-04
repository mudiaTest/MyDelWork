program Workshop;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  MyAObject in 'MyAObject.pas',
  MyTests in 'MyTests.pas',
  MyUtils in 'MyUtils.pas',
  MyTypeObj in 'MyTypeObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
