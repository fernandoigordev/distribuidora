unit Controller.CadastroBase;

interface

uses
  Data.DB, Datasnap.DBClient, Model.CadastroBase, System.Classes;

type
TControllerCadastroBase = class
private
  { private declarations }
  FClientDataSet: TClientDataSet;
  FModelCadastroBase: TModelCadastroBase;
protected
  { protected declarations }
  function GetModelCadastro: TModelCadastroBase;virtual;abstract;
  procedure ConfigurarFields;virtual;abstract;
  procedure PopularModel;virtual;abstract;

  property ClientDataSet: TClientDataSet read FClientDataSet;
  property ModelCadastroBase: TModelCadastroBase read FModelCadastroBase write FModelCadastroBase;
public
  procedure Salvar;
  procedure Editar;
  procedure Deletar;
  procedure Inserir;
  procedure Pesquisar(APesquisa: String);
  procedure SetClientDataSet(ADataSourceCadastro: TDataSource);

  Constructor Create;
  Destructor Destroy;override;
end;

implementation

{ TControllerCadastroBase }

constructor TControllerCadastroBase.Create;
begin
  FClientDataSet := TClientDataSet.Create(nil);
  ConfigurarFields;
  FModelCadastroBase := GetModelCadastro;
end;

procedure TControllerCadastroBase.Deletar;
begin
  PopularModel;
  FModelCadastroBase.Deletar;
  ClientDataSet.Delete;
end;

destructor TControllerCadastroBase.Destroy;
begin
  FClientDataSet.Free;
  FModelCadastroBase.Free;
  inherited;
end;

procedure TControllerCadastroBase.Editar;
begin
  ClientDataSet.Edit;
  FModelCadastroBase.TipoOperacao := toAtualizar;
end;

procedure TControllerCadastroBase.Inserir;
begin
  ClientDataSet.Insert;
  FModelCadastroBase.TipoOperacao := toInserir;
end;

procedure TControllerCadastroBase.Pesquisar(APesquisa: String);
begin
  {Busca os dados}
  {Atualiza o CDS}
end;

procedure TControllerCadastroBase.Salvar;
begin
  ClientDataSet.Post;
  PopularModel;
  FModelCadastroBase.Salvar;
end;

procedure TControllerCadastroBase.SetClientDataSet(
  ADataSourceCadastro: TDataSource);
begin
  ADataSourceCadastro.DataSet := FClientDataSet;
end;

end.
