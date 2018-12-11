inherited frmRelAlunoPorProf: TfrmRelAlunoPorProf
  Caption = 'frmRelAlunoPorProf'
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    DataSource = dsLocal
    inherited RLBand2: TRLBand
      Height = 34
      Borders.Sides = sdCustom
      Borders.DrawBottom = True
      ExplicitHeight = 34
      object RLLabel2: TRLLabel
        Left = 3
        Top = 2
        Width = 60
        Height = 15
        Caption = 'Professor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 28
        Top = 16
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
    end
    inherited RLBand3: TRLBand
      Top = 235
      Height = 0
      BandType = btColumnFooter
      ExplicitTop = 235
      ExplicitHeight = 0
    end
    inherited RLBand4: TRLBand
      Top = 251
      ExplicitTop = 251
    end
    inherited RLBand5: TRLBand
      Top = 235
      ExplicitTop = 235
      object RLDBResult2: TRLDBResult
        Left = 3
        Top = 2
        Width = 148
        Height = 14
        DataField = 'IDALUNO'
        DataSource = dsLocal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Holder = RLLabel2
        Info = riCount
        ParentFont = False
        Text = 'Quantidade Total:   '
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 163
      Width = 718
      Height = 72
      DataFields = 'IDPROFESSOR'
      object RLBand6: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btColumnHeader
        Color = 13948116
        ParentColor = False
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 3
          Top = 3
          Width = 88
          Height = 11
          DataField = 'NOMEPROFESSOR'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel2
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 16
        Width = 718
        Height = 16
        object RLDBText2: TRLDBText
          Left = 28
          Top = 2
          Width = 62
          Height = 11
          DataField = 'NOMEALUNO'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel4
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object RLBand8: TRLBand
        Left = 0
        Top = 32
        Width = 718
        Height = 16
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 3
          Top = 0
          Width = 194
          Height = 14
          DataField = 'IDALUNO'
          DataSource = dsLocal
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Holder = RLLabel2
          Info = riCount
          ParentFont = False
          Text = 'Quantidade do Professor:   '
        end
      end
    end
  end
end
