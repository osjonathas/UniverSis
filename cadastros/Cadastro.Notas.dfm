inherited frmCadLancNotas: TfrmCadLancNotas
  Caption = 'Lan'#231'amento de Notas'
  ClientHeight = 413
  ClientWidth = 954
  ExplicitWidth = 970
  ExplicitHeight = 452
  PixelsPerInch = 96
  TextHeight = 14
  inherited Image2: TImage
    Width = 954
    Height = 394
  end
  inherited pnCentralCadastro: TPanel
    Width = 954
    Height = 394
    inherited pgCadastro: TPageControl
      Width = 954
      Height = 285
      ActivePage = tsDadosCad
      inherited tsPesquisa: TTabSheet
        inherited gridPesquisa: TDBGrid
          Width = 946
          Height = 229
        end
        inherited pnResultado: TPanel
          Width = 946
        end
      end
      inherited tsDadosCad: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 29
        ExplicitWidth = 693
        ExplicitHeight = 252
        object Label1: TLabel
          Left = 16
          Top = 35
          Width = 118
          Height = 14
          CustomHint = BalloonHint1
          Caption = 'Disciplinas que leciona'
          Font.Charset = ANSI_CHARSET
          Font.Color = 12016384
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbNomeAluno: TLabel
          Left = 16
          Top = 2
          Width = 665
          Height = 23
          CustomHint = BalloonHint1
          AutoSize = False
          Caption = 'Nome Aluno'
          Font.Charset = ANSI_CHARSET
          Font.Color = 12016384
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object gridDisciplinas: TDBGrid
          Left = 0
          Top = 56
          Width = 914
          Height = 193
          CustomHint = BalloonHint1
          DataSource = dsAlunoDisc
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = 12016384
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              ReadOnly = True
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IdDisciplina'
              ReadOnly = True
              Title.Caption = 'C'#243'd Disc.'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              ReadOnly = True
              Title.Caption = 'Descri'#231#227'o'
              Width = 215
              Visible = True
            end
            item
              Color = 16777139
              Expanded = False
              FieldName = 'NotaPriPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'N1'
              Width = 64
              Visible = True
            end
            item
              Color = 16757092
              Expanded = False
              FieldName = 'NotaTrabPriPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'Trab. 1'
              Width = 64
              Visible = True
            end
            item
              Color = 16777139
              Expanded = False
              FieldName = 'NotaSegPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'N2'
              Width = 64
              Visible = True
            end
            item
              Color = 16757092
              Expanded = False
              FieldName = 'NotaTrabSegPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'Trab. 2'
              Width = 64
              Visible = True
            end
            item
              Color = 16777139
              Expanded = False
              FieldName = 'NotaTerPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'N3'
              Width = 64
              Visible = True
            end
            item
              Color = 16757092
              Expanded = False
              FieldName = 'NotaTrabTerPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'Trab. 3'
              Width = 64
              Visible = True
            end
            item
              Color = 16777139
              Expanded = False
              FieldName = 'NotaQuaPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'N4'
              Width = 64
              Visible = True
            end
            item
              Color = 16757092
              Expanded = False
              FieldName = 'NotaTrabQuaPer'
              Font.Charset = ANSI_CHARSET
              Font.Color = -1
              Font.Height = -12
              Font.Name = 'Tahoma'
              Font.Style = []
              Title.Alignment = taRightJustify
              Title.Caption = 'Trab. 4'
              Width = 64
              Visible = True
            end
            item
              Color = 11776870
              Expanded = False
              FieldName = 'Media'
              ReadOnly = True
              Title.Alignment = taRightJustify
              Title.Caption = 'M'#233'dia'
              Width = 68
              Visible = True
            end>
        end
      end
    end
    inherited pnBotoes: TPanel
      Width = 954
      ExplicitLeft = 24
      ExplicitTop = -6
      ExplicitWidth = 701
      inherited btIncluir: TSpeedButton
        Left = 1012
        Enabled = False
        Visible = False
        ExplicitLeft = 1012
      end
      inherited btAlterar: TSpeedButton
        Left = 143
        ExplicitLeft = 143
      end
      inherited btCancelar: TSpeedButton
        Left = 150
        ExplicitLeft = 150
      end
      inherited btExcluir: TSpeedButton
        Left = 1064
        Top = 18
        Enabled = False
        Visible = False
        ExplicitLeft = 1064
        ExplicitTop = 18
      end
      inherited btPesquisar: TSpeedButton
        Left = 1018
        ExplicitLeft = 1018
      end
      inherited lbTitulo: TLabel
        Top = 75
        Width = 207
        Caption = 'Lan'#231'amento de Notas'
        ExplicitTop = 75
        ExplicitWidth = 207
      end
      inherited btSair: TSpeedButton
        Left = 222
        ExplicitLeft = 222
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 394
    Width = 954
  end
  inherited dsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 528
    Top = 32
  end
  object cdsPesquisa: TClientDataSet
    PersistDataPacket.Data = {
      430000009619E0BD010000001800000002000000000003000000430007496441
      6C756E6F0400010000000000044E6F6D65010049000000010005574944544802
      00020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IdAluno'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 440
    Top = 32
    object cdsPesquisaIdAluno: TIntegerField
      FieldName = 'IdAluno'
    end
    object cdsPesquisaNome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
  end
  object dsAlunoDisc: TDataSource
    DataSet = cdsAlunoDisc
    Left = 520
    Top = 104
  end
  object cdsAlunoDisc: TClientDataSet
    PersistDataPacket.Data = {
      A50100009619E0BD01000000180000000B000000000003000000A50107496441
      6C756E6F04000100000000000C49644469736369706C696E6104000100000000
      000A4E6F74615072695065720800040000000100075355425459504502004900
      06004D6F6E6579000A4E6F746153656750657208000400000001000753554254
      5950450200490006004D6F6E6579000A4E6F7461546572506572080004000000
      010007535542545950450200490006004D6F6E6579000A4E6F74615175615065
      72080004000000010007535542545950450200490006004D6F6E6579000E4E6F
      7461547261625072695065720800040000000100075355425459504502004900
      06004D6F6E6579000E4E6F746154726162536567506572080004000000010007
      535542545950450200490006004D6F6E6579000E4E6F74615472616254657250
      6572080004000000010007535542545950450200490006004D6F6E6579000E4E
      6F74615472616251756150657208000400000001000753554254595045020049
      0006004D6F6E6579000944657363726963616F01004900000001000557494454
      480200020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IdAluno'
        DataType = ftInteger
      end
      item
        Name = 'IdDisciplina'
        DataType = ftInteger
      end
      item
        Name = 'NotaPriPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaSegPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaTerPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaQuaPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaTrabPriPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaTrabSegPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaTrabTerPer'
        DataType = ftCurrency
      end
      item
        Name = 'NotaTrabQuaPer'
        DataType = ftCurrency
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = cdsAlunoDiscCalcFields
    Left = 432
    Top = 104
    object cdsAlunoDiscIdAluno: TIntegerField
      FieldName = 'IdAluno'
    end
    object cdsAlunoDiscIdDisciplina: TIntegerField
      FieldName = 'IdDisciplina'
    end
    object cdsAlunoDiscNotaPriPer: TCurrencyField
      FieldName = 'NotaPriPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaSegPer: TCurrencyField
      FieldName = 'NotaSegPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaTerPer: TCurrencyField
      FieldName = 'NotaTerPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaQuaPer: TCurrencyField
      FieldName = 'NotaQuaPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaTrabPriPer: TCurrencyField
      FieldName = 'NotaTrabPriPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaTrabSegPer: TCurrencyField
      FieldName = 'NotaTrabSegPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaTrabTerPer: TCurrencyField
      FieldName = 'NotaTrabTerPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscNotaTrabQuaPer: TCurrencyField
      FieldName = 'NotaTrabQuaPer'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
    end
    object cdsAlunoDiscDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
    object cdsAlunoDiscMedia: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Media'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Calculated = True
    end
  end
end
