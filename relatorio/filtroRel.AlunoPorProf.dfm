inherited frmFiltroRelAlunPorProf: TfrmFiltroRelAlunPorProf
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnCentro: TPanel
    inherited Panel1: TPanel
      Caption = 'Alunos Por Professor'
    end
  end
  object cdsRelatorio: TClientDataSet
    PersistDataPacket.Data = {
      7E0000009619E0BD0100000018000000040000000000030000007E000B496450
      726F666573736F7204000100000000000D4E6F6D6550726F666573736F720100
      490000000100055749445448020002003200074964416C756E6F040001000000
      0000094E6F6D65416C756E6F0100490000000100055749445448020002003200
      0000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IdProfessor'
        DataType = ftInteger
      end
      item
        Name = 'NomeProfessor'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IdAluno'
        DataType = ftInteger
      end
      item
        Name = 'NomeAluno'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 328
    Top = 144
    object cdsRelatorioIdProfessor: TIntegerField
      FieldName = 'IdProfessor'
    end
    object cdsRelatorioNomeProfessor: TStringField
      FieldName = 'NomeProfessor'
      Size = 50
    end
    object cdsRelatorioIdAluno: TIntegerField
      FieldName = 'IdAluno'
    end
    object cdsRelatorioNomeAluno: TStringField
      FieldName = 'NomeAluno'
      Size = 50
    end
  end
end
