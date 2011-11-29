program Workplace;

uses
  Vcl.Forms,
  Main in 'Main.pas' {Form1},
  MyAObject in 'MyAObject.pas',
  MyTests in 'MyTests.pas',
  MyTypeObj in 'MyTypeObj.pas',
  MyUtils in 'MyUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
