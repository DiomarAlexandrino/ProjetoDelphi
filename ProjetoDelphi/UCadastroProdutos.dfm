object FormCadProduto: TFormCadProduto
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 537
  ClientWidth = 755
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 755
    Height = 97
    Align = alTop
    TabOrder = 0
    object DBNavigator1: TDBNavigator
      Left = 1
      Top = 1
      Width = 753
      Height = 95
      DataSource = DMDados.DSProdutos
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alClient
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 755
    Height = 185
    Align = alClient
    Caption = 'db'
    TabOrder = 1
    object DBGridProd: TDBGrid
      Left = 1
      Top = 1
      Width = 753
      Height = 183
      Align = alClient
      DataSource = DMDados.DSProdutos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 282
    Width = 755
    Height = 255
    Align = alBottom
    TabOrder = 2
    object Label1: TLabel
      Left = 18
      Top = 24
      Width = 75
      Height = 13
      Caption = 'CODIGO_PROD'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 18
      Top = 56
      Width = 59
      Height = 13
      Caption = 'DESCRICAO'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 239
      Top = 24
      Width = 87
      Height = 13
      Caption = 'CODIGO_BARRAS'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 18
      Top = 88
      Width = 66
      Height = 13
      Caption = 'QUANTIDADE'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 254
      Top = 88
      Width = 45
      Height = 13
      Caption = 'UNIDADE'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 18
      Top = 120
      Width = 90
      Height = 13
      Caption = 'CUSTO_UNITARIO'
    end
    object Label7: TLabel
      Left = 254
      Top = 122
      Width = 73
      Height = 13
      Caption = 'PRECO_VENDA'
    end
    object DBEdit1: TDBEdit
      Left = 99
      Top = 21
      Width = 134
      Height = 21
      DataField = 'CODIGO_PROD'
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 99
      Top = 56
      Width = 448
      Height = 21
      DataField = 'DESCRICAO'
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 332
      Top = 21
      Width = 215
      Height = 21
      DataField = 'CODIGO_BARRAS'
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 99
      Top = 83
      Width = 134
      Height = 21
      DataField = 'QUANTIDADE'
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 305
      Top = 83
      Width = 56
      Height = 21
      DataField = 'UNIDADE'
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 114
      Top = 118
      Width = 119
      Height = 21
      DataField = 'CUSTO_UNITARIO'
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 333
      Top = 117
      Width = 56
      Height = 21
      DataField = 'PRECO_VENDA'
      TabOrder = 6
    end
  end
end
