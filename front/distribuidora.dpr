program distribuidora;

uses
  Vcl.Forms,
  View.Login in 'src\View\View.Login.pas' {FormViewLogin},
  View.Main in 'src\View\View.Main.pas' {FormViewMain},
  Controller.Main in 'src\controller\Controller.Main.pas',
  Dto.ItemMenu in 'src\dto\Dto.ItemMenu.pas',
  Model.Menu in 'src\model\Model.Menu.pas',
  View.TelaBaseView in 'src\view\View.TelaBaseView.pas' {FormTelaBaseView},
  View.Page.Dashboard in 'src\view\Page\View.Page.Dashboard.pas' {FormPageDashboard},
  View.TelaCadastroView in 'src\view\View.TelaCadastroView.pas' {FormTelaCadastroView},
  Controller.CadastroBase in 'src\controller\Controller.CadastroBase.pas',
  Model.CadastroBase in 'src\model\Model.CadastroBase.pas',
  View.Page.Sessao in 'src\view\Page\View.Page.Sessao.pas' {ViewPageSessao},
  Controller.Page.Sessao in 'src\controller\Page\Controller.Page.Sessao.pas',
  Model.Page.Sessao in 'src\model\Page\Model.Page.Sessao.pas',
  Repository.CadastroBase in 'src\repository\Repository.CadastroBase.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormViewMain, FormViewMain);
  Application.Run;
end.
