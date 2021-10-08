program ProjetoVisual;

uses
  Vcl.Forms,
  UCadastroClientes in 'UCadastroClientes.pas' {FormCadCliente},
  UDMDados in 'UDMDados.pas' {DMDados: TDataModule},
  UCadastroProdutos in 'UCadastroProdutos.pas' {FormCadProduto},
  UPrincipal in 'UPrincipal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMDados, DMDados);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormCadCliente, FormCadCliente);
  Application.CreateForm(TFormCadProduto, FormCadProduto);
  Application.Run;
end.
