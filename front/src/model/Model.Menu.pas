unit Model.Menu;

interface

uses Dto.ItemMenu, System.Generics.Collections;

type

TModelMenu = class
private

public
  function GetMenu: TObjectList<TDtoItemMenu>;
end;

implementation

uses
  System.SysUtils;

{ TModelMenu }

function TModelMenu.GetMenu: TObjectList<TDtoItemMenu>;
begin
  Result := TObjectList<TDtoItemMenu>.Create;

  try
    Result.Add(TDtoItemMenu
      .Create(
        'Dashboard',
        '.\assets\images\menu\menu_dashboard.bmp',
        'TFormPageDashboard'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Sessão',
        '.\assets\images\menu\menu_sessao.bmp',
        'TViewPageSessao'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Categoria',
        '.\assets\images\menu\menu_categoria.bmp',
        'TViewSessao'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Produto',
        '.\assets\images\menu\menu_produto.bmp',
        'TViewSessao'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Cliente',
        '.\assets\images\menu\menu_cliente.bmp',
        'TViewSessao'
      ));

          Result.Add(TDtoItemMenu
      .Create(
        'Colaborador',
        '.\assets\images\menu\menu_colaborador.bmp',
        'TViewSessao'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Usuário',
        '.\assets\images\menu\menu_usuario.bmp',
        'TViewSessao'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Relatório',
        '.\assets\images\menu\menu_relatorio.bmp',
        'TViewSessao'
      ));

    Result.Add(TDtoItemMenu
      .Create(
        'Configuração',
        '.\assets\images\menu\menu_configuracao.bmp',
        'TViewSessao'
      ));
  Except
    Result.Free
  end;
end;

end.
