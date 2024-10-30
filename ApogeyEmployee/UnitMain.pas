unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.WinXCtrls, Vcl.DBCGrids, shellApi, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.Menus;

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
    ScrollBoxEmployeeInfo: TScrollBox;
    Bevel1: TBevel;
    EmployeeData: TPanel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    DBGridSections: TDBGrid;
    DBEditEmployeeID: TDBEdit;
    DBLabeledEditName: TDBLabeledEdit;
    PanelSections: TPanel;
    PanelDBControl: TPanel;
    ButtonSearchSettings: TButton;
    PopupMenuSearchSettings: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    DBTextContact: TDBText;
    ImageList: TImageList;
    BitBtnEmployeeEdit: TBitBtn;
    PanelEmployeeEdit: TPanel;
    LabelMapLink: TLabel;
    BitBtnSectionsFind: TBitBtn;
    Bevel4: TBevel;
    StatusBarEmployeeCount: TStatusBar;
    procedure SearchBoxFindEmployeeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButtonAddClick(Sender: TObject);
    procedure DBEditEmployeeIDChange(Sender: TObject);
    procedure TabSheetReadShow(Sender: TObject);
    procedure NSearchSettingClick(Sender: TObject);
    procedure DBTextContactMouseEnter(Sender: TObject);
    procedure DBTextContactMouseLeave(Sender: TObject);
    procedure DBTextContactClick(Sender: TObject);
    procedure BitBtnEmployeeEditClick(Sender: TObject);
    procedure ToolButtonDeleteClick(Sender: TObject);
    procedure LabelMapLinkClick(Sender: TObject);
    procedure LabelMapLinkMouseEnter(Sender: TObject);
    procedure LabelMapLinkMouseLeave(Sender: TObject);
    procedure BitBtnSectionsFindClick(Sender: TObject);
  private
    { Private declarations }
    procedure reloadEmployeeGrid();
    procedure reloadSectionsGrid();
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses DataModule, UnitAddEmployee, UnitSectionsFind;

// При созданни
procedure TFormMain.FormCreate(Sender: TObject);
begin
  DataModule1.FDConEmployee.Open;
  DataModule1.FDTableEmployee.Open;
  DataModule1.FDTableCity.Open;
  DataModule1.FDTablePost.Open;

  //reloadEmployeeGrid();

  DBLabeledEditName.DataField := 'ФИО';
  DBLabeledEditCity.DataField := 'Город';
  DBLabeledEditPost.DataField := 'Должность';
  DBLabeledEditGrade.DataField := 'Грейд';
  DBTextContact.DataField := 'tgContact';
  DBEditEmployeeID.DataField := 'EmployeeID';

  //reloadSectionsGrid();
end;

// кнопка Редактировать
procedure TFormMain.BitBtnEmployeeEditClick(Sender: TObject);
begin
  if not Assigned(FormAddEmployee) then Application.CreateForm(TFormAddEmployee, FormAddEmployee);
  DataModule1.FDTableEmployee.Edit;
  FormAddEmployee.isEdit := true;
  FormAddEmployee.show;
  FormAddEmployee.Caption := 'Редактировать сотрудника';
  FormAddEmployee.loadSections;
  FormAddEmployee.selectSections;
  FormAddEmployee.DBLookupComboBoxPostCloseUp(Self);
end;

// кнопка Поиск по разделам
procedure TFormMain.BitBtnSectionsFindClick(Sender: TObject);
begin
  if not Assigned(FormSectionsFind) then Application.CreateForm(TFormSectionsFind, FormSectionsFind);
  FormSectionsFind.Show;
end;

// Смена записи
procedure TFormMain.DBEditEmployeeIDChange(Sender: TObject);
var mapLink: String;
begin
  if DBEditEmployeeID.Text <> '' then begin
    reloadSectionsGrid();
    if DBGridEmployeesList.FieldCount > 1 then begin
      DataModule1.FDQuerySectionName.Close;
      DataModule1.FDQuerySectionName.SQL.Text := 'SELECT mapLink FROM Cities WHERE name = "' + DBGridEmployeesList.Columns[2].Field.Text + '"';
      DataModule1.FDQuerySectionName.Open;
      mapLink := DataModule1.FDQuerySectionName.FieldByName('mapLink').AsString;
    end else begin
      DataModule1.FDQuerySectionName.Close;
      DataModule1.FDQuerySectionName.SQL.Text := 'SELECT mapLink FROM Cities WHERE CityID = "' + DBGridEmployees.Columns[4].Field.Text + '"';
      DataModule1.FDQuerySectionName.Open;
      mapLink := DataModule1.FDQuerySectionName.FieldByName('mapLink').AsString;
    end;
  end;

  DataModule1.FDTableEmployee.RecNo := DataModule1.FDQueryEmployee.RecNo;
  LabelMapLink.Hint := mapLink;
end;

// Открытие тг контакта
procedure TFormMain.DBTextContactClick(Sender: TObject);
var username: string;
begin
  username := copy(DBTextContact.Caption, 2, Length(DBTextContact.Caption));
  ShellExecute(Handle, 'open', PChar('https://t.me/' + username), nil, nil, SW_NORMAL );
end;

procedure TFormMain.DBTextContactMouseEnter(Sender: TObject);
begin
  DBTextContact.Font.Style := DBTextContact.Font.Style + [fsUnderline];
  DBTextContact.Font.Color := $00A26544;
end;

