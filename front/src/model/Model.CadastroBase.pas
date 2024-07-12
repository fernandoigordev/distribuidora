unit Model.CadastroBase;

interface

uses
  Datasnap.DBClient, Data.DB, Repository.CadastroBase;

type

TTipoOperacao = (toInserir, toAtualizar);

TModelCadastroBase = class
private
  FRepositoryCadastroBase: TRepositoryCadastroBase;
  FTipoOperacao: TTipoOperacao;
protected
  function ValidarCadastro: Boolean;virtual;
public
  procedure Salvar;
  procedure Deletar;

  Constructor Create(ARepository: TRepositoryCadastroBase);

  property TipoOperacao: TTipoOperacao read FTipoOperacao write FTipoOperacao;
end;

implementation

uses
  System.SysUtils;

{ TModelCadastroBase }

constructor TModelCadastroBase.Create(ARepository: TRepositoryCadastroBase);
begin
  FRepositoryCadastroBase := ARepository;
end;

procedure TModelCadastroBase.Deletar;
begin
  FRepositoryCadastroBase.Deletar;
end;

procedure TModelCadastroBase.Salvar;
begin
  case FTipoOperacao of
    toInserir: FRepositoryCadastroBase.Inserir;
    toAtualizar: FRepositoryCadastroBase.Atualizar;
  end;
end;

function TModelCadastroBase.ValidarCadastro: Boolean;
begin
  Result := True;
end;

end.
