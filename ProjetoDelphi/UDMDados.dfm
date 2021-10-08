object DMDados: TDMDados
  OldCreateOrder = False
  Height = 323
  Width = 477
  object FDConexao: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Database=C:\BD\TESTE_VISUALSOFTWARE.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 64
    Top = 32
  end
  object FDQClientes: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from clientes')
    Left = 152
    Top = 32
    object FDQClientesCODIGO_CLI: TSmallintField
      FieldName = 'CODIGO_CLI'
      Origin = 'CODIGO_CLI'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 70
    end
    object FDQClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 15
    end
    object FDQClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Required = True
      Size = 50
    end
    object FDQClientesUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
  end
  object DSClientes: TDataSource
    DataSet = FDQClientes
    Left = 232
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 384
    Top = 40
  end
  object FDQProdutos: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from produtos')
    Left = 152
    Top = 88
    object FDQProdutosCODIGO_PROD: TSmallintField
      FieldName = 'CODIGO_PROD'
      Origin = 'CODIGO_PROD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 255
    end
    object FDQProdutosCODIGO_BARRAS: TStringField
      FieldName = 'CODIGO_BARRAS'
      Origin = 'CODIGO_BARRAS'
      Size = 255
    end
    object FDQProdutosQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
    end
    object FDQProdutosUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Size = 4
    end
    object FDQProdutosCUSTO_UNITARIO: TFMTBCDField
      FieldName = 'CUSTO_UNITARIO'
      Origin = 'CUSTO_UNITARIO'
      Precision = 18
      Size = 2
    end
    object FDQProdutosPRECO_VENDA: TIntegerField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
    end
  end
  object DSProdutos: TDataSource
    Left = 232
    Top = 88
  end
  object FDQPedido: TFDQuery
    Connection = FDConexao
    Left = 152
    Top = 144
  end
  object DSPedidos: TDataSource
    DataSet = FDQPedido
    Left = 224
    Top = 144
  end
  object DSPedidoQTD: TDataSource
    DataSet = FDQPedido
    Left = 224
    Top = 200
  end
  object FDQPedQtd: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      '')
    Left = 144
    Top = 200
  end
end
