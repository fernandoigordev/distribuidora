unit View.TelaCadastroView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TelaBaseView, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, Vcl.Mask,
  Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Controller.CadastroBase, Vcl.Menus;

type
  TFormTelaCadastroView = class(TFormTelaBaseView)
    PanelCadastro: TPanel;
    PanelSalvar: TPanel;
    SpeedButtonSalvar: TSpeedButton;
    PanelCancelar: TPanel;
    SpeedButtonCanelcelar: TSpeedButton;
    PageControlCadastro: TPageControl;
    TabSheetCadastro: TTabSheet;
    TabSheetPesquisa: TTabSheet;
    ScrollBoxCadastro: TScrollBox;
    LabelCodigoPesq: TLabel;
    Edit1CodigoPesq: TEdit;
    PanelPesquisaTop: TPanel;
    DBGridPesquisa: TDBGrid;
    PanelNovo: TPanel;
    SpeedButtonNovo: TSpeedButton;
    DataSourceCadastro: TDataSource;
    PopupMenuGrid: TPopupMenu;
    Editar1: TMenuItem;
    Deletar1: TMenuItem;
    procedure SpeedButtonSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButtonNovoClick(Sender: TObject);
    procedure DBGridPesquisaDblClick(Sender: TObject);
    procedure SpeedButtonCanelcelarClick(Sender: TObject);
    procedure Editar1Click(Sender: TObject);
    procedure Deletar1Click(Sender: TObject);
  private
    { Private declarations }
    FControllerCadastro: TControllerCadastroBase;
  protected
    procedure SetTabShetAtiva(ATabSheet: TTabSheet);
    procedure NovoCadastro;
    procedure PesquisarCadastro;
    procedure EditarCastro;
    procedure CancelarCadastro;
    procedure SalvarCadastro;
    procedure DeletarCadastro;

    function ValidarCadastro: Boolean;virtual;abstract;
    function GetClasseController: TControllerCadastroBase;virtual;abstract;

  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFormTelaCadastroView.CancelarCadastro;
begin
  FControllerCadastro.Pesquisar('');
  SetTabShetAtiva(TabSheetPesquisa);
end;

procedure TFormTelaCadastroView.DBGridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  EditarCastro;
end;

procedure TFormTelaCadastroView.Deletar1Click(Sender: TObject);
begin
  inherited;
  DeletarCadastro;
end;

procedure TFormTelaCadastroView.DeletarCadastro;
begin
  FControllerCadastro.Deletar;
end;

procedure TFormTelaCadastroView.Editar1Click(Sender: TObject);
begin
  inherited;
  EditarCastro;
end;

procedure TFormTelaCadastroView.EditarCastro;
begin
  FControllerCadastro.Editar;
  SetTabShetAtiva(TabSheetCadastro);
end;

procedure TFormTelaCadastroView.FormCreate(Sender: TObject);
begin
  inherited;
  FControllerCadastro := GetClasseController;
  SetTabShetAtiva(TabSheetPesquisa);
  FControllerCadastro.SetClientDataSet(DataSourceCadastro);
end;

procedure TFormTelaCadastroView.FormDestroy(Sender: TObject);
begin
  inherited;
  FControllerCadastro.Free;
end;

procedure TFormTelaCadastroView.NovoCadastro;
begin
  FControllerCadastro.Inserir;
  SetTabShetAtiva(TabSheetCadastro);
end;

procedure TFormTelaCadastroView.PesquisarCadastro;
begin
  FControllerCadastro.Pesquisar(Edit1CodigoPesq.Text);
end;

procedure TFormTelaCadastroView.SalvarCadastro;
begin
  if ValidarCadastro then
  begin
    FControllerCadastro.Salvar;
//    FControllerCadastro.Pesquisar('');
    SetTabShetAtiva(TabSheetPesquisa);
  end;
end;

procedure TFormTelaCadastroView.SetTabShetAtiva(ATabSheet: TTabSheet);
begin
  PageControlCadastro.ActivePage := PageControlCadastro.Pages[ATabSheet.PageIndex];
end;

procedure TFormTelaCadastroView.SpeedButtonCanelcelarClick(Sender: TObject);
begin
  inherited;
  CancelarCadastro;
end;

procedure TFormTelaCadastroView.SpeedButtonNovoClick(Sender: TObject);
begin
  inherited;
  NovoCadastro;
end;

procedure TFormTelaCadastroView.SpeedButtonSalvarClick(Sender: TObject);
begin
  inherited;
  SalvarCadastro;
end;

end.
