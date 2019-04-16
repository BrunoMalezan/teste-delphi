program Calculadora;

uses
  Vcl.Forms,
  PrincipalUnit in 'apk\PrincipalUnit.pas' {FrmPrincipal},
  PrincipalController in 'controller\PrincipalController.pas',
  CalculadoraObject in 'model\CalculadoraObject.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
