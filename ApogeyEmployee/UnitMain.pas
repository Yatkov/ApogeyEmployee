unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.WinXCtrls;

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
    SearchBox1: TSearchBox;
    EditName: TEdit;
    DBLabeledEditCity: TDBLabeledEdit;
    DBLabeledEditPost: TDBLabeledEdit;
    DBLabeledEditGrade: TDBLabeledEdit;
    DBLabeledEditSection: TDBLabeledEdit;
    DBLabeledEditContact: TDBLabeledEdit;
    ScrollBoxEmployeeInfo: TScrollBox;
    procedure SearchBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses DataModule;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  DataModule1.FDConEmployee.Open;
  DataModule1.FDTableEmployee.Open;

  DBGridEmployeesList.Columns[0].Width := 100;
  DBGridEmployeesList.Columns[1].Width := 100;
  DBGridEmployeesList.Columns[2].Width := 100;
  DBGridEmployeesList.Columns[3].Width := 100;
  DBGridEmployeesList.Columns[4].Width := 100;
end;

procedure TFormMain.SearchBox1Change(Sender: TObject);
begin
  //DataModule1.FDConEmployee.DriverName := 'SQLite';
end;

end.
