unit PrincipalController;

interface

uses
  CalculadoraObject, System.RegularExpressions;

type
  TPrincipalController = class
  private
    FObj: TCalculadoraObject;

  public
    constructor create;
    destructor destroy;

    procedure PassaOperacao(value: Char);
    procedure PassaValue(value: Double);
    procedure GuardaComoSegundoValor;
    procedure PassaValueAnterior;
    procedure PassaValueAntesResult;
    procedure PassaValores;
    procedure LimpaValorAntesResultado;
    procedure LimpaValor;
    procedure LimpaValor2;
    procedure LimpaValorSecundario;
    procedure LimpaResultado;
    procedure LimpaTudo;

    function RecebeResultado: Double;
    function VerificaVirgula(value: Boolean): Boolean;

    function ImpostoA(value: Double): Double;
    function ImpostoB(value: Double): Double;
    function ImpostoC(value: Double): Double;
    function Adicao(value1, value2, value3, valueresult: Double): Double;
    function Subtracao(value1, value2, value3, value4,
      valueresult: Double): Double;
    function Multiplicacao(value1, value2, value3, valueresult: Double): Double;
    function Divisao(value1, value2, value3, value4,
      valueresult: Double): Double;

  end;

implementation

{ TPrincipalController }

constructor TPrincipalController.create;
begin
  FObj := TCalculadoraObject.create;

end;

destructor TPrincipalController.destroy;
begin
  FObj.Free;

end;

function TPrincipalController.Adicao(value1, value2, value3,
  valueresult: Double): Double;
begin
  Result := (value1 + value2);

  if not(valueresult = 0) then
  begin
    Result := (valueresult + value3);

  end;

  if (value2 = 0) and (valueresult = 0) then
  begin
    Result := (valueresult + value3);

  end;

end;

function TPrincipalController.Divisao(value1, value2, value3, value4,
  valueresult: Double): Double;
begin
  try
    Result := (value1 / value2);

    if (value2 <= value3) then
    begin
      Result := (value2 / value3);

    end;

    if not(valueresult = 0) then
    begin
      Result := (valueresult / value4);

    end;

  except
    Result := 0;
    LimpaTudo;

  end;

end;

procedure TPrincipalController.LimpaResultado;
begin
  FObj.Resultado := 0;

end;

procedure TPrincipalController.LimpaTudo;
begin
  PassaOperacao(' ');
  LimpaValorAntesResultado;
  LimpaValor;
  LimpaValor2;
  LimpaValorSecundario;
  LimpaResultado;

end;

procedure TPrincipalController.LimpaValor;
begin
  FObj.Valor := 0;

end;

procedure TPrincipalController.LimpaValor2;
begin
  FObj.ValorAnterior := 0;

end;

procedure TPrincipalController.LimpaValorAntesResultado;
begin
  FObj.ValorAntesResult := 0;

end;

procedure TPrincipalController.LimpaValorSecundario;
begin
  FObj.GuardaSegundoValor := 0;

end;

function TPrincipalController.Multiplicacao(value1, value2, value3,
  valueresult: Double): Double;
begin
  Result := (value1 * value2);

  if not(valueresult = 0) then
  begin
    Result := (valueresult * value3);

  end;

  if (value1 = 0) and (valueresult = 0) then
  begin
    Result := (value2 * value3);

  end;

end;

function TPrincipalController.Subtracao(value1, value2, value3, value4,
  valueresult: Double): Double;
begin
  Result := (value1 - value2);

  if (value2 <= value3) then
  begin
    Result := (value2 - value3);

  end;

  if not(valueresult = 0) then
  begin
    Result := (valueresult - value4);

  end;

  if (value2 = 0) and (value3 = 0) and (valueresult = 0) then
  begin
    Result := (valueresult - value4);

  end;

end;

function TPrincipalController.VerificaVirgula(value: Boolean): Boolean;
begin
  Result := False;
  if (value = False) then
  begin
    Result := True;

  end;

end;

procedure TPrincipalController.PassaOperacao(value: Char);
begin
  FObj.Operacao := value;

end;

procedure TPrincipalController.PassaValores;
begin
  case FObj.Operacao of
    '+':
      begin
        FObj.Resultado := Adicao(FObj.ValorAnterior, FObj.Valor,
          FObj.GuardaSegundoValor, FObj.Resultado);

      end;

    '-':
      begin
        FObj.Resultado := Subtracao(FObj.ValorAnterior, FObj.Valor,
          FObj.ValorAntesResult, FObj.GuardaSegundoValor, FObj.Resultado);

      end;

    '*':
      begin
        FObj.Resultado := Multiplicacao(FObj.ValorAnterior, FObj.Valor,
          FObj.GuardaSegundoValor, FObj.Resultado);

      end;

    '/':
      begin
        FObj.Resultado := Divisao(FObj.ValorAnterior, FObj.Valor,
          FObj.ValorAntesResult, FObj.GuardaSegundoValor, FObj.Resultado);

      end
  else
    begin
      FObj.Resultado := FObj.Valor;

    end;

  end;

end;

procedure TPrincipalController.GuardaComoSegundoValor;
begin
  FObj.GuardaSegundoValor := FObj.Valor;

end;

function TPrincipalController.ImpostoA(value: Double): Double;
begin
  Result := ((value * 0.20) - 500)

end;

function TPrincipalController.ImpostoB(value: Double): Double;
begin
  Result := ImpostoA(value) - 15;

end;

function TPrincipalController.ImpostoC(value: Double): Double;
begin
  Result := ImpostoA(value) + ImpostoB(value);

end;

procedure TPrincipalController.PassaValue(value: Double);
begin
  FObj.Valor := value;

end;

procedure TPrincipalController.PassaValueAnterior;
begin
  FObj.ValorAnterior := FObj.Valor;

end;

procedure TPrincipalController.PassaValueAntesResult;
begin
  FObj.ValorAntesResult := FObj.Resultado;

end;

function TPrincipalController.RecebeResultado: Double;
begin
  LimpaValor2;
  Result := FObj.Resultado;

end;

end.
