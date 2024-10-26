unit UnitAddEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.CheckLst, System.Generics.Collections;

type
  TSectionInfo = record
    SectionName: string;
    SectionID: Integer;
    ExactSectionName: string;
    ExactSectionID: Integer;
  end;

type
  TFormAddEmployee = class(TForm)
    DBLabeledEditMiddleName: TDBLabeledEdit;
    Bevel1: TBevel;
    DBLabeledEditFirstName: TDBLabeledEdit;
    Bevel2: TBevel;
    DBLabeledEditLastName: TDBLabeledEdit;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    DBLookupComboBoxCity: TDBLookupComboBox;
    LabelCity: TLabel;
    DBLookupComboBoxPost: TDBLookupComboBox;
    LabelPost: TLabel;
    LabelGrade: TLabel;
    DBLookupComboBoxGrade: TDBLookupComboBox;
    DBLabeledEditContact: TDBLabeledEdit;
    Bevel7: TBevel;
    PanelEdits: TPanel;
    PanelConrol: TPanel;
    PanelAddSections: TPanel;
    GroupBoxSectionName: TGroupBox;
    PanelSectionNameBtns: TPanel;
    SpeedButtonSectionNameInc: TSpeedButton;
    SpeedButtonSectionNameIncAll: TSpeedButton;
    Bevel6: TBevel;
    Bevel8: TBevel;
    SpeedButtonSectionNameEx: TSpeedButton;
    Bevel9: TBevel;
    SpeedButtonSectionNameExAll: TSpeedButton;
    GroupBoxSectionNameSrc: TGroupBox;
    GroupBoxSectionNameDest: TGroupBox;
    ListBoxSectionNameSrc: TListBox;
    ListBoxSectionNameDest: TListBox;
    BitBtnSave: TBitBtn;
    ImageList1: TImageList;
    ButtonCancel: TButton;
    Bevel10: TBevel;
    Bevel11: TBevel;
    GroupBoxSubSection: TGroupBox;
    PanelSubSectionBtns: TPanel;
    SpeedButtonSubSectionInc: TSpeedButton;
    SpeedButtonSubSectionIncAll: TSpeedButton;
    Bevel12: TBevel;
    Bevel13: TBevel;
    SpeedButtonSubSectionEx: TSpeedButton;
    Bevel14: TBevel;
    SpeedButtonSubSectionExAll: TSpeedButton;
    GroupBoxSubSectionSrc: TGroupBox;
    ListBoxSubSectionSrc: TListBox;
    GroupBoxSubSectionDest: TGroupBox;
    ListBoxSubSectionDest: TListBox;
    ListBoxSections: TListBox;
    Bevel15: TBevel;
    LabelSections: TLabel;
    ShapeMiddleName: TShape;
    LabelMsg: TLabel;
    Bevel16: TBevel;
    TimerMsg: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBoxPostCloseUp(Sender: TObject);
    procedure SpeedButtonSectionNameIncClick(Sender: TObject);
    procedure SpeedButtonSectionNameIncAllClick(Sender: TObject);
    procedure SpeedButtonSectionNameExClick(Sender: TObject);
    procedure SpeedButtonSectionNameExAllClick(Sender: TObject);
    procedure SpeedButtonSubSectionIncClick(Sender: TObject);
    procedure SpeedButtonSubSectionIncAllClick(Sender: TObject);
    procedure SpeedButtonSubSectionExClick(Sender: TObject);
    procedure SpeedButtonSubSectionExAllClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure ListBoxSectionNameSrcDblClick(Sender: TObject);
    procedure ListBoxSectionNameDestDblClick(Sender: TObject);
    procedure ListBoxSectionNameDestClick(Sender: TObject);
    procedure TimerMsgTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure loadSections;
    procedure loadSubSections;
    procedure MoveSelectedToRight(src, dest: TListBox);
    procedure MoveAllToRight(src, dest: TListBox);
    procedure MoveSelectedToLeft(src, dest: TListBox);
    procedure MoveAllToLeft(src, dest: TListBox);
    procedure checkErrors();
    procedure UpdateTwoColumnListBox();
  public
    { Public declarations }
  end;

var
  FormAddEmployee: TFormAddEmployee;
  SelectedSections: TList<TSectionInfo>;

implementation

{$R *.dfm}

uses DataModule;

procedure TFormAddEmployee.FormCreate(Sender: TObject);
begin
  DBLabeledEditMiddleName.DataField := 'middleName';
  DBLabeledEditFirstName.DataField := 'firstName';
  DBLabeledEditLastName.DataField := 'lastName';
  DBLabeledEditContact.DataField := 'tgContact';

  DBLookupComboBoxCity.DataField := 'city';
  DBLookupComboBoxCity.KeyField := 'cityID';
  DBLookupComboBoxCity.ListField := 'name';

  DBLookupComboBoxPost.DataField := 'post';
  DBLookupComboBoxPost.KeyField := 'postID';
  DBLookupComboBoxPost.ListField := 'postName';

  DBLookupComboBoxGrade.DataField := 'Grade';
  DBLookupComboBoxGrade.KeyField := 'GradeID';
  DBLookupComboBoxGrade.ListField := 'GradeName';

  SelectedSections := TList<TSectionInfo>.Create;
