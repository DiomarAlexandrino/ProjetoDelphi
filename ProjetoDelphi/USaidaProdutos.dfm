object FormSaidaPed: TFormSaidaPed
  Left = 0
  Top = 0
  Caption = 'Sa'#237'da de Pedidos'
  ClientHeight = 326
  ClientWidth = 845
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
    Width = 845
    Height = 97
    Align = alTop
    TabOrder = 0
    object PageControlPesquisa: TPageControl
      Left = 1
      Top = 1
      Width = 264
      Height = 95
      ActivePage = TabSheet2
      Align = alLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object TabSheet2: TTabSheet
        ImageIndex = 1
        object Label1: TLabel
          Left = 126
          Top = 3
          Width = 121
          Height = 19
          Caption = 'Pesquisar Produto'
        end
        object RGPesquisa: TRadioGroup
          Left = 3
          Top = 0
          Width = 102
          Height = 65
          Align = alCustom
          ItemIndex = 0
          Items.Strings = (
            'Nome'
            'C'#243'digo')
          TabOrder = 0
        end
        object EdPesquisa: TEdit
          Left = 118
          Top = 28
          Width = 137
          Height = 27
          TabOrder = 1
          OnChange = EdPesquisaChange
        end
      end
    end
    object Panel5: TPanel
      Left = 265
      Top = 1
      Width = 303
      Height = 95
      Align = alClient
      Caption = 'Panel5'
      TabOrder = 1
      object DBGridSaidaProd: TDBGrid
        Left = 1
        Top = 1
        Width = 301
        Height = 93
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
      Left = 568
      Top = 1
      Width = 276
      Height = 95
      Align = alRight
      TabOrder = 2
      object Label5: TLabel
        Left = 6
        Top = 17
        Width = 175
        Height = 18
        Caption = 'Quantidade em Estoque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 6
        Top = 41
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
        Top = 41
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 97
    Width = 845
    Height = 111
    Align = alClient
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 843
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
          Left = 19
          Top = 42
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
          Left = 237
          Top = 42
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
          Left = 49
          Top = 3
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
          Top = 3
          Width = 5
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object EdQtd: TEdit
          Left = 126
          Top = 35
          Width = 89
          Height = 26
          TabOrder = 0
          OnChange = EdQtdChange
        end
        object BtnAdd: TButton
          Left = 423
          Top = 35
          Width = 98
          Height = 28
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
          Left = 302
          Top = 35
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
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 208
    Width = 845
    Height = 118
    Align = alBottom
    TabOrder = 2
    object DBGridItens: TDBGrid
      Left = 1
      Top = 1
      Width = 633
      Height = 116
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
      Left = 634
      Top = 1
      Width = 210
      Height = 116
      Align = alRight
      TabOrder = 1
      object Button1: TButton
        Left = 24
        Top = 5
        Width = 121
        Height = 36
        Caption = 'Finalizar Venda'
        TabOrder = 0
        OnClick = Button1Click
      end
    end
  end
  object CDSTemporario: TClientDataSet
    PersistDataPacket.Data = {
      570000009619E0BD01000000180000000400000000000300000057000B434F44
      5F50524F4455544F040001000000000004515444450400010000000000055641
      4C4F52080004000000000005544F54414C08000400000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COD_PRODUTO'
        DataType = ftInteger
      end
      item
        Name = 'QTDE'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 360
    Top = 208
    object CDSTemporarioCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object CDSTemporarioQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object CDSTemporarioVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object CDSTemporarioTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object DSItens: TDataSource
    DataSet = CDSTemporario
    Left = 440
    Top = 208
  end
end
