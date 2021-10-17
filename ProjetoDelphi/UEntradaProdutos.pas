unit UEntradaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TFormEntProd = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    DBGridEntProd: TDBGrid;
    Panel6: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    LBQtd: TLabel;
    Panel7: TPanel;
    Label7: TLabel;
    EdPesquisa: TEdit;
    RGPesquisa: TRadioGroup;
    Panel2: TPanel;
    PageControl1: TPageControl;
    Compra: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    LBCod: TLabel;
    LBCodProd: TLabel;
    Label11: TLabel;
    EdQtd: TEdit;
    BtnAdd: TButton;
    EdCusto: TEdit;
    EDDesconto: TEdit;
    Panel3: TPanel;
    DBGridItens: TDBGrid;
    Panel4: TPanel;
    Label1: TLabel;
    Label6: TLabel;
    BtnFimEntrada: TButton;
    DSItens: TDataSource;
    CDSTemporario: TClientDataSet;
    CDSTemporarioCOD_PROD: TIntegerField;
    CDSTemporarioQTDE: TFloatField;
    CDSTemporarioDESCONTO: TFloatField;
    CDSTemporarioCUSTO: TFloatField;
    CDSTemporarioTOTAL: TFloatField;
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridEntProdCellClick(Column: TColumn);
    procedure BtnAddClick(Sender: TObject);
    procedure EdPesquisaEnter(Sender: TObject);
    procedure BtnFimEntradaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEntProd: TFormEntProd;

implementation

{$R *.dfm}

uses UDMDados;

procedure TFormEntProd.BtnAddClick(Sender: TObject);
var sql1 : string; total:real;
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
    cdsTemporario.FieldByName('COD_PROD').AsInteger :=
    StrToInt(LBCodProd.Caption);
    cdsTemporario.FieldByName('QTDE').AsFloat :=
    StrToFloat(edQtd.Text);
     cdsTemporario.FieldByName('Desconto').AsFloat :=
    StrToFloat(EDDesconto.Text);
    cdsTemporario.FieldByName('CUSTO').AsFloat :=
    StrToFloat(EdCusto.Text);
    Total := StrToInt(edQtd.Text) * StrToFloat(edCusto.Text);
    cdsTemporario.FieldByName('TOTAL').AsFloat :=
    Total;
    cdsTemporario.Post;
    CDSTemporario.Open;

    BtnAdd.Enabled      := false;
    EdQtd.Clear;
    BtnFimEntrada.Enabled := true;
end;

procedure TFormEntProd.BtnFimEntradaClick(Sender: TObject);
var
CodigoProduto,CodigoPedido, codigoItem : integer;  somaProduto: Double;
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
     DMDados.FDQPedido.FieldByName('SITUACAO').AsString :=
     'FATURADO';
     DMDados.FDQPedido.Post;

      cdsTemporario.First; // move para o primeiro registro da tabela temporária
      while not (cdsTemporario.EOF) do // laço de repetição
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
         DMDados.FDQItensPed.Append; // coloca a tabela física em modo de inserção
        // copia os valores da tabela temporária para a tabela física

          DMDados.FDQItensPed.FieldByName('codigo_item').AsInteger :=
          codigoItem + 1;
          DMDados.FDQItensPed.FieldByName('Pedido').AsInteger :=
          CodigoPedido;
          DMDados.FDQItensPed.FieldByName('PRODUTO').AsInteger :=
          cdsTemporario.FieldByName('COD_PROD').AsInteger;
          DMDados.FDQItensPed.FieldByName('Quantidade').AsFloat :=
          cdsTemporario.FieldByName('QTDE').AsFloat;
          DMDados.FDQItensPed.FieldByName('Desconto').AsFloat :=
          cdsTemporario.FieldByName('Desconto').AsFloat;
          DMDados.FDQItensPed.FieldByName('Tipo').AsString := 'E';
          DMDados.FDQItensPed.FieldByName('Status').AsString := 'Não';
          //atualiza produto
          CodigoProduto:= cdsTemporario.FieldByName('COD_PROD').AsInteger;
          DMDados.FDQProdutos.close;
          DMDados.FDQProdutos.Sql.clear;
           //pesquisa do codigo
          DMDados.FDQProdutos.sql.Add('select * from Produtos'
          +' WHERE (codigo_prod like '
          +  CodigoProduto.ToString +' )');
          // grava o prodto
          ShowMessage( 'COD_PRODUTO  ' +cdsTemporario.FieldByName('COD_PROD').AsString);
          DMDados.FDQProdutos.open;
          somaProduto:=
          DMDados.FDQProdutos.FieldByName('Quantidade').AsFloat +
          cdsTemporario.FieldByName('QTDE').AsFloat ;
          //ShowMessage( 'Quantidade ' + DMDados.FDQProdutos.FieldByName('Quantidade').AsString) ;
          //ShowMessage('Qtde '+cdsTemporario.FieldByName('QTDE').AsString) ;
          //ShowMessage(somaProduto.ToString) ;
          DMDados.FDQProdutos.Edit;
          DMDados.FDQProdutos.ExecSQL(' UPDATE produtos SET quantidade = '
          +  QuotedStr(somaProduto.ToString)
          +'  WHERE (codigo_prod like '
          +   QuotedStr(CodigoProduto.ToString) +')' );
            DMDados.FDQItensPed.Post; // grava o item da venda
         // deleta o registro da tabela temporária
         // isso fará com que o próximo registro seja lido
          cdsTemporario.Delete;
      end;

      // persiste os itens no banco de dados
      BtnFimEntrada.Enabled := false;