end;

procedure TFormAddEmployee.FormDestroy(Sender: TObject);
begin
  SelectedSections.Free;
end;

procedure TFormAddEmployee.BitBtnSaveClick(Sender: TObject);
begin
  checkErrors();
end;

// Проверка на корректность заполнения
procedure TFormAddEmployee.checkErrors();
var error1, error2, error3, error4: boolean;
begin
  error1 := DBLabeledEditMiddleName.Text = '';
  error2 := DBLabeledEditFirstName.Text = '';
  error3 := DBLabeledEditLastName.Text = '';

  if error1 then shapeMiddleName.Pen.Color := clred;

  if error1 or error2 or error3 then begin
    LabelMsg.Caption := 'Заполните все необходимые поля!';
    TimerMsg.Enabled := true;
  end;
end;

// Завершение работы таймера ошибок
procedure TFormAddEmployee.TimerMsgTimer(Sender: TObject);
begin
  shapeMiddleName.Pen.Color := $00383226;
  LabelMsg.Caption := '';
  TimerMsg.Enabled := false;
end;

procedure TFormAddEmployee.DBLookupComboBoxPostCloseUp(Sender: TObject);
begin
  DataModule1.FDQueryGrade.Close;
  if DBLookupComboBoxPost.text <> '' then begin
    DataModule1.FDQueryGrade.SQL.Text := 'SELECT GradeID, GradeName FROM Grades WHERE PostID = ' + DBLookupComboBoxPost.Field.Text;
    try
      DataModule1.FDQueryGrade.Open;
      LabelGrade.Enabled := True;
      DBLookupComboBoxGrade.Enabled := True;
      loadSections();
    except on e:Exception do
      showMessage(e.Message);
    end;
  end else begin
    LabelGrade.Enabled := False;
    DBLookupComboBoxGrade.Enabled := False;
  end;
end;

// Добавление доступных разделов
procedure TFormAddEmployee.loadSections();
begin
  ListBoxSectionNameSrc.Clear;
  ListBoxSectionNameDest.Clear;
    DataModule1.FDQuerySectionName.SQL.Text := 'SELECT SectionNameID, Name FROM SectionName WHERE PostID = ' + DBLookupComboBoxPost.Field.Text;
    try
      DataModule1.FDQuerySectionName.Open;
      while not(DataModule1.FDQuerySectionName.Eof) do begin
        ListBoxSectionNameSrc.Items.AddObject(DataModule1.FDQuerySectionName.FieldByName('Name').AsString,
          TObject(DataModule1.FDQuerySectionName.FieldByName('SectionNameID').asInteger));
        DataModule1.FDQuerySectionName.Next;
      end;
    finally
      DataModule1.FDQuerySectionName.Close;
    end;
end;

procedure TFormAddEmployee.ListBoxSectionNameDestClick(Sender: TObject);
begin
  if ListBoxSectionNameDest.ItemIndex <> -1 then begin
    GroupBoxSubSection.Caption := 'Подразделы';
    loadSubSections;
  end;
end;

// Добавление доступных подразделов
procedure TFormAddEmployee.loadSubSections();
begin
  ListBoxSubSectionSrc.Clear;
  ListBoxSubSectionDest.Clear;
  DataModule1.FDQuerySectionName.SQL.Text := 'SELECT SectionID, FullName FROM Sections WHERE SectionNameID = ' + IntToStr(Integer(ListBoxSectionNameDest.Items.Objects[ListBoxSectionNameDest.ItemIndex]));
  try
    DataModule1.FDQuerySectionName.Open;
    if DataModule1.FDQuerySectionName.RecordCount <= 0 then GroupBoxSubSection.Caption := 'Подразделы для ' + ListBoxSectionNameDest.Items[ListBoxSectionNameDest.ItemIndex]
    else begin
      while not(DataModule1.FDQuerySectionName.Eof) do begin
        ListBoxSubSectionSrc.Items.AddObject(DataModule1.FDQuerySectionName.FieldByName('FullName').AsString,
          TObject(DataModule1.FDQuerySectionName.FieldByName('SectionID').asInteger));
        DataModule1.FDQuerySectionName.Next;
      end;
      GroupBoxSubSection.Caption := 'Подразделы для ' + ListBoxSectionNameDest.Items[ListBoxSectionNameDest.ItemIndex];
    end;
  finally
    DataModule1.FDQuerySectionName.Close;
  end;
end;

// Переместить выбранную запись вправо
procedure TFormAddEmployee.MoveSelectedToRight(src, dest: TListBox);
var Index: Integer;
    SectionInfo: TSectionInfo;
