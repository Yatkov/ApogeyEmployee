unit UnitAddEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.CheckLst, System.Generics.Collections,
  Vcl.ComCtrls, System.RegularExpressions;

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
    BitBtnSave: TBitBtn;
    ImageList1: TImageList;
    ButtonCancel: TButton;
    Bevel10: TBevel;
    Bevel11: TBevel;
    ShapeMiddleName: TShape;
    LabelMsg: TLabel;
    TimerMsg: TTimer;
    TreeViewSections: TTreeView;
    StatusBarSectionCounter: TStatusBar;
    DBEditEmpID: TDBEdit;
    ShapeFirstName: TShape;
    ShapeLastName: TShape;
    ShapeContact: TShape;
    ShapeCity: TShape;
    ShapePost: TShape;
    ShapeGrade: TShape;
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBoxPostCloseUp(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure TimerMsgTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeViewSectionsCheckStateChanging(Sender: TCustomTreeView;
      Node: TTreeNode; NewCheckState, OldCheckState: TNodeCheckState;
      var AllowChange: Boolean);
    procedure ButtonCancelClick(Sender: TObject);
  private
    { Private declarations }
    UpdatingState: Boolean;
    function checkErrors():boolean;
    procedure UpdateChildrenCheckState(Node: TTreeNode; State: Integer);
    procedure UpdateParentCheckState(Node: TTreeNode);
    procedure checkedCount();
    procedure checkDublicateSection(sectionNameId: String);
    procedure clearSections();
  public
    { Public declarations }
    isEdit: boolean;
    procedure loadSections;
    procedure selectSections;
  end;

var
  FormAddEmployee: TFormAddEmployee;
  isSave: boolean;

implementation

{$R *.dfm}

uses DataModule;

procedure TFormAddEmployee.FormClose(Sender: TObject; var Action: TCloseAction);
var Node: TTreeNode;
begin
  if (not isSave) and (not isEdit) then DataModule1.FDTableEmployee.Delete;
  Node := TreeViewSections.Items.GetFirstNode;
  if Assigned(Node) then TreeViewSections.Free;
  Destroy;
  FormAddEmployee := nil;
end;

procedure TFormAddEmployee.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if isSave then begin
    CanClose := true;
    Exit;
  end;
  if isEdit then begin
    CanClose := true;
    Exit;
  end;
  CanClose:=MessageBox(handle,pchar('Вы хотите отменить добавление сотрудника?'),pchar('Отмена'),36)=IDYes
end;

procedure TFormAddEmployee.FormCreate(Sender: TObject);
begin
  isEdit := false;
  DBEditEmpID.DataField := 'EmployeeID';
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

  isSave := false;
end;

// Кнопка отмены
procedure TFormAddEmployee.ButtonCancelClick(Sender: TObject);
begin
  Close;
end;

// Добавление доступных разделов
procedure TFormAddEmployee.loadSections();
var Node: TTreeNode;
begin
  DataModule1.FDQuerySectionName.SQL.Text := 'SELECT s.SectionNameID, s.Name, e.SectionID, e.FullName'
                                           + ' FROM SectionName s'
                                           + ' LEFT JOIN Sections e ON s.SectionNameID = e.SectionNameID'
                                           + ' WHERE s.PostID = ' + DBLookupComboBoxPost.Field.Text
                                           + ' ORDER BY s.SectionNameID, e.SectionID';
  try
    DataModule1.FDQuerySectionName.Open;
    TreeViewSections.Items.Clear;
    var CurrentSectionNode: TTreeNode := nil;
    var LastSectionID: Integer := -1;
    while not DataModule1.FDQuerySectionName.Eof do begin
      if DataModule1.FDQuerySectionName.FieldByName('SectionNameID').AsInteger <> LastSectionID then begin
        CurrentSectionNode := TreeViewSections.Items.Add(nil, DataModule1.FDQuerySectionName.FieldByName('Name').AsString);
        CurrentSectionNode.Data := TObject(DataModule1.FDQuerySectionName.FieldByName('SectionNameID').AsInteger);
        LastSectionID := DataModule1.FDQuerySectionName.FieldByName('SectionNameID').AsInteger;
      end;

      if not DataModule1.FDQuerySectionName.FieldByName('SectionID').IsNull then begin
        var SubsectionNode := TreeViewSections.Items.AddChild(CurrentSectionNode, DataModule1.FDQuerySectionName.FieldByName('FullName').AsString);
        SubsectionNode.Data := TObject(DataModule1.FDQuerySectionName.FieldByName('SectionID').AsInteger);
      end;
      DataModule1.FDQuerySectionName.Next;
    end;
  finally
    DataModule1.FDQuerySectionName.Close;
  end;

  Node := TreeViewSections.Items.GetFirstNode;
  while Assigned(Node) do begin
    Node.Checked := true;
    Node.Checked := false;
    Node := Node.getNext;
  end;
end;

procedure TFormAddEmployee.selectSections;
var Node: TTreeNode;
begin
  Node := TreeViewSections.Items.GetFirstNode;
  while Assigned(Node) do begin
    //showMessage(IntToStr(Integer(Node.data)));
    Node := Node.getNext;
  end;
end;

procedure TFormAddEmployee.BitBtnSaveClick(Sender: TObject);
var Node: TTreeNode;
begin
  if checkErrors() then begin
    try
      DataModule1.FDTableEmployee.Post;
      Node := TreeViewSections.Items.GetFirstNode;
      while Assigned(Node) do begin
        if (Node.Level = 0) and (Node.StateIndex <> 1) then begin
          DataModule1.FDQuerySectionName.SQL.Text := 'Select EmployeeID, SectionNameID'
                                           + ' From EmployeeSections'
                                           + ' WHERE EmployeeID = '+DBEditEmpID.Text+' AND SectionNameID = '+IntToStr(Integer(Node.Data));
          DataModule1.FDQuerySectionName.Open;
          if DataModule1.FDQuerySectionName.RecordCount = 0 then begin
            DataModule1.FDQuerySectionName.Close;
            DataModule1.FDQuerySectionName.SQL.Text := 'INSERT INTO EmployeeSections (EmployeeID, SectionNameID)'
                                                 + ' VALUES (:EmployeeID, :SectionNameID)';
            DataModule1.FDQuerySectionName.ParamByName('EmployeeID').AsInteger := StrToInt(DBEditEmpID.Text);
            DataModule1.FDQuerySectionName.ParamByName('SectionNameID').AsInteger := Integer(Node.Data);
            DataModule1.FDQuerySectionName.ExecSQL;
          end;

        end else if (Node.Level = 1) and (Node.StateIndex <> 1) then begin
          checkDublicateSection(IntToStr(Integer(Node.Parent.Data)));
          DataModule1.FDQuerySectionName.SQL.Text := 'INSERT INTO EmployeeSections (EmployeeID, SectionNameID, SectionID)'
                                                   + ' VALUES (:EmployeeID, :SectionNameID, :SectionID)';
          DataModule1.FDQuerySectionName.ParamByName('EmployeeID').AsInteger := StrToInt(DBEditEmpID.Text);
          DataModule1.FDQuerySectionName.ParamByName('SectionNameID').AsInteger := Integer(Node.Parent.Data);
          DataModule1.FDQuerySectionName.ParamByName('SectionID').AsInteger := Integer(Node.Data);
          DataModule1.FDQuerySectionName.ExecSQL;
        end;
        Node := Node.getNext;
      end;
      isSave := true;
    finally
      DataModule1.FDQuerySectionName.Close;
    end;
  end;
  if isSave then PostMessage(Self.Handle, WM_CLOSE, 0, 0);
end;

procedure TFormAddEmployee.clearSections();
begin
  DataModule1.FDQuerySectionName.SQL.Text := 'Delete From EmployeeSections'
                                           + ' Where EmployeeID = '+DBEditEmpID.Text;
  try
    DataModule1.FDQuerySectionName.ExecSQL;
  finally
    DataModule1.FDQuerySectionName.Close;
  end;
end;

procedure TFormAddEmployee.checkDublicateSection(sectionNameId: String);
begin
  DataModule1.FDQuerySectionName.Close;
  DataModule1.FDQuerySectionName.SQL.Text := 'Select EmployeeID, SectionNameID, SectionID'
                                           + ' From EmployeeSections'
                                           + ' WHERE EmployeeID = '+DBEditEmpID.Text+' AND SectionNameID = '+sectionNameId+' AND SectionID IS NULL';
  try
    DataModule1.FDQuerySectionName.Open;
    if DataModule1.FDQuerySectionName.RecordCount > 0 then begin
      DataModule1.FDQuerySectionName.Close;
      DataModule1.FDQuerySectionName.SQL.Text := 'Delete From EmployeeSections'
                                               + ' WHERE EmployeeID = '+DBEditEmpID.Text+' AND SectionNameID = '+sectionNameId+' AND SectionID IS NULL';
      DataModule1.FDQuerySectionName.ExecSQL;
    end;
  finally
    DataModule1.FDQuerySectionName.Close;
  end;

end;

// Проверка на корректность заполнения
function TFormAddEmployee.checkErrors():boolean;
var errorMiddleName, errorFirstName, errorLastName, errorTGContact, errorCity, errorPost, errorGrade: boolean;
begin
  errorMiddleName := DBLabeledEditMiddleName.Text = '';
  errorFirstName := DBLabeledEditFirstName.Text = '';
  errorLastName := DBLabeledEditLastName.Text = '';
  errorTGContact := not(TRegEx.IsMatch(DBLabeledEditContact.Text, '^@[a-zA-Z0-9_]+$'));
  errorCity := DBLookupComboBoxCity.Text = '';
  errorPost := DBLookupComboBoxPost.Text = '';
  errorGrade := DBLookupComboBoxGrade.Text = '';

  if errorMiddleName then begin
    shapeMiddleName.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните фамилию!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;

  if errorFirstName then begin
    shapeFirstName.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните имя!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;

  if errorLastName then begin
    shapeLastName.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните отчество!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;

  if errorTGContact then begin
    shapeContact.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните контакт телеграмм в формате @username!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;

  if errorCity then begin
    shapeCity.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните город!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;

  if errorPost then begin
    shapePost.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните должность!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;

  {if errorGrade then begin
    shapeGrade.Pen.Color := clred;
    LabelMsg.Caption := 'Заполните грейд!';
    checkErrors := false;
    TimerMsg.Enabled := true;
    Exit;
  end;  }

  checkErrors := true;
end;

// Завершение работы таймера ошибок
procedure TFormAddEmployee.TimerMsgTimer(Sender: TObject);
begin
  shapeMiddleName.Pen.Color := $00383226;
  shapeFirstName.Pen.Color := $00383226;
  shapeLastName.Pen.Color := $00383226;
  shapeContact.Pen.Color := $00383226;
  shapeCity.Pen.Color := $00383226;
  shapePost.Pen.Color := $00383226;
  shapeGrade.Pen.Color := $00383226;
  LabelMsg.Caption := '';
  TimerMsg.Enabled := false;
end;

procedure TFormAddEmployee.TreeViewSectionsCheckStateChanging(
  Sender: TCustomTreeView; Node: TTreeNode; NewCheckState,
  OldCheckState: TNodeCheckState; var AllowChange: Boolean);
begin
  if UpdatingState then begin
	  AllowChange := True; // Позволяем стандартное изменение, если это вызов из нашего кода
	  Exit;
  end;

  AllowChange := False; // Блокируем стандартное изменение для ручного контроля
  UpdatingState := True;
  try
	  if Node.HasChildren then begin
		  case Node.StateIndex of
			  1: Node.StateIndex := 3; // Unchecked -> Partial
			  3: begin
				    Node.StateIndex := 2; // Partial -> Checked
				    UpdateChildrenCheckState(Node, 2); // Отмечаем все дочерние
			     end;
			  2: begin
				    Node.StateIndex := 1; // Checked -> Unchecked
				    UpdateChildrenCheckState(Node, 1); // Снимаем галочки с дочерних
			     end;
			  end;
		end else begin // Обычное поведение для элементов без дочерних
			if Node.StateIndex = 2 then Node.StateIndex := 1
			else Node.StateIndex := 2;
 		if Node.Parent <> nil then
   			UpdateParentCheckState(Node.Parent);
		end;
		finally
		UpdatingState := False;
	end;

  checkedCount();
end;

procedure TFormAddEmployee.checkedCount();
var Node: TTreeNode;
    counter: Integer;
begin
  Node := TreeViewSections.Items.GetFirstNode;
  counter := 0;
  while Assigned(Node) do begin
    if Node.StateIndex <> 1 then inc(counter);
    Node := Node.getNext;
  end;

  StatusBarSectionCounter.Panels[0].Text := 'Выбрано разделов (с подразделами): ' + IntToStr(counter);
end;

procedure TFormAddEmployee.UpdateChildrenCheckState(Node: TTreeNode; State: Integer);
var ChildNode: TTreeNode;
begin
  ChildNode := Node.getFirstChild;
  while ChildNode <> nil do
  begin
    ChildNode.StateIndex := State;
    UpdateChildrenCheckState(ChildNode, State);
    ChildNode := ChildNode.getNextSibling;
  end;
end;

procedure TFormAddEmployee.UpdateParentCheckState(Node: TTreeNode);
var
  ChildNode: TTreeNode;
  AllChecked, NoneChecked: Boolean;
begin
  AllChecked := True;
  NoneChecked := True;
  ChildNode := Node.getFirstChild;
  while ChildNode <> nil do
  begin
    if ChildNode.StateIndex <> 2 then
      AllChecked := False;
    if ChildNode.StateIndex <> 1 then
      NoneChecked := False;
    ChildNode := ChildNode.getNextSibling;
  end;

  if AllChecked then
    Node.StateIndex := 2
  else if NoneChecked then
    Node.StateIndex := 1
  else
    Node.StateIndex := 3;

  // Обновляем родителя текущего узла
  if Node.Parent <> nil then
    UpdateParentCheckState(Node.Parent);
end;

procedure TFormAddEmployee.DBLookupComboBoxPostCloseUp(Sender: TObject);
begin
  DataModule1.FDQueryGrade.Close;
  if DBLookupComboBoxPost.text <> '' then begin
    DataModule1.FDQueryGrade.SQL.Text := 'SELECT GradeID, GradeName FROM Grades WHERE PostID = ' + DBLookupComboBoxPost.Field.Text;
    try
      DataModule1.FDQueryGrade.Open;
      if DataModule1.FDQueryGrade.RecordCount > 0 then begin
        LabelGrade.Enabled := True;
        DBLookupComboBoxGrade.Enabled := True;
        loadSections();
      end;
    except on e:Exception do
      showMessage(e.Message);
    end;
  end else begin
    LabelGrade.Enabled := False;
    DBLookupComboBoxGrade.Enabled := False;
  end;
end;

end.
