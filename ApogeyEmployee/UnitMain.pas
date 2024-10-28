unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.DBCGrids;

type
  TFormMain = class(TForm)
    PageControlMain: TPageControl;
    TabSheetRead: TTabSheet;
    TabSheetWrite: TTabSheet;
    DBGridEmployees: TDBGrid;
    ToolBarDBControl: TToolBar;
    ToolButtonAdd: TToolButton;
    ToolButtonDelete: TToolButton;
    PanelEmployeesList: TPanel;
    DBGridEmployeesList: TDBGrid;
    SearchBoxFindEmployee: TSearchBox;
    DBLabeledEditCity: TDBLabeledEdit;
    DBLabeledEditPost: TDBLabeledEdit;
    DBLabeledEditGrade: TDBLabeledEdit;
    DBLabeledEditContact: TDBLabeledEdit;
    ScrollBoxEmployeeInfo: TScrollBox;
    Bevel1: TBevel;
    EmployeeData: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    DBEditName: TDBEdit;
    LabelSection: TLabel;
    DBGrid1: TDBGrid;
    DBEditEmployeeID: TDBEdit;
    procedure SearchBoxFindEmployeeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButtonAddClick(Sender: TObject);
    procedure DBEditEmployeeIDChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses DataModule, UnitAddEmployee;

procedure TFormMain.DBEditEmployeeIDChange(Sender: TObject);
begin
  if DBEditEmployeeID.Text <> '' then begin

  DataModule1.FDQuerySections.Close;
  DataModule1.FDQuerySections.SQL.Text := 'SELECT SectionName.Name Раздел, Sections.FullName Подраздел'
                                + ' FROM EmployeeSections es'
                                + ' JOIN SectionName ON es.SectionNameID = SectionName.SectionNameID'
                                + ' LEFT JOIN Sections ON es.SectionID = Sections.SectionID'
                                + ' WHERE es.EmployeeID = ' + DBEditEmployeeID.Text;
  DataModule1.FDQuerySections.Open;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  DataModule1.FDConEmployee.Open;
  DataModule1.FDTableEmployee.Open;
  DataModule1.FDTableCity.Open;
  DataModule1.FDTablePost.Open;
  DataModule1.FDQueryEmployee.SQL.Text := 'Select middleName || " " || firstName || " " || lastName ФИО, Cities.name Город, Posts.PostName Должность, Grades.GradeName Грейд, tgContact, EmployeeID'
                                          +' FROM Employee e'
                                          +' JOIN Cities ON e.city = Cities.CityID'
                                          +' JOIN Posts ON e.post = Posts.PostID'
                                          +' JOIN Grades ON e.grade = Grades.GradeID';
  DataModule1.FDQueryEmployee.Open;

  DBGridEmployeesList.Columns[0].Width := 200;
  DBGridEmployeesList.Columns[1].Width := 150;
  DBGridEmployeesList.Columns[2].Width := 150;
  DBGridEmployeesList.Columns[3].Width := 150;
  DBGridEmployeesList.Columns[4].Visible := false;

  DBEditName.DataField := 'ФИО';
  DBLabeledEditCity.DataField := 'Город';
  DBLabeledEditPost.DataField := 'Должность';
  DBLabeledEditGrade.DataField := 'Грейд';
  DBLabeledEditContact.DataField := 'tgContact';
  DBEditEmployeeID.DataField := 'EmployeeID';

  DataModule1.FDQuerySections.SQL.Text := 'SELECT SectionName.Name Раздел, Sections.FullName Подраздел'
                                + ' FROM EmployeeSections es'
                                + ' JOIN SectionName ON es.SectionNameID = SectionName.SectionNameID'
                                + ' LEFT JOIN Sections ON es.SectionID = Sections.SectionID'
                                + ' WHERE es.EmployeeID = ' + DBEditEmployeeID.Text;
  DataModule1.FDQuerySections.Open;
end;

procedure TFormMain.SearchBoxFindEmployeeChange(Sender: TObject);
begin
  //DataModule1.FDConEmployee.DriverName := 'SQLite';
end;

procedure TFormMain.ToolButtonAddClick(Sender: TObject);
begin
  if not Assigned(FormAddEmployee) then Application.CreateForm(TFormAddEmployee, FormAddEmployee);
  FormAddEmployee.show;
end;

end.