procedure TFormMain.DBTextContactMouseLeave(Sender: TObject);
begin
  DBTextContact.Font.Style := DBTextContact.Font.Style - [fsUnderline];
  DBTextContact.Font.Color := clWhite;
end;

// Открытие ссылки на карте
procedure TFormMain.LabelMapLinkClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(LabelMapLink.Hint), nil, nil, SW_NORMAL );
end;

procedure TFormMain.LabelMapLinkMouseEnter(Sender: TObject);
begin
  LabelMapLink.Font.Style := LabelMapLink.Font.Style + [fsUnderline];
end;

procedure TFormMain.LabelMapLinkMouseLeave(Sender: TObject);
begin
  LabelMapLink.Font.Style := LabelMapLink.Font.Style - [fsUnderline];
end;

// Выбор поля для поиска
procedure TFormMain.NSearchSettingClick(Sender: TObject);
begin
  for var i := 0 to PopupMenuSearchSettings.Items.Count-1 do
    PopupMenuSearchSettings.Items[i].Checked := false;
  (Sender as TMenuItem).Checked := true;
end;

// Поиск
procedure TFormMain.SearchBoxFindEmployeeChange(Sender: TObject);
var searchSettings: Integer;
begin
  for var i := 0 to PopupMenuSearchSettings.Items.Count-1 do
    if PopupMenuSearchSettings.Items[i].Checked then searchSettings := i;
  DataModule1.recordFind(SearchBoxFindEmployee.Text, searchSettings);
  DBGridEmployeesList.Columns[0].Visible := false;
  DBGridEmployeesList.Columns[1].Width := 200;
  DBGridEmployeesList.Columns[2].Width := 150;
  DBGridEmployeesList.Columns[3].Width := 150;
  DBGridEmployeesList.Columns[4].Width := 150;
  DBGridEmployeesList.Columns[5].Visible := false;
  DBGridEmployeesList.Columns[6].Visible := false;
end;

procedure TFormMain.TabSheetReadShow(Sender: TObject);
begin
  reloadEmployeeGrid;
  StatusBarEmployeeCount.Panels[0].Text := 'Сотрудников в базе: ' + IntToStr(DataModule1.FDQueryEmployee.RecordCount);
end;

procedure TFormMain.ToolButtonAddClick(Sender: TObject);
var id: String;
begin
  if not Assigned(FormAddEmployee) then Application.CreateForm(TFormAddEmployee, FormAddEmployee);
  DataModule1.FDTableEmployee.Last;
  id := DBGridEmployees.Columns[0].Field.Text;
  DataModule1.FDTableEmployee.Insert;
  FormAddEmployee.show;
  FormAddEmployee.Caption := 'Добавить сотрудника';
  if id = '' then id := '1'
  else FormAddEmployee.DBEditEmpID.Text := IntToStr(StrToInt(id)+1);
end;

procedure TFormMain.ToolButtonDeleteClick(Sender: TObject);
begin
  if DataModule1.FDTableEmployee.RecordCount > 0 then begin
    if Application.MessageBox(pChar('Вы хотите удалить запить?'), 'Удаление записи', MB_YESNO) = idYes then begin

      DataModule1.FDQuerySectionName.SQL.Text := 'Delete From EmployeeSections'
                                               + ' Where EmployeeID = '+DBGridEmployees.Columns[0].Field.Text;
      try
        DataModule1.FDQuerySectionName.ExecSQL;
      finally
        DataModule1.FDQuerySectionName.Close;
      end;
      DataModule1.FDTableEmployee.Delete;
    end;
  end;
end;

procedure TFormMain.reloadEmployeeGrid();
begin
  DataModule1.FDQueryEmployee.Close;
  DataModule1.FDQueryEmployee.SQL.Text := 'Select EmployeeID, middleName || " " || firstName || " " || lastName ФИО, Cities.name Город, Posts.PostName Должность, Grades.GradeName Грейд, tgContact, EmployeeID'
                                          +' FROM Employee e'
                                          +' JOIN Cities ON e.city = Cities.CityID'
                                          +' JOIN Posts ON e.post = Posts.PostID'
                                          +' LEFT JOIN Grades ON e.grade = Grades.GradeID';
  DataModule1.FDQueryEmployee.Open;
  DBGridEmployeesList.Columns[0].Visible := false;
  DBGridEmployeesList.Columns[1].Width := 200;
  DBGridEmployeesList.Columns[2].Width := 150;
  DBGridEmployeesList.Columns[3].Width := 150;
  DBGridEmployeesList.Columns[4].Width := 150;
  DBGridEmployeesList.Columns[5].Visible := false;
  DBGridEmployeesList.Columns[6].Visible := false;
end;

procedure TFormMain.reloadSectionsGrid();
begin
  DataModule1.FDQuerySections.Close;
  DataModule1.FDQuerySections.SQL.Text := 'SELECT SectionName.Name Раздел, Sections.FullName Подраздел'
                                + ' FROM EmployeeSections es'
                                + ' JOIN SectionName ON es.SectionNameID = SectionName.SectionNameID'
                                + ' LEFT JOIN Sections ON es.SectionID = Sections.SectionID'
                                + ' WHERE es.EmployeeID = ' + DBEditEmployeeID.Text;
  DataModule1.FDQuerySections.Open;
  DBGridSections.Columns[0].Width := 250;
  DBGridSections.Columns[1].Width := 250;
end;

end.
