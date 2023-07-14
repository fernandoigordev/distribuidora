unit View.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TLoginView = class(TForm)
    PanelLeft: TPanel;
    PanelRight: TPanel;
    Image1: TImage;
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
    LabelButtonLogin: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginView: TLoginView;

implementation

{$R *.dfm}

end.
