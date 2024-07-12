unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFormViewLogin = class(TForm)
    PanelEsquerdo: TPanel;
    PanelDireito: TPanel;
    ImageLogo: TImage;
    LabelSignIn: TLabel;
    PanelSignIn: TPanel;
    PanelLogin: TPanel;
    LabelUser: TLabel;
    EditPassword: TEdit;
    ShapeRight: TShape;
    PanelPassword: TPanel;
    ShapePassword: TShape;
    LabelPassword: TLabel;
    PanelUser: TPanel;
    ShapeUser: TShape;
    EditUser: TEdit;
    LabelForgotPassword: TLabel;
    PanelButtonLogin: TPanel;
    ShapeButtonLogin: TShape;
    SpeedButtonLogin: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormViewLogin: TFormViewLogin;

implementation

{$R *.dfm}

end.
