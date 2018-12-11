inherited frmRelDesempAluno: TfrmRelDesempAluno
  Caption = 'frmRelDesempAluno'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Left = -40
    Width = 1123
    Height = 794
    DataSource = dsLocal
    PageSetup.Orientation = poLandscape
    ExplicitLeft = -40
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited RLBand1: TRLBand
      Width = 1047
      ExplicitWidth = 1047
      inherited lbSubTitulo: TRLLabel
        Left = 152
        Width = 851
        ExplicitLeft = 152
        ExplicitWidth = 851
      end
      inherited lbTitulo: TRLLabel
        Left = 152
        Width = 851
        ExplicitLeft = 152
        ExplicitWidth = 851
      end
      inherited RLSystemInfo2: TRLSystemInfo
        Left = 958
        ExplicitLeft = 958
      end
      inherited RLLabel3: TRLLabel
        Left = 976
        ExplicitLeft = 976
      end
    end
    inherited RLBand2: TRLBand
      Width = 1047
      Height = 36
      Borders.Sides = sdCustom
      Borders.DrawBottom = True
      ExplicitWidth = 1047
      ExplicitHeight = 36
      object RLLabel2: TRLLabel
        Left = 6
        Top = 0
        Width = 35
        Height = 15
        Caption = 'Aluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 22
        Top = 17
        Width = 58
        Height = 15
        Caption = 'Disciplina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel5: TRLLabel
        Left = 294
        Top = 17
        Width = 54
        Height = 15
        Alignment = taRightJustify
        Caption = 'Nota 1'#186' P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel6: TRLLabel
        Left = 360
        Top = 17
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = 'Trab. 1'#186' P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel7: TRLLabel
        Left = 509
        Top = 17
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = 'Trab. 2'#186' P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 443
        Top = 17
        Width = 54
        Height = 15
        Alignment = taRightJustify
        Caption = 'Nota 2'#186' P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 654
        Top = 17
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = 'Trab. 3'#186' P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 588
        Top = 17
        Width = 54
        Height = 15
        Alignment = taRightJustify
        Caption = 'Nota 3'#186' P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel11: TRLLabel
        Left = 738
        Top = 17
        Width = 54
        Height = 15
        Alignment = taRightJustify
        Caption = 'Nota 4'#186' P'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel12: TRLLabel
        Left = 804
        Top = 17
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = 'Trab. 4'#186' P.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel13: TRLLabel
        Left = 891
        Top = 17
        Width = 37
        Height = 15
        Alignment = taRightJustify
        Caption = 'M'#233'dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel14: TRLLabel
        Left = 984
        Top = 17
        Width = 60
        Height = 15
        Alignment = taRightJustify
        Caption = 'Resultado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    inherited RLBand3: TRLBand
      Top = 233
      Width = 1047
      Height = 5
      BandType = btFooter
      ExplicitTop = 233
      ExplicitWidth = 1047
      ExplicitHeight = 5
    end
    inherited RLBand4: TRLBand
      Top = 238
      Width = 1047
      ExplicitTop = 238
      ExplicitWidth = 1047
      inherited lbRelCod: TRLLabel
        Left = 1025
        ExplicitLeft = 1025
      end
    end
    inherited RLBand5: TRLBand
      Top = 217
      Width = 1047
      Color = 16777164
      ParentColor = False
      Transparent = False
      ExplicitTop = 217
      ExplicitWidth = 1047
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 165
      Width = 1047
      Height = 52
      DataFields = 'IDALUNO'
      object RLBand6: TRLBand
        Left = 0
        Top = 16
        Width = 1047
        Height = 18
        BeforePrint = RLBand6BeforePrint
        object RLDBText1: TRLDBText
          Left = 22
          Top = 3
          Width = 59
          Height = 12
          DataField = 'DESCRICAO'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel4
          ParentFont = False
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 304
          Top = 3
          Width = 44
          Height = 12
          Alignment = taRightJustify
          DataField = 'notapriper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel5
          ParentFont = False
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 448
          Top = 3
          Width = 49
          Height = 12
          Alignment = taRightJustify
          DataField = 'notasegper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel8
          ParentFont = False
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 597
          Top = 3
          Width = 45
          Height = 12
          Alignment = taRightJustify
          DataField = 'notaterper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel10
          ParentFont = False
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 743
          Top = 3
          Width = 49
          Height = 12
          Alignment = taRightJustify
          DataField = 'notaquaper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel11
          ParentFont = False
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 900
          Top = 3
          Width = 28
          Height = 12
          Alignment = taRightJustify
          DataField = 'media'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel13
          ParentFont = False
          Text = ''
        end
        object lbresultado: TRLLabel
          Left = 988
          Top = 2
          Width = 56
          Height = 14
          Alignment = taRightJustify
          Caption = 'resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel14
          ParentFont = False
          Transparent = False
        end
        object RLDBText7: TRLDBText
          Left = 360
          Top = 3
          Width = 60
          Height = 12
          Alignment = taRightJustify
          DataField = 'notatrabpriper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel6
          ParentFont = False
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 504
          Top = 3
          Width = 65
          Height = 12
          Alignment = taRightJustify
          DataField = 'notatrabsegper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel7
          ParentFont = False
          Text = ''
        end
        object RLDBText9: TRLDBText
          Left = 653
          Top = 3
          Width = 61
          Height = 12
          Alignment = taRightJustify
          DataField = 'notatrabterper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel9
          ParentFont = False
          Text = ''
        end
        object RLDBText10: TRLDBText
          Left = 799
          Top = 3
          Width = 65
          Height = 12
          Alignment = taRightJustify
          DataField = 'notatrabquaper'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Holder = RLLabel12
          ParentFont = False
          Text = ''
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 0
        Width = 1047
        Height = 16
        BandType = btColumnHeader
        Color = 13553358
        ParentColor = False
        Transparent = False
        BeforePrint = RLBand7BeforePrint
        object lbAluno: TRLLabel
          Left = 6
          Top = 1
          Width = 67
          Height = 14
          Caption = 'NomeAluno'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel2
          ParentFont = False
          Transparent = False
        end
      end
    end
  end
end
