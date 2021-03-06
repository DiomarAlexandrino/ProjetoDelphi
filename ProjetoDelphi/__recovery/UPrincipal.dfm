object FormControlePedidos: TFormControlePedidos
  Left = 0
  Top = 0
  Caption = 'Controle de Pedidos'
  ClientHeight = 340
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Times New Roman'
  Font.Style = [fsBold]
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 22
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 878
    Height = 105
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 2
      Top = 18
      Width = 197
      Height = 19
      Caption = 'Rela'#231#227'o de Pedidos por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LbPesquisa: TLabel
      Left = 514
      Top = 5
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
      Left = 503
      Top = 27
      Width = 92
      Height = 30
      TabOrder = 0
      OnChange = EdPesquisaPedidoChange
    end
    object PageControlPesquisa: TPageControl
      Left = 201
      Top = 1
      Width = 296
      Height = 99
      ActivePage = TabSheet2
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnChange = PageControlPesquisaChange
      object TabSheet1: TTabSheet
        Caption = 'Pesquisa por C'#243'digo'
        object RGPesquisaCod: TRadioGroup
          Left = -4
          Top = -17
          Width = 264
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
          Left = 0
          Top = -26
          Width = 289
          Height = 95
          Items.Strings = (
            'b - Nome do Cliente')
          TabOrder = 0
          OnClick = RGPesquisaNomeClick
        end
      end
    end
    object Button1: TButton
      Left = 14
      Top = 43
      Width = 149
      Height = 25
      Caption = 'i : Produtos s/Estoque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 14
      Top = 71
      Width = 149
      Height = 25
      Caption = 'i : Produtos s/Estoque'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
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
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Times New Roman'
      TitleFont.Style = [fsBold]
    end
    object Panel3: TPanel
      Left = 1
      Top = 112
      Width = 876
      Height = 122
      Align = alBottom
      TabOrder = 1
      ExplicitLeft = -39
      ExplicitTop = -3
      object Label2: TLabel
        Left = 550
        Top = 6
        Width = 307
        Height = 23
        Caption = 'e - Cliente que gera maior Lucro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBClienteLucro: TLabel
        Left = 624
        Top = 42
        Width = 6
        Height = 23
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PageControl1: TPageControl
        Left = 31
        Top = 6
        Width = 506
        Height = 76
        ActivePage = TabSheet3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object TabSheet3: TTabSheet
          Caption = '       ***    Ranking dos produtos com maiores receitas ***     '
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Times New Roman'
          Font.Style = [fsBold]
          ParentFont = False
          object Label4: TLabel
            Left = 3
            Top = 3
            Width = 112
            Height = 23
            Caption = 'f -  Primeiro: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LBMaiorReceita: TLabel
            Left = 121
            Top = 3
            Width = 6
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 248
            Top = 3
            Width = 112
            Height = 23
            Caption = 'g - Segundo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object LBReceitaProd2: TLabel
            Left = 376
            Top = 3
            Width = 6
            Height = 23
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 168
    Top = 48
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
    object Pedidos1: TMenuItem
      Caption = 'Pedidos'
      object Entradas1: TMenuItem
        Caption = 'Entradas'
        OnClick = Entradas1Click
      end
      object Sadas1: TMenuItem
        Caption = 'Sa'#237'das'
        OnClick = Sadas1Click
      end
    end
  end
end
