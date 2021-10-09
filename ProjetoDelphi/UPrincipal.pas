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
    LbPesquisa: TLabel;
    PageControlPesquisa: TPageControl;
    RGPesquisaCod: TRadioGroup;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RGPesquisaNome: TRadioGroup;
    Label4: TLabel;
    Label5: TLabel;
    procedure Clientes1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure EdPesquisaPedidoChange(Sender: TObject);
    procedure RGPesquisaCodClick(Sender: TObject);
    procedure PageControlPesquisaChange(Sender: TObject);
    procedure RGPesquisaNomeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
       DMDados.FDQPedido.SQL.Clear;
       DMDados.FDQPedido.SQL.Add('SELECT * ');
       DMDados.FDQPedido.SQL.Add('FROM pedidos  INNER JOIN clientes '+
       'ON pedidos.fk_cliente = clientes.codigo_cli ' );
       if(RGPesquisaNome.ItemIndex = 0)
       THEN
        begin
           DMDados.FDQPedido.SQL.Add( 'where nome like '  );
           DMDados.FDQPedido.SQL.Add( ' '+ QuotedStr('%' + EdPesquisaPedido.Text + '%'));
        end
        ELSE  if(RGPesquisaCod.ItemIndex = 0)  THEN
        begin
           DMDados.FDQPedido.SQL.Clear;
           DMDados.FDQPedido.Close;
           DMDados.FDQPedido.SQL.Add( 'select clientes.nome '
           + ' , count(pedidos.fk_cliente) as qtd_pedidos '
           + ' from clientes  '
           + ' inner join pedidos   '
           + ' on pedidos.fk_cliente = clientes.codigo_cli  '  );
           DMDados.FDQPedido.SQL.Add( 'where codigo_cli like '  );
           DMDados.FDQPedido.SQL.Add( ' '+ QuotedStr( EdPesquisaPedido.Text ));
           DMDados.FDQPedido.SQL.Add('group by clientes.nome'  );
           end ;

        DMDados.FDQPedido.Open();

end;



procedure TFormPrincipal.FormShow(Sender: TObject);
begin
   DMDados.FDQProdutoReceita.Open() ;
   LBMaiorReceita.Caption := DMDados.FDQProdutoReceita.FieldByName('DESCRICAO').AsString;
end;

procedure TFormPrincipal.PageControlPesquisaChange(Sender: TObject);
begin
    RGPesquisaCod.ItemIndex  := -1;
    RGPesquisaNome.ItemIndex := -1;
end;

procedure TFormPrincipal.Produtos1Click(Sender: TObject);
begin
    FormCadProduto.ShowModal;
end;

procedure TFormPrincipal.RGPesquisaCodClick(Sender: TObject);
var
  psql : string;
begin
      EdPesquisaPedido.Enabled := true;
      EdPesquisaPedido.Clear;
      EdPesquisaPedido.Visible := true;
      lbpesquisa.Visible := true;
      DMDados.FDQPedido.Close;
      DMDados.FDQPedido.SQL.Clear;

       if(RGPesquisaCod.ItemIndex = 0)  THEN
         begin
             EdPesquisaPedido.text := '3';
           end ;

        if(RGPesquisaCod.ItemIndex = 1)  THEN
         begin
           DMDados.FDQPedido.SQL.Clear;
           DMDados.FDQPedido.Close;
           DMDados.FDQPedido.SQL.Add( 'select clientes.codigo_cli, clientes.nome  '
            +' , sum(itens_pedidos.quantidade) as qtd_itens  '
            +' , sum(itens_pedidos.quantidade * produtos.preco_venda) AS TOTAL '
            +'  from pedidos , clientes ,itens_pedidos ,produtos  '
            +'  where clientes.codigo_cli = pedidos.fk_cliente '
                  +'and pedidos.codigo_ped   = itens_pedidos.pedido '
                  +'and produtos.codigo_prod =  itens_pedidos.produto  ' );
                // +'and  clientes.codigo_cli like ' );
           //  DMDados.FDQPedido.SQL.Add(  QuotedStr(  EdPesquisaPedido.Text ));
             DMDados.FDQPedido.SQL.Add( ' group by '
              +' clientes.codigo_cli  '
            +' , clientes.nome ');
            DMDados.FDQPedido.Open();
            EdPesquisaPedido.Visible := false;
            lbpesquisa.Visible := false;
      end
      ELSE if(RGPesquisaCod.ItemIndex = 2)  THEN
      begin
           DMDados.FDQPedido.SQL.Clear;
           DMDados.FDQPedido.Close;
           psql := ' select  pedidos.codigo_ped, pedidos.situacao, '
           + ' clientes.codigo_cli , produtos.preco_venda  , itens_pedidos.quantidade'

           + ' , (itens_pedidos.quantidade * produtos.preco_venda - '
           + ' (( itens_pedidos.quantidade * produtos.custo_unitario )+itens_pedidos.desconto ))  AS LUCRO_PEDIDO   '
           +' from   '
           +' pedidos , clientes ,itens_pedidos ,produtos '
           +' where     pedidos.fk_cliente = clientes.codigo_cli'
           +'           and produtos.codigo_prod =  itens_pedidos.produto     '
           +'           and pedidos.codigo_ped   = itens_pedidos.pedido     '
           +'                and pedidos.situacao like '
           +                QuotedStr( 'Pendente' )
           +'              group by  '
           +'                 clientes.codigo_cli, pedidos.codigo_ped    '
           +'                ,pedidos.situacao , itens_pedidos.quantidade '
           +'                , produtos.preco_venda  ,  produtos.custo_unitario, itens_pedidos.desconto';
           DMDados.FDQPedido.SQL.Add( psql);
           DMDados.FDQPedido.Open();
           EdPesquisaPedido.Enabled := false;
           EdPesquisaPedido.Visible := false;
           lbpesquisa.Visible := false;
      end;

end;

procedure TFormPrincipal.RGPesquisaNomeClick(Sender: TObject);
begin
      EdPesquisaPedido.Visible := true;
      lbpesquisa.Visible := true;
end;

end.
