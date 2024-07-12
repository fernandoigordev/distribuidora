unit View.Page.Sessao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TelaCadastroView, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.DBCtrls, Controller.CadastroBase, Vcl.Menus;

type
  TViewPageSessao = class(TFormTelaCadastroView)
    DBEditDescricao: TDBEdit;
    Label1: TLabel;
  private
    { Private declarations }
  protected
    function ValidarCadastro: Boolean;override;
    function GetClasseController: TControllerCadastroBase;override;
  public
    { Public declarations }
  end;

implementation
uses Controller.Page.Sessao;

{$R *.dfm}

{ TViewSessao }

function TViewPageSessao.GetClasseController: TControllerCadastroBase;
begin
  Result := TControllerSessao.Create;
end;

function TViewPageSessao.ValidarCadastro: Boolean;
begin
  Result := True;
end;


initialization
RegisterClass(TViewPageSessao);

finalization
UnRegisterClass(TViewPageSessao);

end.
