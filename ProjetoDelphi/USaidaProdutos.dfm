object FormSaidaPed: TFormSaidaPed
  Left = 0
  Top = 0
  Caption = 'Sa'#237'da de Pedidos'
  ClientHeight = 326
  ClientWidth = 681
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
    Width = 681
    Height = 131
    Align = alTop
    TabOrder = 0
    object Label3: TLabel
      Left = 276
      Top = 87
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
    object LBCod: TLabel
      Left = 307
      Top = 53
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
    object Label5: TLabel
      Left = 271
      Top = 24
      Width = 92
      Height = 23
      Caption = 'ESTOQUE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LBCodProd: TLabel
      Left = 369
      Top = 53
      Width = 31
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LBQtd: TLabel
      Left = 369
      Top = 87
      Width = 31
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object PageControlPesquisa: TPageControl
      Left = 1
      Top = 1
      Width = 264
      Height = 129
      ActivePage = TabSheet2
      Align = alLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      ExplicitHeight = 135
      object TabSheet2: TTabSheet
        Caption = 'Pesquisa:'
        ImageIndex = 1
        object Label1: TLabel
          Left = 135
          Top = 3
          Width = 65
          Height = 19
          Caption = 'Pesquisar'
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
    object PageControl1: TPageControl
      Left = 432
      Top = 1
      Width = 248
      Height = 129
      ActivePage = Compra
      Align = alRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitHeight = 135
      object Compra: TTabSheet
        Caption = 'Pedido '
        object Label2: TLabel
          Left = 19
          Top = 3
          Width = 86
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
          Left = 61
          Top = 34
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
        object EdQtd: TEdit
          Left = 126
          Top = 3
          Width = 89
          Height = 22
          TabOrder = 0
        end
        object BtnAdd: TButton
          Left = 11
          Top = 59
          Width = 206
          Height = 28
          Caption = 'Confirmar Venda'
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
          Left = 126
          Top = 28
          Width = 88
          Height = 25
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
  object Panel2: TPanel
    Left = 0
    Top = 131
    Width = 681
    Height = 101
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -24
    ExplicitTop = 138
    ExplicitWidth = 675
    ExplicitHeight = 134
    object DBGridSaidaProd: TDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 99
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
  object Panel3: TPanel
    Left = 0
    Top = 232
    Width = 681
    Height = 94
    Align = alBottom
    TabOrder = 2
    object DBGridItens: TDBGrid
      Left = 1
      Top = 1
      Width = 679
      Height = 92
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object FDQItens: TFDQuery
    Left = 464
    Top = 272
    object FDQItensCodigo: TIntegerField
      FieldName = 'Codigo'
    end
  end
end
