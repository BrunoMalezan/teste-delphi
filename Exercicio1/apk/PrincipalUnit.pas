unit PrincipalUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, PrincipalController;

type
  TFrmPrincipal = class(TForm)
    pnlVisor: TPanel;
    lblConta: TLabel;
    lblResultado: TLabel;
    lblOperacao: TLabel;
    pnlBody: TPanel;
    btnUm: TButton;
    btnDois: TButton;
    btntres: TButton;
    btnSom: TButton;
    btnQuatro: TButton;
    btnCinco: TButton;
    btnSeis: TButton;
    btnSub: TButton;
    btnSete: TButton;
    btnOito: TButton;
    btnNove: TButton;
    btnMult: TButton;
    btnZero: TButton;
    btnIgual: TButton;
    btnDiv: TButton;
    btnDel: TButton;
    btnDot: TButton;
    btnImpostA: TButton;
    btnImpostB: TButton;
    btnImpostC: TButton;
    procedure NumberClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnMultClick(Sender: TObject);
    procedure btnSomClick(Sender: TObject);
    procedure btnSubClick(Sender: TObject);
    procedure btnDivClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnIgualClick(Sender: TObject);
    procedure btnDotClick(Sender: TObject);
    procedure btnImpostAClick(Sender: TObject);
    procedure btnImpostBClick(Sender: TObject);
    procedure btnImpostCClick(Sender: TObject);
  private
    { Private declarations }
    FController: TPrincipalController;
    FIsImposto: Boolean;
  public
    { Public declarations }
    procedure OrganizaVisor;
    procedure DesbloqueiaVirgula;
    procedure AuxiliaOperadores(value: Char);
    procedure AuxiliaNumeros(value: String);
    procedure Limpar;
    procedure AtivaOperadores;
    procedure BloqueiaOperadores;
    procedure auxiliaImpostos;

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FController := TPrincipalController.create;

end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  FController.Free;

end;

procedure TFrmPrincipal.Limpar;
begin
  FController.LimpaTudo;

end;

procedure TFrmPrincipal.btnDelClick(Sender: TObject);
begin
  if (FIsImposto) then
  begin
    AtivaOperadores;
    FIsImposto := False;;
    btnIgual.Enabled := True;
    btnDot.Enabled := True;
    FController.LimpaTudo;

  end;

  if not(lblResultado.Caption = '0') then
  begin
    lblResultado.Caption := '0';
    FController.PassaValue(StrToFloat(lblResultado.Caption));
    DesbloqueiaVirgula;
    FController.LimpaValor;

  end
  else if not(lblResultado.Caption = '') and (lblConta.Caption = '') and
    (lblOperacao.Caption = '0') then
  begin
    Limpar;

  end;

end;

procedure TFrmPrincipal.btnIgualClick(Sender: TObject);
begin
  AtivaOperadores;
  if not(lblConta.Caption = '') and not(lblResultado.Caption = '') then
  begin
    FController.PassaValue(StrToFloat(lblResultado.Caption));
    FController.GuardaComoSegundoValor;
    FController.PassaValores;
    FController.PassaValueAntesResult;
    lblResultado.Caption := FloatToStr(FController.RecebeResultado);
    lblConta.Caption := '';
    lblOperacao.Caption := '';

  end
  else if (lblConta.Caption = '') and not(lblResultado.Caption = '') then
  begin
    FController.PassaValue(StrToFloat(lblResultado.Caption));
    FController.PassaValores;
    FController.PassaValueAntesResult;
    lblResultado.Caption := FloatToStr(FController.RecebeResultado);

  end;

end;

procedure TFrmPrincipal.btnImpostAClick(Sender: TObject);
begin
  lblResultado.Caption :=
    FloatToStr(FController.ImpostoA(StrToFloat(lblResultado.Caption)));
    auxiliaImpostos;

end;

procedure TFrmPrincipal.btnImpostBClick(Sender: TObject);
begin
  lblResultado.Caption :=
    FloatToStr(FController.ImpostoB(StrToFloat(lblResultado.Caption)));
    auxiliaImpostos;

end;

procedure TFrmPrincipal.btnImpostCClick(Sender: TObject);
begin
  lblResultado.Caption :=
    FloatToStr(FController.ImpostoC(StrToFloat(lblResultado.Caption)));
    auxiliaImpostos;

end;

procedure TFrmPrincipal.btnDotClick(Sender: TObject);
begin

  btnDot.Enabled := False;

  if (FController.VerificaVirgula(btnDot.Enabled)) then
  begin
    lblOperacao.Caption := ',';

  end;

end;

