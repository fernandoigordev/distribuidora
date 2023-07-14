program distribuidora;

uses
  Vcl.Forms,
  View.Login in 'src\View\View.Login.pas' {LoginView};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TLoginView, LoginView);
  Application.Run;
end.
