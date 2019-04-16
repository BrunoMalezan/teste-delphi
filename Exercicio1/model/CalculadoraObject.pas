unit CalculadoraObject;

interface
type
  TCalculadoraObject = class
  private
    FValor: Double;
    FValorAnterior: Double;
    FOperacao: Char;
    FResultado: Double;
    FValorAntesResult: Double;
    FGuardaSegundoValor: Double;
    procedure SetValor(const Value: Double);
    procedure SetValorAnterior(const Value: Double);
    procedure SetOperacao(const Value: Char);
    procedure SetResultado(const Value: Double);
    procedure SetValorAntesResult(const Value: Double);
    procedure SetGuardaSegundoValor(const Value: Double);

  public
    property Operacao: Char read FOperacao write SetOperacao;
    property Valor: Double read FValor write SetValor;
    property ValorAnterior: Double read FValorAnterior write SetValorAnterior;
    property GuardaSegundoValor: Double read FGuardaSegundoValor write SetGuardaSegundoValor;
    property ValorAntesResult: Double read FValorAntesResult write SetValorAntesResult;
    property Resultado: Double read FResultado write SetResultado;

  end;

implementation

{ TCalculadoraObject }

procedure TCalculadoraObject.SetValorAnterior(const Value: Double);
begin
  FValorAnterior := Value;
end;

procedure TCalculadoraObject.SetValorAntesResult(const Value: Double);
begin
  FValorAntesResult := Value;
end;

procedure TCalculadoraObject.SetGuardaSegundoValor(const Value: Double);
begin
  FGuardaSegundoValor := Value;
end;

procedure TCalculadoraObject.SetOperacao(const Value: Char);
begin
  FOperacao := Value;
end;

procedure TCalculadoraObject.SetResultado(const Value: Double);
begin
  FResultado := Value;
end;

procedure TCalculadoraObject.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
