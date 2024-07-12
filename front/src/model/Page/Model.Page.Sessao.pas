unit Model.Page.Sessao;

interface

uses
  Model.CadastroBase;

type
TModelSessao = class(TModelCadastroBase)
private
    FId: Integer;
    FDescricao: String;
public
  property Id: Integer read FId write FId;
  property Descricao: String read FDescricao write FDescricao;

end;

implementation

end.
