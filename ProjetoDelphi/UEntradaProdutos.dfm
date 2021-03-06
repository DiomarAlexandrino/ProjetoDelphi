object FormEntProd: TFormEntProd
  Left = 0
  Top = 0
  Caption = 'Entrada de Produtos'
  ClientHeight = 422
  ClientWidth = 789
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
    Width = 789
    Height = 97
    Align = alTop
    TabOrder = 0
    object Panel5: TPanel
      Left = 273
      Top = 1
      Width = 351
      Height = 95
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 0
      object DBGridEntProd: TDBGrid
        Left = 1
        Top = 1
        Width = 349
        Height = 93
        Align = alClient
        DataSource = DMDados.DSProdutos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = DBGridEntProdCellClick
      end
    end
    object Panel6: TPanel
      Left = 624
      Top = 1
      Width = 164
      Height = 95
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
      Width = 272
      Height = 95
      Align = alLeft
      TabOrder = 2
      object Label7: TLabel
        Left = 96
        Top = 7
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
      object EdPesquisa: TEdit
        Left = 96
        Top = 38
        Width = 129
        Height = 21
        TabOrder = 0
        OnChange = EdPesquisaChange
      end
      object RGPesquisa: TRadioGroup
        Left = 4
        Top = 7
        Width = 86
        Height = 77
        Align = alCustom
        ItemIndex = 0
        Items.Strings = (
          'Nome'
          'C'#243'digo')
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 789
    Height = 111
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 787
      Height = 109
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
          Left = 59
          Top = 31
          Width = 46
          Height = 19
          Caption = 'Custo:'
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
        object EdCusto: TEdit
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
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 208
    Width = 789
    Height = 214
    Align = alBottom
    TabOrder = 2
    object DBGridItens: TDBGrid
      Left = 1
      Top = 1
      Width = 398
      Height = 212
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
      Left = 399
      Top = 1
      Width = 389
      Height = 212
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
      object BtnFimEntrada: TButton
        Left = 26
        Top = 5
        Width = 141
        Height = 60
        Caption = 'Finalizar Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtnFimEntradaClick
      end
    end
  end
  object DSItens: TDataSource
    DataSet = CDSTemporario
    Left = 518
    Top = 298
  end
  object CDSTemporario: TClientDataSet
    PersistDataPacket.Data = {
      650000009619E0BD010000001800000005000000000003000000650008434F44
      5F50524F4404000100000000000451544445080004000000000008444553434F
      4E544F080004000000000005435553544F080004000000000005544F54414C08
      000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 447
    Top = 297
    object CDSTemporarioCOD_PROD: TIntegerField
      FieldName = 'COD_PROD'
    end
    object CDSTemporarioQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object CDSTemporarioDESCONTO: TFloatField
      FieldName = 'DESCONTO'
    end
    object CDSTemporarioCUSTO: TFloatField
      FieldName = 'CUSTO'
    end
    object CDSTemporarioTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
end