procedure TFrmPrincipal.AtivaOperadores;
begin
  btnSom.Enabled := True;
  btnSub.Enabled := True;
  btnMult.Enabled := True;
  btnDiv.Enabled := True;

end;

procedure TFrmPrincipal.auxiliaImpostos;
begin
    FIsImposto := True;
    BloqueiaOperadores;
    btnDot.Enabled := False;
    btnIgual.Enabled := False;
end;

procedure TFrmPrincipal.AuxiliaNumeros(value: String);
begin
  if (lblResultado.Caption = '0') then
  begin
    if (FController.VerificaVirgula(btnDot.Enabled)) and
      (lblOperacao.Caption = ',') then
    begin
      lblResultado.Caption := lblResultado.Caption + ',' + value;
      lblOperacao.Caption := '';

    end
    else
    begin
      lblResultado.Caption := value;

    end;

  end
  else if not(lblResultado.Caption = '') and (lblConta.Caption = '') then
  begin
    if (FController.VerificaVirgula(btnDot.Enabled)) and
      (lblOperacao.Caption = ',') then
    begin
      lblResultado.Caption := lblResultado.Caption + ',';
      lblOperacao.Caption := '';

    end;
    lblResultado.Caption := lblResultado.Caption + value;

  end
  else
  begin
    if not(lblConta.Caption = '') then
    begin
      if not(lblOperacao.Caption = '') and not(lblOperacao.Caption = ',') then
      begin
        lblResultado.Caption := '';
        lblOperacao.Caption := '';
        if (lblOperacao.Caption = '') then
        begin
          btnDot.Enabled := True;

        end;

      end;
      if (FController.VerificaVirgula(btnDot.Enabled)) and
        (lblOperacao.Caption = ',') then
      begin
        lblResultado.Caption := lblResultado.Caption + ',';
        lblOperacao.Caption := '';

      end;
      lblResultado.Caption := lblResultado.Caption + value;

    end;

  end;

end;

procedure TFrmPrincipal.AuxiliaOperadores(value: Char);
begin
  if not(btnDot.Enabled) then
  begin
    DesbloqueiaVirgula;
  end;
  FController.PassaValueAnterior;
  FController.PassaValue(StrToFloat(lblResultado.Caption));
  FController.PassaOperacao(value);
  if (value = '*') then
  begin
    lblOperacao.Caption := 'x';
  end
  else
  begin
    lblOperacao.Caption := value;
  end;
  OrganizaVisor;
  if not(lblResultado.Caption = '0') then
  begin
    BloqueiaOperadores;

  end;
  FController.LimpaValor;
  FController.LimpaValorAntesResultado;
  if (btnSom.Enabled = False) then
  begin
    btnDot.Enabled := False;

  end;

end;

procedure TFrmPrincipal.BloqueiaOperadores;
begin
  btnSom.Enabled := False;
  btnSub.Enabled := False;
  btnMult.Enabled := False;
  btnDiv.Enabled := False;

end;

procedure TFrmPrincipal.btnDivClick(Sender: TObject);
begin
  AuxiliaOperadores('/');

end;

procedure TFrmPrincipal.btnMultClick(Sender: TObject);
begin
  AuxiliaOperadores('*');

end;

procedure TFrmPrincipal.btnSomClick(Sender: TObject);
begin
  AuxiliaOperadores('+');

end;

procedure TFrmPrincipal.btnSubClick(Sender: TObject);
begin
  AuxiliaOperadores('-');

end;

procedure TFrmPrincipal.DesbloqueiaVirgula;
begin
  if (FController.VerificaVirgula(btnDot.Enabled)) then
  begin
    if not(lblConta.Caption = lblResultado.Caption) then
    begin
      btnDot.Enabled := True;

    end
    else
    begin
      btnDot.Enabled := False;

    end;

  end;

end;

procedure TFrmPrincipal.NumberClick(Sender: TObject);
begin
  AuxiliaNumeros(TButton(Sender).Caption);
  FController.PassaValue(StrToFloat(lblResultado.Caption));
  FController.GuardaComoSegundoValor;

end;

procedure TFrmPrincipal.OrganizaVisor;
begin
  if (lblOperacao.Caption = '') then
  begin
    if not(lblResultado.Caption = '0') then
    begin
      lblConta.Caption := lblResultado.Caption + ' ' + lblOperacao.Caption;

    end;

  end
  else
  begin
    if not(lblResultado.Caption = '0') then
    begin
      lblConta.Caption := lblConta.Caption + ' ' + lblResultado.Caption + ' ' +
        lblOperacao.Caption;

    end;

  end;

end;

end.
