unit UnitSectionsFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TFormSectionsFind = class(TForm)
    DBGridEmployees: TDBGrid;
    RadioGroupSections: TRadioGroup;
    PanelSections: TPanel;
    PanelPostSelect: TPanel;
    LabelPostSelect: TLabel;
    ComboBoxPost: TComboBox;
    PanelGridEmployee: TPanel;
    PanelGridSettings: TPanel;
    CheckBoxShowSubSection: TCheckBox;
    PanelSectionControl: TPanel;
    ButtonSectionsReset: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxPostChange(Sender: TObject);
    procedure RadioGroupSectionsClick(Sender: TObject);
    procedure CheckBoxShowSubSectionClick(Sender: TObject);
    procedure ButtonSectionsResetClick(Sender: TObject);
  private
    { Private declarations }
    procedure loadGrid();
    procedure fillPosts();
    procedure fillSections();
  public
    { Public declarations }
  end;

var
  FormSectionsFind: TFormSectionsFind;

implementation

{$R *.dfm}

uses DataModule;

procedure TFormSectionsFind.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Destroy;
  FormSectionsFind := nil;
end;

procedure TFormSectionsFind.FormCreate(Sender: TObject);
begin
  loadGrid();

  fillPosts;
  fillSections();
end;

procedure TFormSectionsFind.RadioGroupSectionsClick(Sender: TObject);
begin
  if RadioGroupSections.ItemIndex > -1 then begin
    DataModule1.FDQuerySectionName.Close;
    DataModule1.FDQuerySectionFind.SQL.Text := 'Select DISTINCT middleName || " " || firstName || " " || lastName ФИО, s.FullName Подраздел'
                                             + ' FROM Employee e'
                                             + ' JOIN EmployeeSections es ON e.EmployeeID = es.EmployeeID'
                                             + ' JOIN SectionName sn ON es.SectionNameID = sn.SectionNameID'
                                             + ' LEFT JOIN Sections s ON es.SectionID = s.SectionID'
                                             + ' WHERE sn.Name LIKE "' + RadioGroupSections.Items[RadioGroupSections.ItemIndex] + '"';
    DataModule1.FDQuerySectionFind.Open;
    DBGridEmployees.DataSource := DataModule1.DataSourceSectionFind;
    DBGridEmployees.Columns[0].Width := 200;
    DBGridEmployees.Columns[1].Width := 255;
  end else begin
    loadGrid();
  end;
end;

procedure TFormSectionsFind.ButtonSectionsResetClick(Sender: TObject);
begin
  RadioGroupSections.ItemIndex := -1;
  RadioGroupSectionsClick(self);
end;

procedure TFormSectionsFind.CheckBoxShowSubSectionClick(Sender: TObject);
var isSelected: boolean;
begin
  DataModule1.FDQuerySectionFind.Close;
  isSelected := false;
  //if CheckBoxShowSubSection.Checked then begin
  if RadioGroupSections.ItemIndex > -1 then isSelected := true;

    if not CheckBoxShowSubSection.Checked and not isSelected then begin
      DataModule1.FDQuerySectionFind.SQL.Text := 'Select DISTINCT middleName || " " || firstName || " " || lastName ФИО'
                                               + ' FROM Employee e'
                                               + ' JOIN EmployeeSections es ON e.EmployeeID = es.EmployeeID'
                                               + ' JOIN SectionName sn ON es.SectionNameID = sn.SectionNameID';
    end else if not CheckBoxShowSubSection.Checked and isSelected then begin
      DataModule1.FDQuerySectionFind.SQL.Text := 'Select DISTINCT middleName || " " || firstName || " " || lastName ФИО'
                                               + ' FROM Employee e'
                                               + ' JOIN EmployeeSections es ON e.EmployeeID = es.EmployeeID'
                                               + ' JOIN SectionName sn ON es.SectionNameID = sn.SectionNameID'
                                               + ' WHERE sn.Name LIKE "' + RadioGroupSections.Items[RadioGroupSections.ItemIndex] + '"';
    end else if CheckBoxShowSubSection.Checked and not isSelected then begin
      DataModule1.FDQuerySectionFind.SQL.Text := 'Select DISTINCT middleName || " " || firstName || " " || lastName ФИО, s.FullName Подраздел'
                                               + ' FROM Employee e'
                                               + ' JOIN EmployeeSections es ON e.EmployeeID = es.EmployeeID'
                                               + ' JOIN SectionName sn ON es.SectionNameID = sn.SectionNameID'
                                               + ' LEFT JOIN Sections s ON es.SectionID = s.SectionID';
    end else if CheckBoxShowSubSection.Checked and isSelected then begin
      RadioGroupSectionsClick(self);
    end;
    DataModule1.FDQuerySectionFind.Open;
    DBGridEmployees.Columns[0].Width := 200;
    if DBGridEmployees.FieldCount > 1 then DBGridEmployees.Columns[1].Width := 255;
  //end;
end;

procedure TFormSectionsFind.ComboBoxPostChange(Sender: TObject);
begin
  fillSections();
  RadioGroupSectionsClick(self);
end;

procedure TFormSectionsFind.loadGrid();
begin
  DataModule1.FDQuerySectionFind.Close;
  DataModule1.FDQuerySectionFind.SQL.Text := 'Select DISTINCT middleName || " " || firstName || " " || lastName ФИО, s.FullName Подраздел'
                                             + ' FROM Employee e'
                                             + ' JOIN EmployeeSections es ON e.EmployeeID = es.EmployeeID'
                                             + ' JOIN SectionName sn ON es.SectionNameID = sn.SectionNameID'
                                             + ' LEFT JOIN Sections s ON es.SectionID = s.SectionID';
  try
    DataModule1.FDQuerySectionFind.Open;
    DBGridEmployees.Columns[0].Width := 200;
    DBGridEmployees.Columns[1].Width := 255;
  finally

  end;
end;

procedure TFormSectionsFind.fillPosts();
begin
   ComboBoxPost.Clear;
   DataModule1.FDTablePost.First;
   for var i := 0 to DataModule1.FDTablePost.RecordCount-1 do begin
    ComboBoxPost.Items.Add(DataModule1.FDTablePost.Fields[1].AsString);
    DataModule1.FDTablePost.Next;
  end;
  ComboBoxPost.ItemIndex := 0;
end;

procedure TFormSectionsFind.fillSections();
begin
  RadioGroupSections.Items.Clear;
  DataModule1.FDQuerySectionName.SQL.Text := 'SELECT Name FROM SectionName WHERE PostID = ' + IntToStr(ComboBoxPost.ItemIndex+1);
  DataModule1.FDQuerySectionName.Open;
  try
    for var i := 0 to DataModule1.FDQuerySectionName.RecordCount-1 do begin
      RadioGroupSections.Items.Add(DataModule1.FDQuerySectionName.FieldByName('Name').AsString);
      DataModule1.FDQuerySectionName.Next;
    end;
  finally
    DataModule1.FDQuerySectionName.Close;
  end;

end;

end.
