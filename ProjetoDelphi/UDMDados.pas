unit UDMDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TDMDados = class(TDataModule)
    FDConexao: TFDConnection;
    FDQClientes: TFDQuery;
    DSClientes: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQClientesNOME: TStringField;
    FDQClientesCPF_CNPJ: TStringField;
    FDQClientesCIDADE: TStringField;
    FDQClientesUF: TStringField;
    FDQClientesCODIGO_CLI: TSmallintField;
    FDQProdutos: TFDQuery;
    DSProdutos: TDataSource;
    FDQPedido: TFDQuery;
    DSPedidos: TDataSource;
    DSPedidoQTD: TDataSource;
    FDQProdutoReceita: TFDQuery;
    FDQItensPed: TFDQuery;
    DSItensPed: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDados: TDMDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
