object FormEntProd: TFormEntProd
  Left = 0
  Top = 0
  Caption = 'Entrada de Produtos'
  ClientHeight = 422
  ClientWidth = 878
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
    Width = 878
    Height = 153
    Align = alTop
    TabOrder = 0
    object LBCod: TLabel
      Left = 333
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
    object LBCodProd: TLabel
      Left = 395
      Top = 53
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LBQtd: TLabel
      Left = 395
      Top = 87
      Width = 5
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 302
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
    object Label5: TLabel
      Left = 297
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
    object PageControl1: TPageControl
      Left = 496
      Top = 1
      Width = 381
      Height = 152
      ActivePage = Compra
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Compra: TTabSheet
        Caption = 'Compra'
        object Label2: TLabel
          Left = 3
          Top = 16
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
          Left = 44
          Top = 50
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
          Left = 104
          Top = 17
          Width = 89
          Height = 23
          TabOrder = 0
          OnChange = EdPesquisaChange
        end
        object BtnAdd: TButton
          Left = 3
          Top = 75
          Width = 190
          Height = 28
          Caption = 'Confirmar Compra'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = BtnAddClick
        end
      end
    end
    object PageControlPesquisa: TPageControl
      Left = 1
      Top = 1
      Width = 288
      Height = 151
      ActivePage = TabSheet2
      Align = alLeft
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitLeft = -343
      ExplicitTop = 27
      ExplicitHeight = 102
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 153
    Width = 878
    Height = 269
    Align = alClient
    TabOrder = 1
    ExplicitTop = 305
    ExplicitHeight = 117
    object Panel3: TPanel
      Left = 1
      Top = 168
      Width = 876
      Height = 100
      Align = alBottom
      TabOrder = 0
      ExplicitTop = 192
      ExplicitWidth = 672
    end
    object DBGridEntProd: TDBGrid
      Left = 1
      Top = 1
      Width = 876
      Height = 167
      Align = alClient
      DataSource = DMDados.DSProdutos
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = DBGridEntProdCellClick
    end
  end
  object EdCusto: TEdit
    Left = 604
    Top = 76
    Width = 89
    Height = 26
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnChange = EdPesquisaChange
  end
end