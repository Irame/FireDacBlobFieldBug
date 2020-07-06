object MainFrom: TMainFrom
  Left = 0
  Top = 0
  Caption = 'MainFrom'
  ClientHeight = 461
  ClientWidth = 904
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 898
    Height = 455
    Align = alClient
    ColumnCollection = <
      item
        Value = 49.771748119335040000
      end
      item
        SizeStyle = ssAbsolute
        Value = 20.000000000000000000
      end
      item
        Value = 50.228310502283110000
      end>
    ControlCollection = <
      item
        Column = 0
        Control = DBGrid1
        Row = 2
      end
      item
        Column = 2
        Control = DBGrid2
        Row = 2
      end
      item
        Column = 0
        Control = Label1
        Row = 0
      end
      item
        Column = 2
        Control = Label2
        Row = 0
      end>
    RowCollection = <
      item
        SizeStyle = ssAuto
      end
      item
        SizeStyle = ssAbsolute
        Value = 10.000000000000000000
      end
      item
        Value = 100.000000000000000000
      end>
    ShowCaption = False
    TabOrder = 0
    DesignSize = (
      898
      455)
    object DBGrid1: TDBGrid
      Left = 1
      Top = 24
      Width = 436
      Height = 430
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBGrid2: TDBGrid
      Left = 457
      Top = 24
      Width = 440
      Height = 430
      Align = alClient
      DataSource = DataSource2
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object Label1: TLabel
      Left = 188
      Top = 1
      Width = 61
      Height = 13
      Anchors = []
      Caption = 'Original data'
      ExplicitLeft = 191
    end
    object Label2: TLabel
      Left = 652
      Top = 1
      Width = 49
      Height = 13
      Anchors = []
      Caption = 'Error case'
      ExplicitLeft = 655
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 195
    Top = 91
  end
  object DataSource2: TDataSource
    DataSet = FDQuery2
    Left = 675
    Top = 83
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM dbo.TestTable')
    Left = 195
    Top = 179
  end
  object FDQuery2: TFDQuery
    OnCalcFields = FDQuery2CalcFields
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM dbo.TestTable')
    Left = 675
    Top = 187
  end
  object FDConnection1: TFDConnection
    ConnectionName = 'MSSQLConnection'
    Params.Strings = (
      'DriverID=MSSQL'
      'ApplicationName=MinimalFDTest'
      'Database=FDTestDB'
      'OSAuthent=Yes'
      'Server=localhost')
    LoginPrompt = False
    Left = 435
    Top = 3
  end
end
