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
      Top = 9
      Width = 139
      Height = 16
      Caption = 'Rela'#231#227'o de Pedidos por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object LbPesquisa: TLabel
      Left = 471
      Top = 21
      Width = 55
      Height = 16
      Caption = 'Pesquisa:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object EdPesquisaPedido: TEdit
      Left = 471
      Top = 43
      Width = 92
      Height = 21
      TabOrder = 0
      Text = '3'
      OnChange = EdPesquisaPedidoChange
    end
    object PageControlPesquisa: TPageControl
      Left = 201
      Top = 1
      Width = 264
      Height = 99
      ActivePage = TabSheet1
      TabOrder = 1
      OnChange = PageControlPesquisaChange
      object TabSheet1: TTabSheet
        Caption = 'Pesquisa por C'#243'digo'
        object RGPesquisaCod: TRadioGroup
          Left = 37
          Top = -11
          Width = 223
          Height = 85
          Caption = 'Pesquisar'
          Items.Strings = (
            'a - Qtd Pedidos por C'#243'digo Cliente '
            'c - Soma de Pedidos s/desconto '
            'd - Lucro de Pedidos pendentes')
          TabOrder = 0
          OnClick = RGPesquisaCodClick
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Pesquisa por Nome'
        ImageIndex = 1
        object RGPesquisaNome: TRadioGroup
          Left = 3
          Top = 8
          Width = 185
          Height = 31
          Items.Strings = (
            'b - Nome do Cliente')
          TabOrder = 0
          OnClick = RGPesquisaNomeClick
        end
      end
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
        Left = 6
        Top = 56
        Width = 214
        Height = 18
        Caption = 'e - Cliente que gera maior Lucro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object LBMaiorReceita: TLabel
        Left = 213
        Top = 24
        Width = 3
        Height = 13
      end
      object Label4: TLabel
        Left = 6
        Top = 24
        Width = 201
        Height = 18
        Caption = '1 Produto Com maior Receita: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 361
        Top = 24
        Width = 201
        Height = 18
        Caption = '2 Produto Com maior Receita: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
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
