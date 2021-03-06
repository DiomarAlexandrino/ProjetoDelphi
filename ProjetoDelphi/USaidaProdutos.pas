unit USaidaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.FMTBcd, Data.SqlExpr, Datasnap.DBClient;

type
  TFormSaidaPed = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridSaidaProd: TDBGrid;
    DBGridItens: TDBGrid;
    DSItens: TDataSource;
    Panel4: TPanel;
    BtnFimVenda: TButton;
    Panel5: TPanel;
    PageControl1: TPageControl;
    Compra: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    EdQtd: TEdit;
    BtnAdd: TButton;
    EdVenda: TEdit;
    LBCod: TLabel;
    LBCodProd: TLabel;
    Panel6: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    LBQtd: TLabel;
    Panel7: TPanel;
    EdPesquisaCliente: TEdit;
    EdPesquisa: TEdit;
    RGPesquisa: TRadioGroup;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel8: TPanel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    LBCodCli: TLabel;
    LBNomeCli: TLabel;
    Label11: TLabel;
    EDDesconto: TEdit;
    CDSTemporario: TClientDataSet;
    CDSTemporarioCOD_PRODUTO: TIntegerField;
    CDSTemporarioQTDE: TFloatField;
    CDSTemporarioDesconto: TFloatField;
    CDSTemporarioVALOR: TFloatField;
    CDSTemporarioTOTAL: TFloatField;
    procedure BtnAddClick(Sender: TObject);
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridSaidaProdCellClick(Column: TColumn);
    procedure BtnFimVendaClick(Sender: TObject);
    procedure EdQtdChange(Sender: TObject);
    procedure EdPesquisaClienteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdQtdEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSaidaPed: TFormSaidaPed;
  focoEdit : string;
implementation

{$R *.dfm}

uses UDMDados;
procedure TFormSaidaPed.FormShow(Sender: TObject);

begin
    focoEdit        := '';
    BtnAdd.Enabled  := false;
end;

procedure TFormSaidaPed.BtnAddClick(Sender: TObject);
var
   sql1 : string ;
   Total : real;
begin
    DMDados.FDQProdutos.Close();
    DMDados.FDQProdutos.SQL.Clear;

     // sql1 :='update produtos set quantidade = '  +QuotedStr( EdQtd.Text)
     //  + ', custo_unitario = '  +QuotedStr( EdCusto.Text)
     // +' where codigo_prod = ' +QuotedStr( LBCodProd.Caption);

     // DMDados.FDQProdutos.ExecSQL(sql1);
     ShowMessage('Pedido realizado com Sucesso') ;
     // temporaria
    cdsTemporario.Append;
    cdsTemporario.FieldByName('COD_PRODUTO').AsInteger :=
    StrToInt(LBCodProd.Caption);
    cdsTemporario.FieldByName('QTDE').AsFloat :=
    StrToFloat(edQtd.Text);
     cdsTemporario.FieldByName('Desconto').AsFloat :=
    StrToFloat(EDDesconto.Text);
    cdsTemporario.FieldByName('VALOR').AsFloat :=
    StrToFloat(EdVenda.Text);
    Total := StrToInt(edQtd.Text) * StrToFloat(edVenda.Text);
    cdsTemporario.FieldByName('TOTAL').AsFloat :=
    Total;
    cdsTemporario.Post;
    CDSTemporario.Open;

    BtnAdd.Enabled      := false;
    EdQtd.Clear;
    BtnFimVenda.Enabled := true;
end;




procedure TFormSaidaPed.BtnFimVendaClick(Sender: TObject);
var
CodigoProduto,CodigoPedido, codigoItem : integer;
 total, somaProduto: Double;

