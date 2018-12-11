inherited frmCadDisciplina: TfrmCadDisciplina
  ClientHeight = 413
  ClientWidth = 701
  ExplicitWidth = 717
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 14
  inherited Image2: TImage
    Width = 701
    Height = 394
    ExplicitWidth = 701
    ExplicitHeight = 394
  end
  inherited pnCentralCadastro: TPanel
    Width = 701
    Height = 394
    ExplicitWidth = 701
    ExplicitHeight = 394
    inherited pgCadastro: TPageControl
      Width = 701
      Height = 285
      ExplicitWidth = 701
      ExplicitHeight = 285
      inherited tsPesquisa: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 29
        ExplicitWidth = 693
        ExplicitHeight = 252
        inherited gridPesquisa: TDBGrid
          Width = 693
          Height = 229
          Columns = <
            item
              Expanded = False
              FieldName = 'IdDisciplina'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 568
              Visible = True
            end>
        end
        inherited pnResultado: TPanel
          Width = 693
          ExplicitTop = 0
          ExplicitWidth = 693
        end
      end
      inherited tsDadosCad: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 29
        ExplicitWidth = 693
        ExplicitHeight = 252
        object Label18: TLabel
          Left = 27
          Top = 35
          Width = 37
          Height = 14
          CustomHint = BalloonHint1
          Caption = 'C'#243'digo'
          Font.Charset = ANSI_CHARSET
          Font.Color = 12016384
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 27
          Top = 61
          Width = 51
          Height = 14
          CustomHint = BalloonHint1
          Caption = 'Descri'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = 12016384
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object edtCodigo: TEdit
          Left = 107
          Top = 32
          Width = 120
          Height = 22
          CustomHint = BalloonHint1
          TabOrder = 0
        end
        object edtDescricao: TEdit
          Left = 107
          Top = 60
          Width = 525
          Height = 22
          CustomHint = BalloonHint1
          TabOrder = 1
        end
      end
    end
    inherited pnBotoes: TPanel
      Width = 701
      ExplicitWidth = 701
      inherited lbTitulo: TLabel
        Width = 103
        Caption = 'Disciplinas'
        ExplicitWidth = 103
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 394
    Width = 701
    ExplicitTop = 394
    ExplicitWidth = 701
  end
  inherited dsPesquisa: TDataSource
    DataSet = cdsPesquisa
  end
  object cdsPesquisa: TClientDataSet
    PersistDataPacket.Data = {
      4D0000009619E0BD0100000018000000020000000000030000004D000C496444
      69736369706C696E6104000100000000000944657363726963616F0100490000
      0001000557494454480200020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IdDisciplina'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 432
    Top = 296
    object cdsPesquisaIdDisciplina: TIntegerField
      FieldName = 'IdDisciplina'
    end
    object cdsPesquisaDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
end
