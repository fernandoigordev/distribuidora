unit View.Page.Dashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.TelaBaseView, Vcl.StdCtrls;

type
  TFormPageDashboard = class(TFormTelaBaseView)
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPageDashboard: TFormPageDashboard;

implementation

{$R *.dfm}

initialization
RegisterClass(TFormPageDashboard);

finalization
UnRegisterClass(TFormPageDashboard);

end.
