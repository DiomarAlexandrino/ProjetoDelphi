object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 340
  ClientWidth = 548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 548
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 14
      Width = 116
      Height = 13
      Caption = 'Rela'#231#227'o de Pedidos por:'
    end
    object EdPesquisaPedido: TEdit
      Left = 357
      Top = 11
      Width = 92
      Height = 21
      TabOrder = 0
      OnChange = EdPesquisaPedidoChange
    end
    object RGPesquisa: TRadioGroup
      Left = 200
      Top = 11
      Width = 151
      Height = 54
      Caption = 'Pesquisar'
      Items.Strings = (
        'Nome do Cliente'
        'C'#243'digo do CLiente')
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 548
    Height = 235
    Align = alClient
    TabOrder = 1
    ExplicitTop = 41
    ExplicitHeight = 299
    object DBGridPedidos: TDBGrid
      Left = 1
      Top = 1
      Width = 546
      Height = 111
      Align = alClient
      DataSource = DMDados.DSPedidos
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Panel3: TPanel
      Left = 1
      Top = 112
      Width = 546
      Height = 122
      Align = alBottom
      TabOrder = 1
      ExplicitTop = 176
    end
  end
  object MainMenu1: TMainMenu
    Left = 16
    Top = 16
    object formPrincipal: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
    end
  end
end
