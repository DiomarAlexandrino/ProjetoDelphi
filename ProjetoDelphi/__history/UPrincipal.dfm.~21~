object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Caption = 'FormPrincipal'
  ClientHeight = 340
  ClientWidth = 878
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
    Width = 878
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
      Left = 413
      Top = 14
      Width = 92
      Height = 21
      TabOrder = 0
      OnChange = EdPesquisaPedidoChange
    end
    object RGPesquisa: TRadioGroup
      Left = 200
      Top = 11
      Width = 183
      Height = 89
      Caption = 'Pesquisar'
      Items.Strings = (
        'Nome do Cliente'
        'C'#243'digo do CLiente'
        'Qtd Pedidos por C'#243'digo Cliente'
        'Soma de Pedidos por Clientes')
      TabOrder = 1
      OnClick = RGPesquisaClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 878
    Height = 235
    Align = alClient
    TabOrder = 1
    object DBGridPedidos: TDBGrid
      Left = 1
      Top = 1
      Width = 876
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
      Width = 876
      Height = 122
      Align = alBottom
      TabOrder = 1
      object Label2: TLabel
        Left = 9
        Top = 24
        Width = 88
        Height = 25
        Caption = 'Total dos Pedidos:'
      end
      object LBTotalPedidos: TLabel
        Left = 104
        Top = 24
        Width = 129
        Height = 17
      end
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