begin
     //pega utimo cod pedido
     DMDados.FDQPedido.SQL.Clear;
     DMDados.FDQPedido.SQL.Add('Select MAX(codigo_ped) as CODIGOPED from Pedidos');
     DMDados.FDQPedido.Open() ;
     CodigoPedido := DMDados.FDQPedido.FieldByName('CODIGOPED').AsInteger;
     DMDados.FDQPedido.Close;
     //limpa sql
     DMDados.FDQPedido.SQL.Clear;
     DMDados.FDQPedido.SQL.Add('Select * from pedidos');
    //  salvando pedido
     DMDados.FDQPedido.Open();
     DMDados.FDQPedido.Append;
     DMDados.FDQPedido.FieldByName('codigo_ped').AsInteger :=
     CodigoPedido + 1;
     DMDados.FDQPedido.FieldByName('FK_CLIENTE').AsInteger :=
     StrToInt(LBCodCli.Caption);
     DMDados.FDQPedido.FieldByName('SITUACAO').AsString :=
     'FATURADO';
     DMDados.FDQPedido.Post;

      cdsTemporario.First; // move para o primeiro registro da tabela tempor?ria
      while not (cdsTemporario.EOF) do // la?o de repeti??o
      begin
      /// copia o ultimo codigo do item
         DMDados.FDQItensPed.SQL.Clear;
         DMDados.FDQItensPed.SQL.Add('Select MAX(codigo_item) as CodigoItem from Itens_Pedidos');
         DMDados.FDQItensPed.Open;
         codigoItem := DMDados.FDQItensPed.FieldByName('CodigoItem').AsInteger;
         DMDados.FDQItensPed.Close;
         //limpa sql
         DMDados.FDQItensPed.SQL.Clear;
         DMDados.FDQItensPed.SQL.Add('Select * from itens_pedidos');

         DMDados.FDQItensPed.Open();
         DMDados.FDQItensPed.Append; // coloca a tabela f?sica em modo de inser??o
        // copia os valores da tabela tempor?ria para a tabela f?sica

          DMDados.FDQItensPed.FieldByName('codigo_item').AsInteger :=
          codigoItem + 1;
          DMDados.FDQItensPed.FieldByName('Pedido').AsInteger :=
          CodigoPedido;
          DMDados.FDQItensPed.FieldByName('PRODUTO').AsInteger :=
          cdsTemporario.FieldByName('COD_PRODUTO').AsInteger;
          DMDados.FDQItensPed.FieldByName('Quantidade').AsFloat :=
          cdsTemporario.FieldByName('QTDE').AsFloat;
          DMDados.FDQItensPed.FieldByName('Desconto').AsFloat :=
          cdsTemporario.FieldByName('Desconto').AsFloat;
          cdsTemporario.FieldByName('VENDA').AsFloat :=
          StrToFloat(EdVenda.Text);
          Total := StrToInt(edQtd.Text) * StrToFloat(EdVenda.Text);
          cdsTemporario.FieldByName('TOTAL').AsFloat :=
          Total;
          DMDados.FDQItensPed.FieldByName('Tipo').AsString := 'S';
          DMDados.FDQItensPed.FieldByName('Status').AsString := 'N?o';
          //atualiza produto
          CodigoProduto:= cdsTemporario.FieldByName('COD_PRODUTO').AsInteger;
          DMDados.FDQProdutos.close;
          DMDados.FDQProdutos.Sql.clear;
           //pesquisa do codigo
          DMDados.FDQProdutos.sql.Add('select * from Produtos'
          +' WHERE (codigo_prod like '
          +  CodigoProduto.ToString +' )');
          //grava o produto
          ShowMessage( 'COD_PRODUTO  ' +cdsTemporario.FieldByName('COD_PRODUTO').AsString);
          DMDados.FDQProdutos.open;
          somaProduto:=
          DMDados.FDQProdutos.FieldByName('Quantidade').AsFloat -
          cdsTemporario.FieldByName('QTDE').AsFloat ;
          ShowMessage( 'Quantidade ' + DMDados.FDQProdutos.FieldByName('Quantidade').AsString) ;
          ShowMessage('Qtde '+cdsTemporario.FieldByName('QTDE').AsString) ;
          ShowMessage(somaProduto.ToString) ;
          DMDados.FDQProdutos.Edit;
          DMDados.FDQProdutos.ExecSQL(' UPDATE produtos SET quantidade = '
           +'  WHERE (codigo_prod like '
          +   QuotedStr(CodigoProduto.ToString) +')' );
          DMDados.FDQItensPed.Post; // grava o item da venda
         // deleta o registro da tabela tempor?ria
         // isso far? com que o pr?ximo registro seja lido
          cdsTemporario.Delete;
      end;
      // persiste os itens no banco de dados
      BtnFimVenda.Enabled := false;
end;

procedure TFormSaidaPed.DBGridSaidaProdCellClick(Column: TColumn);
var
quantidade, itensEntrada, itensSaida, estoque : real;
begin
   if (focoEdit.Equals('EdPesquisa') and (LBCodCli.Caption <>'') )then
      begin

       LBCodProd.Caption:=
       DBGridSaidaProd.SelectedField.DataSet.
       FieldByName('codigo_prod').AsString;
       EdVenda.text :=
       DBGridSaidaProd.SelectedField.DataSet.
       FieldByName('preco_venda').AsString;
       //estoque
       quantidade :=
       DBGridSaidaProd.SelectedField.DataSet.
       FieldByName('quantidade').AsFloat;
       LBQtd.Caption:= FloatToStr(quantidade);
     end
     else if (focoEdit.Equals('EdPesquisaCliente')) then
     begin
        LBCodCli.Caption:=
       DBGridSaidaProd.SelectedField.DataSet.FieldByName('codigo_cli').AsString;
       LBNomeCli.Caption :=(
       DBGridSaidaProd.SelectedField.DataSet.FieldByName('nome').AsString);
     end;
end;

