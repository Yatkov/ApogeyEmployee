object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 614
  Width = 731
  PixelsPerInch = 120
  object FDConEmployee: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 56
    Top = 18
  end
  object FDTableEmployee: TFDTable
    Connection = FDConEmployee
    Left = 53
    Top = 98
  end
  object DataSourceEmployee: TDataSource
    DataSet = FDTableEmployee
    Left = 214
    Top = 98
  end
  object DataSourceCity: TDataSource
    DataSet = FDTableCity
    Left = 210
    Top = 190
  end
  object FDTableCity: TFDTable
    Connection = FDConEmployee
    Left = 50
    Top = 190
  end
  object FDTablePost: TFDTable
    Connection = FDConEmployee
    Left = 50
    Top = 290
  end
  object DataSourcePost: TDataSource
    DataSet = FDTablePost
    Left = 210
    Top = 290
  end
  object FDQueryGrade: TFDQuery
    Connection = FDConEmployee
    Left = 50
    Top = 390
  end
  object DataSourceGrade: TDataSource
    DataSet = FDQueryGrade
    Left = 210
    Top = 390
  end
  object FDQueryEmployee: TFDQuery
    Connection = FDConEmployee
    Left = 380
    Top = 100
  end
  object DataSourceEmployeeSQL: TDataSource
    DataSet = FDQueryEmployee
    Left = 550
    Top = 100
  end
  object FDQuerySectionName: TFDQuery
    Connection = FDConEmployee
    Left = 50
    Top = 490
  end
end
