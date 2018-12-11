object DadosFirebird: TDadosFirebird
  OldCreateOrder = False
  Height = 575
  Width = 1235
  object FDQuery: TFDQuery
    Connection = FDDados
    Left = 432
    Top = 24
  end
  object FDTransServidor: TFDTransaction
    Connection = FDDados
    Left = 168
    Top = 96
  end
  object FDGeral: TFDQuery
    Connection = FDDados
    Left = 336
    Top = 16
  end
  object FDComandoSQL: TFDQuery
    Connection = FDDados
    Left = 296
    Top = 88
  end
  object FDConsulta: TFDQuery
    Connection = FDDados
    Left = 264
    Top = 16
  end
  object FDDados: TFDConnection
    Params.Strings = (
      'Database=C:\TesteFortes\Conexao\UNIVERSIS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'DriverID=IB')
    LoginPrompt = False
    Transaction = FDTransServidor
    Left = 48
    Top = 24
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 56
    Top = 96
  end
  object FDCmd: TFDCommand
    Connection = FDDados
    Left = 40
    Top = 176
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 152
    Top = 24
  end
  object FDAluno: TFDQuery
    Connection = FDDados
    SQL.Strings = (
      'select * from aluno where 1=0')
    Left = 456
    Top = 112
    object FDAlunoIDALUNO: TIntegerField
      FieldName = 'IDALUNO'
      Origin = 'IDALUNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDAlunoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
  end
end
