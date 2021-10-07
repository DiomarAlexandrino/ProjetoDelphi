unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    formPrincipal: TMenuItem;
    Produtos1: TMenuItem;
    Clientes1: TMenuItem;
    Label1: TLabel;
    EdPesquisaPedido: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridPedidos: TDBGrid;
    Panel3: TPanel;
    RGPesquisa: TRadioGroup;
    Label2: TLabel;
    LBQtdPedidos: TLabel;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure EdPesquisaPedidoChange(Sender: TObject);
    procedure RGPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses UCadastroClientes, UCadastroProdutos, UDMDados;

procedure TFormPrincipal.Clientes1Click(Sender: TObject);
begin
    FormCadCliente.ShowModal;
end;

procedure TFormPrincipal.EdPesquisaPedidoChange(Sender: TObject);
begin
      DMDados.FDQPedido.Close;
  // DMDados.FDQPedido.Params.ClearValues() ;

      DMDados.FDQPedido.SQL.Clear;
      DMDados.FDQPedido.SQL.Add('SELECT * ');
      DMDados.FDQPedido.SQL.Add('FROM pedidos  INNER JOIN clientes '+
      'ON pedidos.fk_cliente = clientes.codigo_cli ' );

       if(RGPesquisa.ItemIndex = 0)
      THEN
       begin
         DMDados.FDQPedido.SQL.Add( 'where nome like '  );
         DMDados.FDQPedido.SQL.Add( ' '+ QuotedStr('%' + EdPesquisaPedido.Text + '%'));
       end
      ELSE  if(RGPesquisa.ItemIndex = 1)  THEN
        begin
         DMDados.FDQPedido.SQL.Add( 'where codigo_cli like '  );
         DMDados.FDQPedido.SQL.Add( ' '+ QuotedStr('%' + EdPesquisaPedido.Text + '%'));
       end
      ELSE  if(RGPesquisa.ItemIndex = 2)  THEN
        begin

         DMDados.FDQPedido.SQL.Clear;
         DMDados.FDQPedido.Close;
         DMDados.FDQPedido.SQL.Add( 'select clientes.nome '
         + ' , count(pedidos.fk_cliente) as qtd_pedidos '
         + ' from clientes  '
         + ' inner join pedidos   '
         + ' on pedidos.fk_cliente = clientes.codigo_cli  '  );
         DMDados.FDQPedido.SQL.Add( 'where codigo_cli like '  );
         DMDados.FDQPedido.SQL.Add( ' '+ QuotedStr('%' + EdPesquisaPedido.Text + '%'));
         DMDados.FDQPedido.SQL.Add('group by clientes.nome'  );

        end
      ELSE  if(RGPesquisa.ItemIndex = 3)  THEN
      begin

         DMDados.FDQPedido.SQL.Clear;
         DMDados.FDQPedido.Close;
         DMDados.FDQPedido.SQL.Add( 'select clientes.nome '
         + ' , sum(itens_pedidos.qtd * 2) as soma from itens_pedidos  '
         + ' inner join pedidos on pedidos.fk_cliente = clientes.codigo_cli  '
         + ' inner join itens_pedidos on  itens_pedidos.pedido   = pedidos.codigo_ped '  );
        // DMDados.FDQPedido.SQL.Add( 'where codigo_cli like '  );
        // DMDados.FDQPedido.SQL.Add( ' '+ QuotedStr('%' + EdPesquisaPedido.Text + '%'));
         DMDados.FDQPedido.SQL.Add('group by clientes.nome'  );

      end;




       DMDados.FDQPedido.Open();

        //quantidade registros
    

end;



procedure TFormPrincipal.Produtos1Click(Sender: TObject);
begin
    FormCadProduto.ShowModal;
end;

procedure TFormPrincipal.RGPesquisaClick(Sender: TObject);
begin
      EdPesquisaPedido.Clear;
      DMDados.FDQPedido.Close;
      DMDados.FDQPedido.SQL.Clear;
      DMDados.FDQPedido.SQL.Add('SELECT * ');
      DMDados.FDQPedido.SQL.Add('FROM pedidos  INNER JOIN clientes '+
      'ON pedidos.fk_cliente = clientes.codigo_cli ' );
end;

end.
