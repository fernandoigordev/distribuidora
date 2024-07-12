inherited ViewPageSessao: TViewPageSessao
  Caption = 'ViewPageSessao'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControlCadastro: TPageControl
    ActivePage = TabSheetCadastro
    inherited TabSheetCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 6
      ExplicitWidth = 746
      ExplicitHeight = 331
      inherited ScrollBoxCadastro: TScrollBox
        object Label1: TLabel
          Left = 16
          Top = 10
          Width = 55
          Height = 16
          Caption = 'Descri'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object DBEditDescricao: TDBEdit
          Left = 16
          Top = 32
          Width = 393
          Height = 24
          DataField = 'Descricao'
          DataSource = DataSourceCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  inherited DataSourceCadastro: TDataSource
    Left = 472
    Top = 64
  end
end
