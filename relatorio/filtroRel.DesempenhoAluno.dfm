inherited frmFiltroRelDesempAluno: TfrmFiltroRelDesempAluno
  ClientHeight = 353
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar1: TStatusBar
    Top = 334
  end
  inherited pnCentro: TPanel
    Height = 254
    inherited Panel1: TPanel
      Caption = 'Desempenho Aluno'
    end
    object rgResultado: TRadioGroup
      Left = 24
      Top = 120
      Width = 385
      Height = 105
      Caption = 'Resultado'
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Somente os aprovados'
        'Somente os reprovados')
      TabOrder = 1
    end
  end
  object FDRelatorio: TFDQuery
    OnCalcFields = FDRelatorioCalcFields
    Connection = DadosFirebird.FDDados
    SQL.Strings = (
      'select a.*, ad.*, d.descricao'
      'from aluno a'
      'left outer join aluno_disciplina ad on (ad.idaluno = a.idaluno)'
      
        'left outer join disciplina d on (d.iddisciplina = ad.iddisciplin' +
        'a)'
      'where 1=0'
      'order by a.nome')
    Left = 368
    Top = 32
    object FDRelatorioIDALUNO: TIntegerField
      FieldName = 'IDALUNO'
      Origin = 'IDALUNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDRelatorioNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object FDRelatorioIDALUNO_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDALUNO_1'
      Origin = 'IDALUNO'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDRelatorioIDDISCIPLINA: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'IDDISCIPLINA'
      Origin = 'IDDISCIPLINA'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDRelatorioNOTAPRIPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAPRIPER'
      Origin = 'NOTAPRIPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTASEGPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTASEGPER'
      Origin = 'NOTASEGPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTATERPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTATERPER'
      Origin = 'NOTATERPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTAQUAPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTAQUAPER'
      Origin = 'NOTAQUAPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTATRABPRIPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTATRABPRIPER'
      Origin = 'NOTATRABPRIPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTATRABSEGPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTATRABSEGPER'
      Origin = 'NOTATRABSEGPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTATRABTERPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTATRABTERPER'
      Origin = 'NOTATRABTERPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioNOTATRABQUAPER: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NOTATRABQUAPER'
      Origin = 'NOTATRABQUAPER'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDRelatorioDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDRelatorioMedia: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'Media'
      DisplayFormat = ',0.00'
      EditFormat = '0.00'
      Calculated = True
    end
  end
end
