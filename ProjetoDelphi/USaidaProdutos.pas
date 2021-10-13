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
    Label3: TLabel;
    LBCod: TLabel;
    Label5: TLabel;
    PageControl1: TPageControl;
    Compra: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    EdQtd: TEdit;
    BtnAdd: TButton;
    EdCusto: TEdit;
    LBCodProd: TLabel;
    LBQtd: TLabel;
    DBGridSaidaProd: TDBGrid;
    DBGridItens: TDBGrid;
    CDSTemporario: TClientDataSet;
    CDSTemporarioCOD_PRODUTO: TIntegerField;
    CDSTemporarioQTDE: TIntegerField;
    CDSTemporarioVALOR: TFloatField;
    CDSTemporarioTOTAL: TFloatField;
    DSItens: TDataSource;
    Panel4: TPanel;
    Button1: TButton;
    procedure BtnAddClick(Sender: TObject);
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridSaidaProdCellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
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
   StrToFloat(EdCusto.Text);
  Total := StrToInt(edQtd.Text) * StrToFloat(edCusto.Text);
  cdsTemporario.FieldByName('TOTAL').AsFloat :=
  Total;
  cdsTemporario.Post;
  CDSTemporario.Open;


end;




procedure TFormSaidaPed.Button1Click(Sender: TObject);
var
CodigoPedido, codigoItem : integer;
begin
  DMDados.FDQPedido.SQL.Clear;
  DMDados.FDQPedido.SQL.Add('Select MAX(CODigo_ped) as CodigoPedido from Pedidos');
  DMDados.FDQPedido.Open;
  CodigoPedido := DMDados.FDQPedido.FieldByName('CodigoPedido').AsInteger;
  DMDados.FDQPedido.Close;




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
   // DMDados.FDQItensPed.FieldByName('COD_VENDA').AsInteger :=
    //  CodigoVenda;

      DMDados.FDQItensPed.Append;
      DMDados.FDQItensPed.FieldByName('codigo_item').AsInteger :=
      codigoItem + 1;

     DMDados.FDQItensPed.FieldByName('PRODUTO').AsInteger :=
      cdsTemporario.FieldByName('COD_PRODUTO').AsInteger;

     DMDados.FDQItensPed.FieldByName('Quantidade').AsInteger :=
      cdsTemporario.FieldByName('QTDE').AsInteger;

    //DMDados.FDQItensPed.FieldByName('VALOR').AsFloat :=
     // cdsTemporario.FieldByName('VALOR').AsFloat;

     //DMDados.FDQItensPed.FieldByName('TOTAL').AsFloat :=
     // cdsTemporario.FieldByName('TOTAL').AsFloat;

       DMDados.FDQItensPed.Post; // grava o item da venda
        DMDados.FDQItensPed.close;
        dmdados.FDQItensPed.open;

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
  LBQtd.Caption:=
  DBGridSaidaProd.SelectedField.DataSet.FieldByName('quantidade').AsString;
end;

procedure TFormSaidaPed.EdPesquisaChange(Sender: TObject);
begin
  if(RGPesquisa.ItemIndex = 0)
   THEN
   begin
      DMDados.FDQProdutos.close() ;
      DMDados.FDQProdutos.SQL.Clear;
      DMDados.FDQProdutos.SQL.Add( ''
      +' SELECT                                         '
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
      +'   where produtos.descricao like                            '
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
      +' SELECT                                         '
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

end.
