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
    FDQuerySections: TFDQuery;
    DataSourceQuerySections: TDataSource;
    FDQueryEmployeeFind: TFDQuery;
    DataSourceSectionFind: TDataSource;
    FDQuerySectionFind: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DBConnect();
  public
    { Public declarations }
    procedure recordFind(query: string; fieldNo: Integer);
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

    FDQuerySections.ConnectionName := FDConEmployee.ConnectionName;
    FDQuerySections.Connection := FDConEmployee;

    FDQueryEmployeeFind.ConnectionName := FDConEmployee.ConnectionName;
    FDQueryEmployeeFind.Connection := FDConEmployee;
  finally

  end;
end;

procedure TDataModule1.recordFind(query: string; fieldNo: Integer);
var defaultQuery: string;
begin
  if Length(query) > 0 then begin
    defaultQuery := 'Select middleName || " " || firstName || " " || lastName ФИО, Cities.name Город, Posts.PostName Должность, Grades.GradeName Грейд, tgContact, EmployeeID FROM Employee e JOIN Cities ON e.city = Cities.CityID JOIN Posts ON e.post = Posts.PostID JOIN Grades ON e.grade = Grades.GradeID';
    DataSourceEmployeeSQL.DataSet := FDQueryEmployeeFind;
    case fieldNo of
      0: FDQueryEmployeeFind.SQL.Text := defaultQuery + ' Where ФИО Like "%' + query + '%"';
      1: FDQueryEmployeeFind.SQL.Text := defaultQuery + ' Where Город Like "%' + query +'%"';
      2: FDQueryEmployeeFind.SQL.Text := defaultQuery + ' Where Должность Like "%' + query +'%"';
      3: FDQueryEmployeeFind.SQL.Text := defaultQuery + ' Where Грейд Like "%' + query + '%"';
    end;
    FDQueryEmployeeFind.Open;
  end else DataSourceEmployeeSQL.DataSet := FDQueryEmployee;

end;

end.
