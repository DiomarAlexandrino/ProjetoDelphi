unit UEntradaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TFormEntProd = class(TForm)
    DSItens: TDataSource;
    Panel2: TPanel;
    PageControl1: TPageControl;
    Compra: TTabSheet;
    Label2: TLabel;
    Label4: TLabel;
    LBCod: TLabel;
    LBCodProd: TLabel;
    EdQtd: TEdit;
    BtnAdd: TButton;
    EdCusto: TEdit;
    Panel1: TPanel;
    PageControlPesquisa: TPageControl;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    RGPesquisa: TRadioGroup;
    EdPesquisa: TEdit;
    Panel5: TPanel;
    DBGridEntProd: TDBGrid;
    Panel6: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    DBGridItens: TDBGrid;
    Panel4: TPanel;
    Button1: TButton;
    LBQtd: TLabel;
    CDSTemporario: TClientDataSet;
    CDSTemporarioCOD_PRODUTO: TIntegerField;
    CDSTemporarioQTDE: TFloatField;
    CDSTemporarioCUSTO: TFloatField;
    CDSTemporarioTOTAL: TFloatField;
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridEntProdCellClick(Column: TColumn);
    procedure BtnAddClick(Sender: TObject);
    procedure EdPesquisaEnter(Sender: TObject);

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
    cdsTemporario.FieldByName('COD_PRODUTO').AsInteger :=
    StrToInt(LBCodProd.Caption);
    cdsTemporario.FieldByName('QTDE').AsFloat :=
    StrToFloat(edQtd.Text);
    cdsTemporario.FieldByName('CUSTO').AsFloat :=
    StrToFloat(EdCusto.Text);
    Total := StrToInt(edQtd.Text) * StrToFloat(edCusto.Text);
    cdsTemporario.FieldByName('TOTAL').AsFloat :=
    Total;
    cdsTemporario.Post;
    CDSTemporario.Open;

end;

procedure TFormEntProd.DBGridEntProdCellClick(Column: TColumn);

begin
  LBQtd.Caption := '';
  LBCodProd.Caption:=
  DBGridEntProd.SelectedField.DataSet.FieldByName('codigo_prod').AsString;
  EdCusto.Text :=
  DBGridEntProd.SelectedField.DataSet.FieldByName('custo_unitario').AsString;
    //estoque
     DMDados.FDQItensPed.close;
   DMDados.FDQItensPed.SQL.Clear;
   DMDados.FDQItensPed.SQL.Add(''
    +'    select codigo_prod, itens_pedidos.status,        '
    +'    sum (produtos.quantidade                         '
    +'     - itens_pedidos.quantidade)                     '
    +'       as estoque                                    '
    +'       from produtos                                 '
    +'       left join  itens_pedidos  on                  '
    +'       itens_pedidos.produto = produtos.codigo_prod  '
    +'      inner join  pedidos  on                        '
    +'       itens_pedidos.pedido = pedidos.codigo_ped     '
    +'       where status like                             '
               + QuotedStr( 'N�o')
   +'        and tipo like                               '
               + QuotedStr( 'S')
    +'       and  codigo_prod like                         '
              + QuotedStr(LBCodProd.Caption)
    +'       and ((pedidos.situacao like '
             + QuotedStr( 'Pendente')+' )                  '
    +'        or (pedidos.situacao like '
            + QuotedStr('Faturado')+') )                   '
    +'       group by                                      '
    +'       produtos.codigo_prod                          '
    +'       ,status                     ' );

     DMDados.FDQItensPed.Open();
     LBQtd.Caption:=
     DMDados.FDQItensPed.FieldByName('ESTOQUE').AsString;
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

procedure TFormEntProd.EdPesquisaEnter(Sender: TObject);
begin
  EdPesquisa.Clear;
end;

end.