end;

procedure TFormEntProd.DBGridEntProdCellClick(Column: TColumn);
var
   quantidade: double;
begin
       LBCodProd.Caption:=
       DBGridEntProd.SelectedField.DataSet.FieldByName('codigo_prod').AsString;
       EdCusto.text :=(
       DBGridEntProd.SelectedField.DataSet.FieldByName('custo_unitario').AsString);
       //estoque
       quantidade :=
       DBGridEntProd.SelectedField.DataSet.
       FieldByName('quantidade').AsFloat;
       LBQtd.Caption:= FloatToStr(quantidade);
        DMDados.FDQItensPed.Close();
 end;





procedure TFormEntProd.EdPesquisaChange(Sender: TObject);
begin
   if(RGPesquisa.ItemIndex = 0)
   THEN
   begin
      DMDados.FDQProdutos.close() ;
      DMDados.FDQProdutos.SQL.Clear;
      DMDados.FDQProdutos.SQL.Add( ''
      +' SELECT                                         '
      +'   produtos.codigo_prod , produtos.descricao    '
      +'   , produtos.custo_unitario                    '
      +'   , produtos.quantidade                        '
      +'   ,sum( produtos.preco_venda ) AS Preco_venda  '
      +'                '
      +'   FROM produtos                                '
      +'   left JOIN itens_pedidos                      '
      +'   ON produtos.codigo_prod = itens_pedidos.produto'
      +'   left JOIN pedidos                            '
      +'   ON pedidos.codigo_ped= itens_pedidos.pedido  '
      +'   where produtos.descricao like                '
           + QuotedStr('%'+EdPesquisa.Text+'%')
      +'   group by                                     '
      +'      produtos.codigo_prod                      '
      +'      ,produtos.descricao                       '
      +'      , produtos.custo_unitario                 '
      +'      , produtos.quantidade                     '
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
      +' SELECT                                            '
      +'   produtos.codigo_prod , produtos.descricao       '
      +'   , produtos.custo_unitario                       '
      +'   , produtos.quantidade                           '
      +'   ,sum( produtos.preco_venda ) AS Preco_venda     '
      +'   FROM produtos                                   '
      +'   left JOIN itens_pedidos                         '
      +'   ON produtos.codigo_prod = itens_pedidos.produto '
      +'   left JOIN pedidos                               '
      +'   ON pedidos.codigo_ped= itens_pedidos.pedido     '
      +'   where produtos.codigo_prod like                 '
           + QuotedStr(EdPesquisa.Text)
      +'   group by                                        '
      +'      produtos.codigo_prod                         '
      +'      ,produtos.descricao                          '
      +'      , produtos.custo_unitario                    '
      +'      , produtos.quantidade                        '
       );
      DMDados.FDQProdutos.Open() ;
     // LBMaiorReceita.Caption := DMDados.FDQProdutoReceita.FieldByName('DESCRICAO').AsString;
       //DMDados.FDQProdutoReceita.close() ;
    end;

  end;

procedure TFormEntProd.EdPesquisaEnter(Sender: TObject);
begin
  EdPesquisa.Clear;
end;

end.
