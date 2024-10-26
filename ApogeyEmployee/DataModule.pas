unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.Forms, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat;

type
  TDataModule1 = class(TDataModule)
    FDConEmployee: TFDConnection;
    FDTableEmployee: TFDTable;
    DataSourceEmployee: TDataSource;
    DataSourceCity: TDataSource;
    FDTableCity: TFDTable;
    FDTablePost: TFDTable;
    DataSourcePost: TDataSource;
    FDQueryGrade: TFDQuery;
    DataSourceGrade: TDataSource;
    FDQueryEmployee: TFDQuery;
    DataSourceEmployeeSQL: TDataSource;
    FDQuerySectionName: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DBConnect();
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  DBConnect();
end;

procedure TDataModule1.DBConnect();
begin
  FDConEmployee.close;
  try
    FDConEmployee.DriverName := 'SQLite';
    FDConEmployee.ConnectionName := ExtractFilePath(Application.ExeName) + 'db/ApogeyEmployee.db';
    FDConEmployee.Params.DriverID := 'SQLite';
    FDConEmployee.Params.Database := ExtractFilePath(Application.ExeName) + 'db/ApogeyEmployee.db';
    FDTableEmployee.ConnectionName := FDConEmployee.ConnectionName;
    FDTableCity.ConnectionName := FDConEmployee.ConnectionName;
    FDTablePost.ConnectionName := FDConEmployee.ConnectionName;
    FDTableEmployee.TableName := 'Employee';
    FDTableCity.TableName := 'Cities';
    FDTablePost.TableName := 'Posts';

    FDQueryGrade.ConnectionName :=  FDConEmployee.ConnectionName;
    FDQueryGrade.Connection := FDConEmployee;

    FDQueryEmployee.ConnectionName :=  FDConEmployee.ConnectionName;
    FDQueryEmployee.Connection := FDConEmployee;

    FDQuerySectionName.ConnectionName :=  FDConEmployee.ConnectionName;
    FDQuerySectionName.Connection := FDConEmployee;
  finally

  end;
end;

end.
