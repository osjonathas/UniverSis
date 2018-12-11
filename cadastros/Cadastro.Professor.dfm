inherited frmCadProfessor: TfrmCadProfessor
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
      ActivePage = tsDadosCad
      ExplicitWidth = 701
      ExplicitHeight = 285
      inherited tsPesquisa: TTabSheet
        ExplicitWidth = 693
        ExplicitHeight = 252
        inherited gridPesquisa: TDBGrid
          Width = 693
          Height = 229
          Columns = <
            item
              Expanded = False
              FieldName = 'IdProfessor'
              Title.Caption = 'C'#243'digo'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome'
              Visible = True
            end>
        end
        inherited pnResultado: TPanel
          Width = 693
          ExplicitWidth = 693
        end
      end
      inherited tsDadosCad: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 29
        ExplicitWidth = 693
        ExplicitHeight = 252
        object Label18: TLabel
          Left = 41
          Top = 27
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
          Left = 41
          Top = 53
          Width = 32
          Height = 14
          CustomHint = BalloonHint1
          Caption = 'Nome'
          Font.Charset = ANSI_CHARSET
          Font.Color = 12016384
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 41
          Top = 101
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
        object edtCodigo: TEdit
          Left = 121
          Top = 24
          Width = 120
          Height = 22
          CustomHint = BalloonHint1
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 121
          Top = 52
          Width = 525
          Height = 22
          CustomHint = BalloonHint1
          TabOrder = 1
        end
        object gridDisciplinas: TDBGrid
          Left = 41
          Top = 120
          Width = 605
          Height = 120
          CustomHint = BalloonHint1
          DataSource = dsProfessorDisc
          ReadOnly = True
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = 12016384
          TitleFont.Height = -12
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'IdDisciplina'
              Title.Caption = 'C'#243'd. Disciplina'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end>
        end
        object btAdd: TButton
          Left = 490
          Top = 97
          Width = 75
          Height = 20
          CustomHint = BalloonHint1
          Caption = 'Adicionar'
          TabOrder = 3
          OnClick = btAddClick
        end
        object btRem: TButton
          Left = 571
          Top = 97
          Width = 75
          Height = 20
          CustomHint = BalloonHint1
          Caption = 'Remover'
          TabOrder = 4
          OnClick = btRemClick
        end
      end
    end
    inherited pnBotoes: TPanel
      Width = 701
      ExplicitWidth = 701
      inherited lbTitulo: TLabel
        Width = 90
        Caption = 'Professor'
        ExplicitWidth = 90
      end
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 394
    Width = 701
    ExplicitTop = 394
    ExplicitWidth = 701
  end
  object pnAddDisciplinas: TPanel [3]
    Left = 99
    Top = 224
    Width = 431
    Height = 345
    CustomHint = BalloonHint1
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvSpace
    ParentBackground = False
    TabOrder = 2
    Visible = False
    object pnTitulo: TJvGradientHeaderPanel
      Left = 2
      Top = 2
      Width = 423
      Height = 56
      CustomHint = BalloonHint1
      GradientStartColor = 7819808
      GradientStyle = grHorizontal
      LabelCaption = '  '
      LabelFont.Charset = DEFAULT_CHARSET
      LabelFont.Color = clWhite
      LabelFont.Height = -13
      LabelFont.Name = 'Tahoma'
      LabelFont.Style = [fsBold]
      LabelAlignment = taLeftJustify
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TabOrder = 0
      DesignSize = (
        423
        56)
      object Label40: TLabel
        Left = 7
        Top = 15
        Width = 250
        Height = 21
        CustomHint = BalloonHint1
        AutoSize = False
        Caption = 'Disciplinas que leciona'
        Color = 8404992
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Transparent = True
      end
      object btOk: TSpeedButton
        Left = 271
        Top = 0
        Width = 69
        Height = 55
        Cursor = crHandPoint
        CustomHint = BalloonHint1
        Anchors = [akTop, akRight]
        Caption = 'Confirma'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          36080000424D360800000000000036040000280000001E000000200000000100
          080000000000000400009B0E00009B0E000000010000E500000000A94000E7E3
          E40086D7B2003BBB7D00FFF1F800DAD9D900CCCCCC0000BF6500F1F2F200B2DB
          CA005ECD950000B263001EBE6D00D0E9E10000AE5D00A0DFBE00F9F9FB00E3E0
          E400F1E7EC0014BB6D0000C27500FFFFFF0010AC5F0071C59A0054BA8800FBEC
          F200E3E7E700D0EBE400D8D8D80000A85300B4E8D60014C87A0095D7BA0000BF
          7100E7EAE80000BA6600EDEDED006CD5A40035B57500F2ECF10000C67500DDF5
          EE0000B254003BC58800AADFC70065D9A70000B65D00DFDBDF0033BF7B00F5F5
          F500FFF7FC00C6E4DA00CCCCCC0028C67C00BBDFCD0000AF4900FBF8FA00F3E9
          EC0008BE71004FC68B0021C47C0001BB6B0001B56500D7DAD8001EB75E0008C0
          750008B259000CBC6200E7E7E300E6F6F300F5F5F60000BE6E0091E1BE00D0F3
          E70003C67D0076CEA2000BAE540085E0BA0026C17600FBE7EF0043BE830000C2
          7000F5F4F300C3DBCF0075D8AE0004C07400E0E3E0000BB76600FFF4FF00A2E8
          CC00C7F2E200BEEBD70007B26100E3F7EF0061D59F0000B55400FBFBFB0078DD
          B500EFFBF70000B76200FEFCFB007CC9A00006BA6500B2E5D300FCF7F800EBEB
          EB004FC3890041CA890017C17400F3F3F30000AE4F0003C57500D7DFDF0000A4
          48003DC58600EAE8E900DBDFDB00ADDECB00DADFDF00DFE3E30003B46300D7EE
          E7004AC68D00D8F3EB0000B25F00A0E3C9009BDEC300F3EDEF0003C3740003B7
          690000BB6900FFF3F700EAE0EA0000AF5500F2FBFA0003C071006BDAAA0080DC
          B600F8F0F600EFE7EF0003BC6E0000BE6800D2D2D20004BD6F000DC07200E7E7
          EB00E3DFDF00F2F0EF00DFDBDB00ECEDF100F7F7F700E3E3E30000B35D0000BC
          6100EEF6F700F6EDF300FFF7FF008CE3C20000BC5A0000AF4E00F6E6F10055C4
          8C0008C37800E7DFE700F7EBEF00E3F3F300FFFBFF0041C17F00B7DFCB005ACD
          9900D2EFE30000C679006AD9AB00BCE3D00024C8820019B86200C2E0D200AFE0
          CE004DCC8C00FBFEFB00EFEFEF00E7E7E700F7FBFB00DFDFDF00DBDBDB0004BD
          7200F7FAF60000C2790004BA710004B15D00F4F8F90004C7780000B1590004B2
          690004B66D0000BA5D00D6DBDB0003C98300F6F4F90004BA6100E3E3DF0000B6
          590018BA6D0004BA650003BA690004BE690000B2690004BE790040CD8D0000AA
          5500EEEBEE00FFEFFB00FFF2FB00FCF0F4001DC0730014C77F00E8EAEA00F3EF
          F200ABE1CA00C8E8D80008C2750042C38200C0ECDA0004AE520000B14D00E7E3
          E700FBEBEF00E3F9F20000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000151515151515
          1515606D018E06061C735264151515151515151515151515E1E1151515151515
          646D2469B46D6DB4B5B71C05B41515151515151515151515E1E1151515151564
          6D6D6015151515151515465606B815151515151515151515E1E1151515156046
          4610108686B3B3B3B3151515B40606601515151515151515E1E1151515606D6D
          6D6D6DBE15151515606015151510068E6415151515151515E1E1151564080808
          0808381559AC9D491515151515156006B715151515151515E1E115156D242408
          0808155A6C07801F88451515151515080608151515151515E1E1151024242408
          08681554C314ABAB99D04515B3B3B315B7B8151515151515E1E1156D696969B4
          B432454E994A4A4A4A9E481515151515388E601515151515E1E16424737373B4
          B4A67E5F476F6F6FC507D08615B3B3B315B8731515151515E1E152B5B5B56969
          8AC6DD5F282828284A4ACDDE15B3B3B31573B71515151515E1E16997B5B5B5B5
          D475428255555555554A472D151010101508B71515151515E1E173979797B527
          273B85B94747878787ABABD7491510101008561515151515E1E169B797979719
          365C238C8C8C8C8D8D6F6F51611510101008971515151515E1E1B4B7B7B797D5
          A198CCCCCC47479041516F51AEE315B6B608B51515151515E1E152B7B7B79BA8
          BD0B0B818181131EB25F2828074D1596B324B41515151515E1E16097C4841926
          1D3E3E3E81987A150FE047140735E3646473641515151515E1E11524C411A018
          710E3E3E3E3E2C9CBE72988051C9891546B4151515151515E1E11538B73F9292
          1716D17CD16A7FD29C6757828099D67BA660151515151515E1E11515B41C1C01
          0153650350B027229B9CA92E2121C9251515151515151515E1E1151564B5B8B8
          B8124F393939B5B5B5D41B1323A28D43DEA6601515151515E1E115151564B505
          050576B5B5B5B5B5B5B59C029855552E6B1068B315151515E1E1151515156469
          0505B7B7B7979797737373D9302EBB87C37DA6BA15151515E1E1151515151515
          31B5B7B7B7B7979797736958AD4299A28D3C296060151515E1E1151515151515
          151596B46969696908966038584B6E4755C75EA638151515E1E1151515151515
          1515151515646415151515153295A79F8F3D667D15601515E1E1151515151515
          15151515151515151515151564580DAF2A21630C49156015E1E1151515151515
          15151515151515151515151515389CB1DFC0212A2B86A6B3E1E1151515151515
          15151515151515151515151515159658204C852E000A9A32E1E1151515151515
          1515151515151515151515151515B3C6D4A8A1CA3740799CE1E1151515151515
          15151515151515151515151515151515329CD933DADB0860E1E1151515151515
          15151515151515151515151515151515151532D504D46015E1E1}
        Layout = blGlyphTop
        ParentFont = False
        OnClick = btOkClick
      end
      object btCanc: TSpeedButton
        Left = 346
        Top = 0
        Width = 74
        Height = 55
        Cursor = crHandPoint
        CustomHint = BalloonHint1
        Anchors = [akTop, akRight]
        Caption = 'Cancela'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          46070000424D460700000000000036040000280000001C0000001C0000000100
          08000000000010030000120B0000120B000000010000DC0000000000AF00CACA
          E7006666CC003333C0002323BB009090D200FFFFFF003434E5001212BA00EFEF
          F5004444CA00A4A4DB008080CA002323D000E3E3EB001010BC003D3DC300BFBF
          E5004545F8001414C6007070C8003434EE000505BA002424E0005555CC00D1D1
          EB002B2BC3001A1AC5003838CA00B2B2DD004141BE008989CF006464D6003A3A
          E8004444E600F3F3F7000505AE007474D3003333CC001C1CBF000C0CB9009C9C
          D600DBDBEA002020DC003939BE002E2EE100F7F7F3004343C400ECECF3003D3D
          E3003838F6001E1ECF002C2CDC008383D7001010C2000404BF005F5FD3006868
          E3009696DC000404B2005050CC007A7ACC007979D7002727C0002C2CE7006C6C
          CA002323D600ADADE5001818BB001919C8004949C6003535C6000C0CBE003131
          BE006969DF003939D0008D8DD400E8E8F100CDCDEC00C4C4ED00DADAF1000C0C
          B2001F1FD0002A2AD3000808BE00A9A9E200FBFBF9009E9ED9007979DC004242
          F8004D4DCB002525C1009595E0001919CE002020C0001515C0005E5ECE000000
          B6006E6ED1002727DF003939C5003131C6008686CE003A3AEF000808BB003333
          EC000D0DC2001010BD00BABAE1008888D5003939DB002727D8009292DB004C4C
          E4007D7DD4001F1FC8003D3DC6003535C2000909C1002929CF00D7D7EF007575
          CE004242C700E2E2F4000707B700F7F7FB00B2B2E5002C2CCE007D7DE600F3F3
          FA008A8AD9008F8FD7001E1ED2009A9ADF001A1AD1002B2BEC002727E5000404
          B500EFEFF7003D3DE700DFDFEB001010C700C2C2E7008282D4002929C2009D9D
          DE009595E9003737F400DFDFF3003838C3001313CA000000B1004545C6003B3B
          FE003131D700A8A8E4001616BE00E7E7F200CFCFF000C9C9EC004D4DC6004949
          CA003030DB003131DF007C7CCD001717BF00C6C6EB001B1BC3003434E7003D3D
          CA007979D2006D6DE3007C7CD8006D6DDF002020C3003131C3006D6DCF002424
          BE002323C5008181DB00EBEBF800FBFBFC00A3A3DF002C2CC6000B0BB7008080
          CE00D1D1F1001B1BCB004141C2008888D2000404C3002727DB003939EB00B4B4
          E7008E8EDB002020D7001818CA000808C5000909B2000C0CC6007171CA002424
          D2009393D6009A9ADB00E3E3EF004040FE00BEBEEA002222E3006161D6002424
          DB009E9EDB001717D1006D6DD5008686D2008686DB002020CA001B1BD7002D2D
          EF002828E7000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000606068A0B0C
          0106060606060606060606060606064FBD1D230606060606B57E1004B9230606
          060606060606060606069D80224A4E06060606B5C175161644D5090606060606
          0606060606CC58C09959AB0106068A7E497C6161379C3DCC0606060606060606
          19AD071532CD12399F81B6BC97977CB816BEA5418C0606060606064ED02DD915
          C0C0CDCD4A6C3575C6006868285454A5C830060606068C2034DA40A8C0C09393
          71579E5C033B007C6B6B5454A5B92306069DD46FCF632D07076969319250067D
          91032400686B2837C75E4C23303E0D2B2B6F343440406E3A810606067D7003C6
          97686B6B768D1AB92577D3844242BFBF88A2D6230606060606B4D6033B3B686B
          6B6A13B2735D5D52C9C92B179AAC9D060606060606069DC27589976836363696
          9696BB3333D8D85335CC0606060606060606068191477C61686B6B6B8D134545
          D3D377820906060606060606060606067D9BA10F61543636363613135D4B7023
          06060606060606060606060606B53A5B1616363636363696B7CA560606060606
          060606060606060606B4B008616148363636369690052E060606060606060606
          06060606B4353F89896161686848484813654C09060606060606060606060694
          7964B75B276B68686161686837C5A53D4D0606060606060606064EB09547477A
          74655BAE5F4848484837C59C142A0606060606060619027495AFAF64644747A1
          5A65A7B290AE1B7390C8CC06060606067B627474646464AFAFAF0ACB5538B7B2
          261C47B77F65A4300606067B727A7464646464474710CB7DB5433C5BAE261C65
          B77FAF1F8A06A672740A0A7474646464108381060681915A5B5E656565B7B795
          6D19821874959898749595106D8A060606068A3A3C3F276547AFB7B72F29C1B3
          3C0395989874748F7B0606060606067B70A05B5B47476565B0117DBAB35A7564
          0A98839D06060606060606069D3A5A905B6595024E7D0606BAB33C74983A8A06
          06060606060606060681B65A6565024E0606060606BAB3607081060606060606
          060606060606818518624E06060606060681CEB6500606060606060606060606
          060606BAB6A6B5060606}
        Layout = blGlyphTop
        ParentFont = False
        Spacing = 7
        OnClick = btCancClick
      end
    end
    object DBGrid1: TDBGrid
      Left = 2
      Top = 58
      Width = 423
      Height = 281
      CustomHint = BalloonHint1
      Align = alClient
      DataSource = dsListaDisciplinas
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IdDisciplina'
          Title.Caption = 'C'#243'd. Disciplina'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Descricao'
          Title.Caption = 'Descric'#231#227'o'
          Width = 304
          Visible = True
        end>
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 576
    Top = 24
  end
  object cdsPesquisa: TClientDataSet
    PersistDataPacket.Data = {
      470000009619E0BD01000000180000000200000000000300000047000B496450
      726F666573736F720400010000000000044E6F6D650100490000000100055749
      4454480200020032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IdProfessor'
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
    Left = 536
    Top = 8
    object cdsPesquisaIdProfessor: TIntegerField
      DisplayWidth = 17
      FieldName = 'IdProfessor'
    end
    object cdsPesquisaNome: TStringField
      DisplayWidth = 77
      FieldName = 'Nome'
      Size = 50
    end
  end
  object dsProfessorDisc: TDataSource
    AutoEdit = False
    DataSet = cdsProfessorDisc
    Left = 488
    Top = 8
  end
  object cdsProfessorDisc: TClientDataSet
    PersistDataPacket.Data = {
      610000009619E0BD01000000180000000300000000000300000061000B496450
      726F666573736F7204000100000000000C49644469736369706C696E61040001
      00000000000944657363726963616F0100490000000100055749445448020002
      0032000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IdProfessor'
        DataType = ftInteger
      end
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
    Left = 368
    object cdsProfessorDiscIdProfessor: TIntegerField
      FieldName = 'IdProfessor'
    end
    object cdsProfessorDiscIdDisciplina: TIntegerField
      FieldName = 'IdDisciplina'
    end
    object cdsProfessorDiscDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object cdsListaDisciplinas: TClientDataSet
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
    Left = 472
    Top = 64
    object cdsListaDisciplinasIdDisciplina: TIntegerField
      FieldName = 'IdDisciplina'
    end
    object cdsListaDisciplinasDescricao: TStringField
      FieldName = 'Descricao'
      Size = 50
    end
  end
  object dsListaDisciplinas: TDataSource
    AutoEdit = False
    DataSet = cdsListaDisciplinas
    Left = 576
    Top = 88
  end
end
