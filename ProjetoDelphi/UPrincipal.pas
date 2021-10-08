unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls;

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
    Label2: TLabel;
    LBMaiorReceita: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    RGPesquisa: TRadioGroup;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
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
var
subTotal : double;
 Total: Double;
 sql1 :String;
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
           DMDados.FDQPedido.SQL.Add( 'select clientes.codigo_cli, clientes.nome  '
            +' , sum(itens_pedidos.quantidade) as qtd_itens  '
            +' , sum(itens_pedidos.quantidade * produtos.preco_venda) AS TOTAL '
            +'  from pedidos , clientes ,itens_pedidos ,produtos  '
            +'  where clientes.codigo_cli = pedidos.fk_cliente '
                  +'and pedidos.codigo_ped   = itens_pedidos.pedido '
                  +'and produtos.codigo_prod =  itens_pedidos.produto  '
                 +'and  clientes.codigo_cli like ' );
             DMDados.FDQPedido.SQL.Add(  QuotedStr(  EdPesquisaPedido.Text ));
             DMDados.FDQPedido.SQL.Add( ' group by '
              +' clientes.codigo_cli  '
            +' , clientes.nome ');
      end;
       ELSE  if(RGPesquisa.ItemIndex = 4)  THEN
      begin
           DMDados.FDQPedido.SQL.Clear;
           DMDados.FDQPedido.Close;
           DMDados.FDQPedido.SQL.Add( 'select clientes.codigo_cli, clientes.nome  '
            +' , sum(itens_pedidos.quantidade) as qtd_itens  '
            +' , sum(itens_pedidos.quantidade * produtos.preco_venda) AS TOTAL '
            +'  from pedidos , clientes ,itens_pedidos ,produtos  '
            +'  where clientes.codigo_cli = pedidos.fk_cliente '
                  +'and pedidos.codigo_ped   = itens_pedidos.pedido '
                  +'and produtos.codigo_prod =  itens_pedidos.produto  '
                 +'and  clientes.codigo_cli like ' );
             DMDados.FDQPedido.SQL.Add(  QuotedStr(  EdPesquisaPedido.Text ));
             DMDados.FDQPedido.SQL.Add( ' group by '
              +' clientes.codigo_cli  '
            +' , clientes.nome ');
      end;
       DMDados.FDQPedido.Open();

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
      
end;

end.
