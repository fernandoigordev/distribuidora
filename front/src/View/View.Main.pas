unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXCtrls,
  Vcl.CategoryButtons, Vcl.ButtonGroup, Vcl.StdCtrls, Vcl.Imaging.pngimage, Controller.Main, View.TelaBaseView;

const
  CS_TAMANHO_MENU_EXPANDIDO = 200;
  CS_TAMANHO_MENU_COMPACTADO = 50;

type
  TSpeedButtonMenu = class(TSpeedButton)
  private
    FClasseView: TClass;
    FTelaBaseView: TForm;
    FPanelView: TPanel;
  protected
    procedure DoOnClick(Sender: TObject);
  public
    property ClasseView: TClass read FClasseView;
    property TelaBaseView: TForm read FTelaBaseView;
    property PanelView: TPanel read FPanelView write FPanelView;

    Constructor Create(AClasseView: String; AOwner: TComponent);
    procedure MostrarTela;
  end;


  TFormViewMain = class(TForm)
    PanelPrincipal: TPanel;
    PanelEsquerdo: TPanel;
    PanelSuperior: TPanel;
    PanelUsuario: TPanel;
    PanelInformacaoUsuario: TPanel;
    ImageUsuario: TImage;
    SpeedButtonMenu: TSpeedButton;
    LabelCargo: TLabel;
    LabelNomeUsuario: TLabel;
    PanelMenu: TPanel;
    SpeedButtonSair: TSpeedButton;
    PanelTela: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButtonMenuClick(Sender: TObject);
    procedure SpeedButtonSairClick(Sender: TObject);
  private
    FControllerMain: TControllerMain;
    { Private declarations }
    procedure MontarMenu;
    procedure ControlarMenu;
    procedure ControlarDadosUsuario;

    function MenuExpandido: Boolean;
  public
    { Public declarations }
    property ControllerMain: TControllerMain read FControllerMain;
  end;

var
  FormViewMain: TFormViewMain;

implementation
uses Dto.ItemMenu, System.Generics.Collections;


{$R *.dfm}

{ TFormViewMain }

procedure TFormViewMain.ControlarDadosUsuario;
var
  MostrarDadosUsuario: Boolean;
begin
  MostrarDadosUsuario := MenuExpandido;

  ImageUsuario.Visible := MostrarDadosUsuario;
  LabelCargo.Visible := MostrarDadosUsuario;
  LabelNomeUsuario.Visible := MostrarDadosUsuario;
end;

procedure TFormViewMain.ControlarMenu;
begin
  if PanelEsquerdo.Width = CS_TAMANHO_MENU_EXPANDIDO then
    PanelEsquerdo.Width := CS_TAMANHO_MENU_COMPACTADO
  else
    PanelEsquerdo.Width := CS_TAMANHO_MENU_EXPANDIDO;

  ControlarDadosUsuario
end;

procedure TFormViewMain.FormCreate(Sender: TObject);
begin
  FControllerMain := TControllerMain.Create;
  MontarMenu;
end;

procedure TFormViewMain.FormDestroy(Sender: TObject);
begin
  FControllerMain.Free;
end;

function TFormViewMain.MenuExpandido: Boolean;
begin
  Result := PanelEsquerdo.Width = CS_TAMANHO_MENU_EXPANDIDO;
end;

procedure TFormViewMain.MontarMenu;
var
  ListaItemMenu: TObjectList<TDtoItemMenu>;
  ItemMenu: TDtoItemMenu;
  SpeedButton: TSpeedButtonMenu;
begin
  ListaItemMenu := ControllerMain.GetMenu;

  if Assigned(ListaItemMenu) then
  begin
    for ItemMenu in ListaItemMenu do
    begin
      SpeedButton := TSpeedButtonMenu.Create(ItemMenu.NomeClasseTela, Self);
      SpeedButton.Parent := PanelMenu;
      SpeedButton.Align := alTop;
      SpeedButton.AlignWithMargins := True;
      SpeedButton.Margins.Left := 10;
      SpeedButton.Margins.Right := 10;
      SpeedButton.Flat := True;
      SpeedButton.Font.Color := clWhite;
      SpeedButton.Font.Size := 10;
      SpeedButton.Height := 40;
      SpeedButton.GroupIndex := 1;
      SpeedButton.Spacing := 8;
      SpeedButton.Margin := 0;
      SpeedButton.Cursor := crHandPoint;
      SpeedButton.Caption := ItemMenu.Descricao;
      SpeedButton.PanelView := PanelTela;
      if FileExists(ItemMenu.PathImagem) then
        SpeedButton.Glyph.LoadFromFile(ItemMenu.PathImagem);
    end;
  end;
end;

procedure TFormViewMain.SpeedButtonMenuClick(Sender: TObject);
begin
  ControlarMenu;
end;

procedure TFormViewMain.SpeedButtonSairClick(Sender: TObject);
begin
  Close;
end;

{ TSpeedButtonMenu }

constructor TSpeedButtonMenu.Create(AClasseView: String; AOwner: TComponent);
begin
  inherited Create(AOwner);
  FClasseView := GetClass(AClasseView);
  Self.OnClick := DoOnClick;
end;

procedure TSpeedButtonMenu.DoOnClick(Sender: TObject);
begin
  MostrarTela;
end;

procedure TSpeedButtonMenu.MostrarTela;
begin
  if (FClasseView <> nil) and (FClasseView.InheritsFrom(TFormTelaBaseView)) then
  begin
    if (not Assigned(FTelaBaseView)) then
    begin
      FTelaBaseView := TFormClass(FClasseView).Create(Application);
      FTelaBaseView.Parent := Self.PanelView;
      FTelaBaseView.Align := alClient;
      FTelaBaseView.Color := clWhite;
      FTelaBaseView.BorderStyle := bsNone;
      FTelaBaseView.Show;
    end;

    FTelaBaseView.BringToFront;
  end;

end;

end.
