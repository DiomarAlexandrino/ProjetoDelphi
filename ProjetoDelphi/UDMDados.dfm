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
    FormatOptions.AssignedValues = [fvMaxStringSize]
    Left = 152
    Top = 88
  end
  object DSProdutos: TDataSource
    DataSet = FDQProdutos
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
    Left = 248
    Top = 144
  end
  object DSPedidoQTD: TDataSource
    DataSet = FDQPedido
    Left = 248
    Top = 200
  end
  object FDQProdutoReceita: TFDQuery
    Connection = FDConexao
    Left = 144
    Top = 200
  end
  object FDQItensPed: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select * from itens_pedidos')
    Left = 152
    Top = 256
  end
  object DSItensPed: TDataSource
    DataSet = FDQItensPed
    Left = 240
    Top = 256
  end
end
