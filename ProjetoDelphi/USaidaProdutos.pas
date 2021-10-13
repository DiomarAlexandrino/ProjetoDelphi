unit USaidaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

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
    FDQItens: TFDQuery;
    FDQItensCodigo: TIntegerField;
    procedure BtnAddClick(Sender: TObject);
    procedure EdPesquisaChange(Sender: TObject);
    procedure DBGridSaidaProdCellClick(Column: TColumn);
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
begin
   var sql1 : string;
begin
    DMDados.FDQProdutos.Close();
    DMDados.FDQProdutos.SQL.Clear;
    //DMDados.FDQProdutos.Open();
    sql1 :='update produtos set quantidade = '  +QuotedStr( EdQtd.Text)
    + ', custo_unitario = '  +QuotedStr( EdCusto.Text)
    +' where codigo_prod = ' +QuotedStr( LBCodProd.Caption);

    DMDados.FDQProdutos.ExecSQL(sql1);
     ShowMessage('Pedido realizado com Sucesso') ;
       fdqitens.Open()  ;
      FDQItens.Insert;
    FDQItensCodigo.Value:= StrToInt( LBCodProd.Caption) ;
end;

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
