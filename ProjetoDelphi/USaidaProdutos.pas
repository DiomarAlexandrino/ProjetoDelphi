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
    PageControlPesquisa: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    RGPesquisa: TRadioGroup;
    EdPesquisa: TEdit;
    DBGridSaidaProd: TDBGrid;
    DBGridItens: TDBGrid;
    CDSTemporario: TClientDataSet;
    DSItens: TDataSource;
    Panel4: TPanel;
    Button1: TButton;
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
    CDSTemporarioCOD_PRODUTO: TIntegerField;
    CDSTemporarioQTDE: TIntegerField;
    CDSTemporarioVALOR: TFloatField;
    CDSTemporarioTOTAL: TFloatField;
    procedure BtnAddClick(Sender: TObject);
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridSaidaProdCellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure EdQtdChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSaidaPed: TFormSaidaPed;

implementation

{$R *.dfm}

uses UDMDados;

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
    cdsTemporario.FieldByName('QTDE').AsInteger :=
    StrToInt(edQtd.Text);
    cdsTemporario.FieldByName('VALOR').AsFloat :=
    StrToFloat(EdVenda.Text);
    Total := StrToInt(edQtd.Text) * StrToFloat(edVenda.Text);
    cdsTemporario.FieldByName('TOTAL').AsFloat :=
    Total;
    cdsTemporario.Post;
    CDSTemporario.Open;


end;




procedure TFormSaidaPed.Button1Click(Sender: TObject);
var
CodigoPedido, codigoItem : integer;
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
     DMDados.FDQPedido.Post;

  cdsTemporario.First; // move para o primeiro registro da tabela tempor�ria
  while not (cdsTemporario.EOF) do // la�o de repeti��o
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
     DMDados.FDQItensPed.Append; // coloca a tabela f�sica em modo de inser��o
    // copia os valores da tabela tempor�ria para a tabela f�sica

      DMDados.FDQItensPed.FieldByName('codigo_item').AsInteger :=
      codigoItem + 1;
      DMDados.FDQItensPed.FieldByName('Pedido').AsInteger :=
      CodigoPedido;
      DMDados.FDQItensPed.FieldByName('PRODUTO').AsInteger :=
      cdsTemporario.FieldByName('COD_PRODUTO').AsInteger;
      DMDados.FDQItensPed.FieldByName('Quantidade').AsInteger :=
      cdsTemporario.FieldByName('QTDE').AsInteger;

    //DMDados.FDQItensPed.FieldByName('VALOR').AsFloat :=
     // cdsTemporario.FieldByName('VALOR').AsFloat;

     //DMDados.FDQItensPed.FieldByName('TOTAL').AsFloat :=
     // cdsTemporario.FieldByName('TOTAL').AsFloat;

        DMDados.FDQItensPed.Post; // grava o item da venda
        
     // deleta o registro da tabela tempor�ria
     // isso far� com que o pr�ximo registro seja lido
      cdsTemporario.Delete;
  end;

  // persiste os itens no banco de dados
end;

procedure TFormSaidaPed.DBGridSaidaProdCellClick(Column: TColumn);
begin


  LBCodProd.Caption:=
  DBGridSaidaProd.SelectedField.DataSet.FieldByName('codigo_prod').AsString;
   EdVenda.text :=(
  DBGridSaidaProd.SelectedField.DataSet.FieldByName('preco_venda').AsString);

   //estoque
   DMDados.FDQItensPed.SQL.Clear;
     DMDados.FDQItensPed.SQL.Add(''
    +'    select codigo_prod, itens_pedidos.status,        '
    +'    sum (produtos.quantidade                         '
    +'     - itens_pedidos.quantidade)                     '
    +'       as estoque                                    '
    +'       from produtos                                 '
    +'       left join  itens_pedidos  on                  '
    +'       itens_pedidos.produto = produtos.codigo_prod  '
     +'      inner join  pedidos  on                  '
    +'       itens_pedidos.pedido = pedidos.codigo_ped  '
    +'       where status like                             '
               + QuotedStr( 'N�o')
    +'       and  codigo_prod like                         '
              + QuotedStr(LBCodProd.Caption)
    +'       and ((pedidos.situacao like '
             + QuotedStr( 'Pendente')+' )                 '
    +'        or (pedidos.situacao like '
            + QuotedStr('Faturado')+' ))                     '
    +'       group by                                      '
    +'       produtos.codigo_prod                          '
    +'       ,status                     ' );
     DMDados.FDQItensPed.Open();
     LBQtd.Caption:=
     DMDados.FDQItensPed.FieldByName('ESTOQUE').AsString;
     DMDados.FDQItensPed.Close();
end;

procedure TFormSaidaPed.EdPesquisaChange(Sender: TObject);
begin
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
      +' SELECT   FIRST 10                                      '
      +'   produtos.codigo_prod , produtos.descricao              '
      +'   , produtos.custo_unitario                              '
      +'   , produtos.quantidade                             '
      +'   ,sum( produtos.preco_venda ) AS Preco_venda          '
      +'                '
      +'   FROM produtos                                          '
      +'   left JOIN itens_pedidos                               '
      +'   ON produtos.codigo_prod = itens_pedidos.produto        '
      +'   left JOIN pedidos                                     '
      +'   ON pedidos.codigo_ped= itens_pedidos.pedido            '
      +'   where produtos.codigo_prod like                            '
           + QuotedStr(EdPesquisa.Text)
      +'   group by                                               '
      +'      produtos.codigo_prod                                '
      +'      ,produtos.descricao                                 '
      +'      , produtos.custo_unitario                           '
      +'      , produtos.quantidade                          '
       );
      DMDados.FDQProdutos.Open() ;
     // LBMaiorReceita.Caption := DMDados.FDQProdutoReceita.FieldByName('DESCRICAO').AsString;
       //DMDados.FDQProdutoReceita.close() ;
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

end.
