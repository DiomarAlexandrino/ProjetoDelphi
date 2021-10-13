program ProjetoVisual;

uses
  Vcl.Forms,
  UCadastroClientes in 'UCadastroClientes.pas' {FormCadCliente},
  UDMDados in 'UDMDados.pas' {DMDados: TDataModule},
  UCadastroProdutos in 'UCadastroProdutos.pas' {FormCadProduto},
  UPrincipal in 'UPrincipal.pas' {FormControlePedidos},
  UEntradaProdutos in 'UEntradaProdutos.pas' {FormEntProd},
  USaidaProdutos in 'USaidaProdutos.pas' {FormSaidaPed};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDados, DMDados);
  Application.CreateForm(TFormControlePedidos, FormControlePedidos);
  Application.CreateForm(TFormCadCliente, FormCadCliente);
  Application.CreateForm(TFormCadProduto, FormCadProduto);
  Application.CreateForm(TFormEntProd, FormEntProd);
  Application.CreateForm(TFormSaidaPed, FormSaidaPed);
  Application.Run;
end.
