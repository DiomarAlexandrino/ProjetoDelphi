unit UCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TFormCadCliente = class(TForm)
    Panel1: TPanel;
    DBNavigatorCli: TDBNavigator;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridClientes: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadCliente: TFormCadCliente;

implementation

{$R *.dfm}

uses UDMDados;

end.
