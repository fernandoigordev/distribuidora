unit Dto.ItemMenu;

interface

type

TDtoItemMenu = class
private
    FDescricao: String;
    FPathImagem: String;
    FNomeClasseTela: String;
public
  property Descricao: String read FDescricao write FDescricao;
  property PathImagem: String read FPathImagem write FPathImagem;
  property NomeClasseTela: String read FNomeClasseTela write FNomeClasseTela;

  Constructor Create(ADescricao, APathImagem, ANomeClasseTela: String);
end;

implementation

{ TDtoItemMenu }

constructor TDtoItemMenu.Create(ADescricao, APathImagem,
  ANomeClasseTela: String);
begin
  Descricao := ADescricao;
  PathImagem := APathImagem;
  NomeClasseTela := ANomeClasseTela;
end;

end.
