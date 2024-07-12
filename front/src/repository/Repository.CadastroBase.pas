unit Repository.CadastroBase;

interface
uses FireDAC.Comp.Client;

type
TRepositoryCadastroBase = class
private
  FQueryModel: TFDQuery;
protected
  procedure SetSqlInserir;virtual;abstract;
  procedure SetSqlAtualizar;virtual;abstract;
  procedure SetSqlDeletar;virtual;abstract;
  procedure SetSqlListar;virtual;abstract;
public
  Constructor Create;
  Destructor Destroy;override;

  procedure Inserir;
  procedure Atualizar;
  procedure Deletar;
  procedure Listar;
end;

implementation

{ TRepositoryCadastroBase }

procedure TRepositoryCadastroBase.Atualizar;
begin
  FQueryModel.Close;
  SetSqlAtualizar;
  FQueryModel.ExecSQL;
end;

constructor TRepositoryCadastroBase.Create;
begin
  FQueryModel := TFDQuery.Create(nil);
end;

procedure TRepositoryCadastroBase.Deletar;
begin
  FQueryModel.Close;
  SetSqlInserir;
  FQueryModel.ExecSQL;
end;

destructor TRepositoryCadastroBase.Destroy;
begin
  FQueryModel.Free;
  inherited;
end;

procedure TRepositoryCadastroBase.Inserir;
begin
  FQueryModel.Close;
  SetSqlInserir;
  FQueryModel.ExecSQL;
end;

procedure TRepositoryCadastroBase.Listar;
begin
  FQueryModel.Close;
  SetSqlListar;
  FQueryModel.Open;
end;

end.