begin
  if src.ItemIndex <> -1 then
  begin
    Index := src.ItemIndex;
    dest.Items.AddObject(
      src.Items[Index],
      src.Items.Objects[Index]
    );

    if dest = ListBoxSectionNameDest then begin
      SectionInfo.SectionName := dest.Items[dest.count-1];
      SectionInfo.SectionID := Integer(dest.Items.Objects[dest.count-1]);
      SectionInfo.ExactSectionName := '';
      SectionInfo.ExactSectionID := 0;

      SelectedSections.Add(SectionInfo);
    end;

    if dest = ListBoxSubSectionDest then begin
      for var i := 0 to SelectedSections.Count - 1 do begin
        if SelectedSections[i].SectionID = Integer(ListBoxSectionNameDest.Items.Objects[dest.count-1]) then begin
          SectionInfo := SelectedSections[i];
          SectionInfo.SectionID := Integer(dest.Items.Objects[dest.count-1]);
          SectionInfo.ExactSectionName := dest.Items[dest.count-1];
          SelectedSections[i] := SectionInfo;
          Break;
        end;
      end;
    end;

    UpdateTwoColumnListBox();

    src.Items.Delete(Index);
  end;
end;

procedure TFormAddEmployee.SpeedButtonSectionNameIncClick(Sender: TObject);
begin
  MoveSelectedToRight(ListBoxSectionNameSrc, ListBoxSectionNameDest);
end;

procedure TFormAddEmployee.SpeedButtonSubSectionIncClick(Sender: TObject);
begin
  MoveSelectedToRight(ListBoxSubSectionSrc, ListBoxSubSectionDest);
end;

procedure TFormAddEmployee.ListBoxSectionNameSrcDblClick(Sender: TObject);
begin
  ListBoxSubSectionSrc.Clear;
  ListBoxSubSectionDest.Clear;
  GroupBoxSubSection.Caption := 'Подразделы';
  MoveSelectedToRight(ListBoxSectionNameSrc, ListBoxSectionNameDest);
end;

// Переместить все записи вправо
procedure TFormAddEmployee.MoveAllToRight(src, dest: TListBox);
var
  I: Integer;
begin
  for I := 0 to src.Count - 1 do
    dest.Items.AddObject(
      src.Items[I],
      src.Items.Objects[I]
    );
  src.Clear;
end;

procedure TFormAddEmployee.SpeedButtonSectionNameIncAllClick(Sender: TObject);
begin
  MoveAllToRight(ListBoxSectionNameSrc, ListBoxSectionNameDest);
end;

procedure TFormAddEmployee.SpeedButtonSubSectionIncAllClick(Sender: TObject);
begin
  MoveAllToRight(ListBoxSubSectionSrc, ListBoxSubSectionDest);
end;

// Переместить выбранную запись влево
procedure TFormAddEmployee.MoveSelectedToLeft(src, dest: TListBox);
var
  Index: Integer;
begin
  if dest.ItemIndex <> -1 then
  begin
    Index := dest.ItemIndex;
    src.Items.AddObject(
      dest.Items[Index],
      dest.Items.Objects[Index]
    );
    dest.Items.Delete(Index);
  end;
end;

procedure TFormAddEmployee.SpeedButtonSectionNameExClick(Sender: TObject);
begin
  MoveSelectedToLeft(ListBoxSectionNameSrc, ListBoxSectionNameDest);
end;

procedure TFormAddEmployee.SpeedButtonSubSectionExClick(Sender: TObject);
begin
  MoveSelectedToLeft(ListBoxSubSectionSrc, ListBoxSubSectionDest);
end;

procedure TFormAddEmployee.ListBoxSectionNameDestDblClick(Sender: TObject);
begin
  ListBoxSubSectionSrc.Clear;
  ListBoxSubSectionDest.Clear;
  GroupBoxSubSection.Caption := 'Подразделы';
  MoveSelectedToLeft(ListBoxSectionNameSrc, ListBoxSectionNameDest);
end;

// Переместить все записи влево
procedure TFormAddEmployee.MoveAllToLeft(src, dest: TListBox);
var
  I: Integer;
begin
  for I := 0 to dest.Count - 1 do
    src.Items.AddObject(
      dest.Items[I],
      dest.Items.Objects[I]
    );
  dest.Clear;
end;

procedure TFormAddEmployee.SpeedButtonSectionNameExAllClick(Sender: TObject);
begin
  MoveAllToLeft(ListBoxSectionNameSrc, ListBoxSectionNameDest);
end;

procedure TFormAddEmployee.SpeedButtonSubSectionExAllClick(Sender: TObject);
begin
  MoveAllToLeft(ListBoxSubSectionSrc, ListBoxSubSectionDest);
end;

procedure TFormAddEmployee.UpdateTwoColumnListBox();
var
  I: Integer;
  DisplayText: string;
begin
  ListBoxSections.Clear;
  for I := 0 to SelectedSections.Count - 1 do
  begin
    DisplayText := SelectedSections[I].SectionName;
    if SelectedSections[I].ExactSectionName <> '' then
      DisplayText := DisplayText + ' - ' + SelectedSections[I].ExactSectionName;
    ListBoxSections.Items.Add(DisplayText);
  end;
end;

end.
