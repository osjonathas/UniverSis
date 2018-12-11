object frmRelModelo: TfrmRelModelo
  Left = 0
  Top = 0
  Caption = 'frmRelModelo'
  ClientHeight = 449
  ClientWidth = 1259
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 168
    Top = 8
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 91
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
      BeforePrint = RLBand1BeforePrint
      object lbFiltro: TRLLabel
        Left = 3
        Top = 72
        Width = 40
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbSubTitulo: TRLLabel
        Left = 144
        Top = 34
        Width = 569
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbTitulo: TRLLabel
        Left = 144
        Top = 13
        Width = 569
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = 'Relatorio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 630
        Top = 72
        Width = 85
        Height = 15
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 648
        Top = 72
        Width = 28
        Height = 15
        Caption = 'P'#225'g.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object imgLogo: TRLImage
        Left = 7
        Top = 3
        Width = 133
        Height = 65
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 129
      Width = 718
      Height = 18
      BandType = btColumnHeader
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 147
      Width = 718
      Height = 56
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      Borders.FixedBottom = True
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 219
      Width = 718
      Height = 16
      BandType = btFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
      Borders.FixedTop = True
      object RLLabel1: TRLLabel
        Left = 2
        Top = 1
        Width = 69
        Height = 15
        Caption = 'Emitido em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 78
        Top = 1
        Width = 36
        Height = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Info = itNow
        ParentFont = False
        Text = ''
      end
      object lbRelCod: TRLLabel
        Left = 705
        Top = 0
        Width = 12
        Height = 15
        Alignment = taRightJustify
        Caption = 'R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 203
      Width = 718
      Height = 16
      BandType = btSummary
    end
  end
  object dsLocal: TDataSource
    DataSet = qLocal
    Left = 288
    Top = 272
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 656
    Top = 256
  end
  object qLocal: TFDQuery
    Left = 520
    Top = 296
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport Community Edition v4.0 \251 Copyright '#169' 1999-2016 F' +
      'ortes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 416
    Top = 296
  end
end
