unit UEntradaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFormEntProd = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridEntProd: TDBGrid;
    LBCod: TLabel;
    LBCodProd: TLabel;
    LBQtd: TLabel;
    Label3: TLabel;
    PageControl1: TPageControl;
    Compra: TTabSheet;
    Label2: TLabel;
    EdQtd: TEdit;
    BtnAdd: TButton;
    PageControlPesquisa: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    RGPesquisa: TRadioGroup;
    EdPesquisa: TEdit;
    EdCusto: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridEntProdCellClick(Column: TColumn);
    procedure BtnAddClick(Sender: TObject);
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
var sql1 : string;
begin
    DMDados.FDQProdutos.Close();
    DMDados.FDQProdutos.SQL.Clear;
    //DMDados.FDQProdutos.Open();
    sql1 :='update produtos set quantidade = '  +QuotedStr( EdQtd.Text)
    + ', custo_unitario = '  +QuotedStr( EdCusto.Text)
    +' where codigo_prod = ' +QuotedStr( LBCodProd.Caption);

    DMDados.FDQProdutos.ExecSQL(sql1);
     ShowMessage('Compra ralizada com Sucesso') ;

end;

procedure TFormEntProd.DBGridEntProdCellClick(Column: TColumn);


begin
  LBCodProd.Caption:=
  DBGridEntProd.SelectedField.DataSet.FieldByName('codigo_prod').AsString;
  LBQtd.Caption:=
  DBGridEntProd.SelectedField.DataSet.FieldByName('quantidade').AsString;

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
