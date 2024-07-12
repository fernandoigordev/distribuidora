unit Controller.Main;

interface
uses Dto.ItemMenu, System.Generics.Collections, Model.Menu;

type

TControllerMain = class
private
  { private declarations }
public
  { public declarations }
  function GetMenu: TObjectList<TDtoItemMenu>;
end;

implementation

{ TControllerMain }

function TControllerMain.GetMenu: TObjectList<TDtoItemMenu>;
var
  ModelMenu: TModelMenu;
begin
  ModelMenu := TModelMenu.Create;
  try
    Result := ModelMenu.GetMenu;
  finally
    ModelMenu.Free;
  end;
end;

end.
