object FormCadCliente: TFormCadCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 508
  ClientWidth = 591
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
    Width = 591
    Height = 57
    Align = alTop
    TabOrder = 0
    object DBNavigatorCli: TDBNavigator
      Left = 1
      Top = 1
      Width = 589
      Height = 55
      DataSource = DMDados.DSClientes
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 57
    Width = 591
    Height = 451
    Align = alClient
    TabOrder = 1
    object Panel3: TPanel
      Left = 1
      Top = 128
      Width = 589
      Height = 322
      Align = alBottom
      TabOrder = 0
      ExplicitLeft = -7
      ExplicitTop = 134
      object Label1: TLabel
        Left = 5
        Top = 13
        Width = 63
        Height = 13
        Caption = 'CODIGO_CLI'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 5
        Top = 56
        Width = 29
        Height = 13
        Caption = 'NOME'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 5
        Top = 96
        Width = 50
        Height = 13
        Caption = 'CPF_CNPJ'
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 5
        Top = 136
        Width = 38
        Height = 13
        Caption = 'CIDADE'
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 5
        Top = 176
        Width = 13
        Height = 13
        Caption = 'UF'
        FocusControl = DBEdit5
      end
      object DBEdit1: TDBEdit
        Left = 5
        Top = 32
        Width = 134
        Height = 21
        DataField = 'CODIGO_CLI'
        DataSource = DMDados.DSClientes
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 5
        Top = 72
        Width = 914
        Height = 21
        DataField = 'NOME'
        DataSource = DMDados.DSClientes
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 5
        Top = 112
        Width = 199
        Height = 21
        DataField = 'CPF_CNPJ'
        DataSource = DMDados.DSClientes
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 5
        Top = 152
        Width = 654
        Height = 21
        DataField = 'CIDADE'
        DataSource = DMDados.DSClientes
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 5
        Top = 192
        Width = 30
        Height = 21
        DataField = 'UF'
        DataSource = DMDados.DSClientes
        TabOrder = 4
      end
    end
    object DBGridClientes: TDBGrid
      Left = 1
      Top = 1
      Width = 589
      Height = 127
      Align = alClient
      DataSource = DMDados.DSClientes
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
end
