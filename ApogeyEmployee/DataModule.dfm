object DataModule1: TDataModule1
  OnCreate = DataModuleCreate
  Height = 169
  Width = 464
  PixelsPerInch = 120
  object FDConEmployee: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 56
    Top = 48
  end
  object FDTableEmployee: TFDTable
    Connection = FDConEmployee
    Left = 192
    Top = 48
  end
  object DataSourceEmployee: TDataSource
    DataSet = FDTableEmployee
    Left = 344
    Top = 48
  end
end