procedure TFormSaidaPed.EdPesquisaChange(Sender: TObject);
begin
  focoEdit := ActiveControl.Name;
  if(RGPesquisa.ItemIndex = 0)
   THEN
   begin
      DMDados.FDQProdutos.close() ;
      DMDados.FDQProdutos.SQL.Clear;
      DMDados.FDQProdutos.SQL.Add( ''
      +' SELECT  FIRST 10                                         '
      +'   produtos.codigo_prod , produtos.descricao              '
      +'   , produtos.custo_unitario                              '
      +'   , produtos.quantidade                                  '
      +'   ,sum( produtos.preco_venda ) AS Preco_venda            '
      +'                '
      +'   FROM produtos                                          '
      +'   left JOIN itens_pedidos                                '
      +'   ON produtos.codigo_prod = itens_pedidos.produto        '
      +'   left JOIN pedidos                                      '
      +'   ON pedidos.codigo_ped= itens_pedidos.pedido            '
      +'   where produtos.descricao like                          '
           + QuotedStr('%'+EdPesquisa.Text+'%')
      +'   group by                                               '
      +'      produtos.codigo_prod                                '
      +'      ,produtos.descricao                                 '
      +'      , produtos.custo_unitario                           '
      +'      , produtos.quantidade                          '
       );
      DMDados.FDQProdutos.Open() ;
     // LBMaiorReceita.Caption := DMDados.FDQProdutoReceita.FieldByName('DESCRICAO').AsString;
       //DMDados.FDQProdutoReceita.close() ;
    end
    else if(RGPesquisa.ItemIndex = 1)
   THEN
   begin
      DMDados.FDQProdutos.close() ;
      DMDados.FDQProdutos.SQL.Clear;
      DMDados.FDQProdutos.SQL.Add( ''
      +' SELECT   FIRST 10                                  '
      +'   produtos.codigo_prod , produtos.descricao        '
      +'   , produtos.custo_unitario                        '
      +'   , produtos.quantidade                            '
      +'   ,sum( produtos.preco_venda ) AS Preco_venda      '
      +'                '
      +'   FROM produtos                                    '
      +'   left JOIN itens_pedidos                          '
      +'   ON produtos.codigo_prod = itens_pedidos.produto  '
      +'   left JOIN pedidos                                '
      +'   ON pedidos.codigo_ped= itens_pedidos.pedido      '
      +'   where produtos.codigo_prod like                  '
      +    QuotedStr(EdPesquisa.Text)
      +'   group by                                         '
      +'      produtos.codigo_prod                          '
      +'      ,produtos.descricao                           '
      +'      , produtos.custo_unitario                     '
      +'      , produtos.quantidade                         '
       );
      DMDados.FDQProdutos.Open() ;
     // LBMaiorReceita.Caption := DMDados.FDQProdutoReceita.FieldByName('DESCRICAO').AsString;
       //DMDados.FDQProdutoReceita.close() ;
    end;
end;


procedure TFormSaidaPed.EdPesquisaClienteChange(Sender: TObject);
begin
    focoEdit := ActiveControl.Name;
   if(RGPesquisa.ItemIndex = 0)
   THEN
   begin
      DMDados.FDQProdutos.close() ;
      DMDados.FDQProdutos.SQL.Clear;
      DMDados.FDQProdutos.SQL.Add( ''
      +' SELECT  FIRST 10  * from clientes'
      +' where clientes.nome like        '
      +  QuotedStr('%'+EdPesquisaCliente.Text+'%'));
        DMDados.FDQProdutos.Open() ;
   end
   else if(RGPesquisa.ItemIndex = 1)
   THEN
   begin
      DMDados.FDQProdutos.close() ;
      DMDados.FDQProdutos.SQL.Clear;
      DMDados.FDQProdutos.SQL.Add( ''
      +' SELECT  FIRST 10  * from clientes'
      +' where clientes.codigo_cli like        '
      +  QuotedStr(EdPesquisaCliente.Text));
        DMDados.FDQProdutos.Open() ;
   end;
end;

procedure TFormSaidaPed.EdQtdChange(Sender: TObject);
var qtdEstoque, qtd : real;  LQTD :string;
begin

      qtd := 0;
      LQTD := LBQtd.Caption;

    if(LQtd.Equals('')) then
        ShowMessage('Produto sem estoque')
    else if(EdQtd.Text <> EmptyStr) then
       begin
       qtdEstoque := StrToFloat(LBQtd.Caption);
       //ShowMessage( 'Produto '+FloatToStr(qtdEstoque));
       qtd        := StrToFloat(EdQtd.Text);
       if (qtd > qtdEstoque) then
       begin
            ShowMessage('Produto sem estoque');
            EdQtd.Clear;
       end;
    end;
end;

procedure TFormSaidaPed.EdQtdEnter(Sender: TObject);
begin
   BtnAdd.Enabled := true;
end;

end.
