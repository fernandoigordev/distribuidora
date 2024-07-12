unit Controller.Page.Sessao;

interface
uses Controller.CadastroBase, Model.CadastroBase;

type
TControllerSessao = class(TControllerCadastroBase)
private
  { private declarations }
protected
  { protected declarations }
  function GetModelCadastro: TModelCadastroBase;override;
  procedure ConfigurarFields;override;
  procedure PopularModel;override;
public
  { public declarations }
end;

implementation

uses
  Data.DB, Model.Page.Sessao;

{ TControllerSessao }

procedure TControllerSessao.ConfigurarFields;
begin
  inherited;
  ClientDataSet.Close;
  ClientDataSet.FieldDefs.Clear;
  ClientDataSet.FieldDefs.Add('Id', ftInteger);
  ClientDataSet.FieldDefs.Add('Descricao', ftString, 200);
  ClientDataSet.CreateDataSet;
end;

function TControllerSessao.GetModelCadastro: TModelCadastroBase;
begin
  Result := TModelSessao.Create(nil);
end;

procedure TControllerSessao.PopularModel;
begin
  inherited;
  TModelSessao(ModelCadastroBase).Id := ClientDataSet.FieldByName('id').AsInteger;
  TModelSessao(ModelCadastroBase).Descricao := ClientDataSet.FieldByName('Descricao').AsString;
end;

end.
