object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 558
  Width = 708
  object FDConEmployee: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 45
    Top = 14
  end
  object FDTableEmployee: TFDTable
    Connection = FDConEmployee
    Left = 42
    Top = 78
  end
  object DataSourceEmployee: TDataSource
    DataSet = FDTableEmployee
    Left = 171
    Top = 78
  end
  object DataSourceCity: TDataSource
    DataSet = FDTableCity
    Left = 168
    Top = 152
  end
  object FDTableCity: TFDTable
    Connection = FDConEmployee
    Left = 40
    Top = 152
  end
  object FDTablePost: TFDTable
    Connection = FDConEmployee
    Left = 40
    Top = 232
  end
  object DataSourcePost: TDataSource
    DataSet = FDTablePost
    Left = 168
    Top = 232
  end
  object FDQueryGrade: TFDQuery
    Connection = FDConEmployee
    Left = 40
    Top = 312
  end
  object DataSourceGrade: TDataSource
    DataSet = FDQueryGrade
    Left = 168
    Top = 312
  end
  object FDQueryEmployee: TFDQuery
    Connection = FDConEmployee
    Left = 304
    Top = 80
  end
  object DataSourceEmployeeSQL: TDataSource
    DataSet = FDQueryEmployee
    Left = 440
    Top = 80
  end
  object FDQuerySectionName: TFDQuery
    Connection = FDConEmployee
    Left = 40
    Top = 400
  end
  object FDQuerySections: TFDQuery
    Connection = FDConEmployee
    Left = 40
    Top = 472
  end
  object DataSourceQuerySections: TDataSource
    DataSet = FDQuerySections
    Left = 168
    Top = 472
  end
  object FDQueryEmployeeFind: TFDQuery
    Connection = FDConEmployee
    Left = 560
    Top = 80
  end
end
