object FormSaidaPed: TFormSaidaPed
  Left = 0
  Top = 0
  Caption = 'Sa'#237'da de Pedidos'
  ClientHeight = 391
  ClientWidth = 859
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 859
    Height = 151
    Align = alTop
    TabOrder = 0
    object Panel5: TPanel
      Left = 425
      Top = 1
      Width = 274
      Height = 149
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 0
      object DBGridSaidaProd: TDBGrid
        Left = 1
        Top = 1
        Width = 272
        Height = 147
        Align = alClient
        DataSource = DMDados.DSProdutos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGridSaidaProdCellClick
      end
    end
    object Panel6: TPanel
      Left = 699
      Top = 1
      Width = 159
      Height = 149
      Align = alRight
      TabOrder = 1
      object Label5: TLabel
        Left = 6
        Top = 41
        Width = 59
        Height = 18
        Caption = 'Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 65
        Width = 87
        Height = 19
        Caption = 'Quantidade:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LBQtd: TLabel
        Left = 112
        Top = 65
        Width = 5
        Height = 19
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel7: TPanel
      Left = 1
      Top = 1
      Width = 424
      Height = 149
      Align = alLeft
      TabOrder = 2
      object Label7: TLabel
        Left = 96
        Top = 37
        Width = 149
        Height = 19
        Align = alCustom
        Caption = 'Pesquisar Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 96
        Top = 8
        Width = 142
        Height = 19
        Caption = 'Pesquisar Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdPesquisaCliente: TEdit
        Left = 252
        Top = 10
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = EdPesquisaClienteChange
      end
      object EdPesquisa: TEdit
        Left = 251
        Top = 36
        Width = 129
        Height = 21
        TabOrder = 1
        OnChange = EdPesquisaChange
      end
      object RGPesquisa: TRadioGroup
        Left = 4
        Top = 7
        Width = 86
        Height = 52
        Align = alCustom
        ItemIndex = 0
        Items.Strings = (
          'Nome'
          'C'#243'digo')
        TabOrder = 2
      end
      object Panel8: TPanel
        Left = 1
        Top = 65
        Width = 422
        Height = 83
        Align = alBottom
        TabOrder = 3
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 420
          Height = 81
          ActivePage = TabSheet1
          Align = alClient
          TabOrder = 0
          object TabSheet1: TTabSheet
            Caption = 'Cliente'
            object Label9: TLabel
              Left = 0
              Top = 3
              Width = 62
              Height = 19
              Caption = 'C'#243'digo:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label10: TLabel
              Left = 3
              Top = 28
              Width = 53
              Height = 19
              Caption = 'Nome:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBCodCli: TLabel
              Left = 68
              Top = 3
              Width = 5
              Height = 19
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBNomeCli: TLabel
              Left = 68
              Top = 28
              Width = 5
              Height = 19
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 151
    Width = 859
    Height = 115
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 857
      Height = 113
      ActivePage = Compra
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Compra: TTabSheet
        Caption = 'Itens do Pedido'
        object Label2: TLabel
          Left = 211
          Top = 6
          Width = 87
          Height = 19
          Caption = 'Quantidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 68
          Top = 31
          Width = 43
          Height = 19
          Caption = 'Valor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LBCod: TLabel
          Left = 50
          Top = 6
          Width = 56
          Height = 19
          Caption = 'C'#243'digo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object LBCodProd: TLabel
          Left = 111
          Top = 5
          Width = 5
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 227
          Top = 31
          Width = 71
          Height = 19
          Caption = 'Desconto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object EdQtd: TEdit
          Left = 304
          Top = 0
          Width = 89
          Height = 26
          TabOrder = 0
          OnChange = EdQtdChange
          OnEnter = EdQtdEnter
        end
        object BtnAdd: TButton
          Left = 419
          Top = 0
          Width = 125
          Height = 33
          Caption = 'Adicionar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BtnAddClick
        end
        object EdVenda: TEdit
          Left = 117
          Top = 30
          Width = 88
          Height = 26
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object EDDesconto: TEdit
          Left = 304
          Top = 31
          Width = 89
          Height = 26
          TabOrder = 3
          Text = '0'
          OnChange = EdQtdChange
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 266
    Width = 859
    Height = 125
    Align = alBottom
    TabOrder = 2
    object DBGridItens: TDBGrid
      Left = 1
      Top = 1
      Width = 411
      Height = 123
      Align = alClient
      DataSource = DSItens
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel4: TPanel
      Left = 412
      Top = 1
      Width = 446
      Height = 123
      Align = alRight
      TabOrder = 1
      object Label1: TLabel
        Left = -97
        Top = 60
        Width = 87
        Height = 13
        Align = alCustom
        Caption = 'Pesquisar Produto'
      end
      object Label6: TLabel
        Left = -93
        Top = 0
        Width = 82
        Height = 13
        Caption = 'Pesquisar Cliente'
      end
      object BtnFimVenda: TButton
        Left = 12
        Top = 5
        Width = 125
        Height = 60
        Caption = 'Finalizar Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtnFimVendaClick
      end
    end
  end
  object DSItens: TDataSource
    DataSet = CDSTemporario
    Left = 696
    Top = 272
  end
  object CDSTemporario: TClientDataSet
    PersistDataPacket.Data = {
      680000009619E0BD01000000180000000500000000000300000068000B434F44
      5F50524F4455544F040001000000000004515444450800040000000000084465
      73636F6E746F08000400000000000556414C4F52080004000000000005544F54
      414C08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 612
    Top = 291
    object CDSTemporarioCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object CDSTemporarioQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object CDSTemporarioDesconto: TFloatField
      FieldName = 'Desconto'
    end
    object CDSTemporarioVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CDSTemporarioTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
