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
    DBComboBoxPosts: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
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
  DBGridEmployees.Columns[0].Visible := false;
  DBGridEmployees.Columns[1].Width := 250;
  DBGridEmployees.Columns[2].Visible := false;
  DBGridEmployees.Columns[3].Visible := false;
  DBGridEmployees.Columns[4].Visible := false;
  DBGridEmployees.Columns[5].Visible := false;
  DBGridEmployees.Columns[6].Visible := false;

  DBComboBoxPosts.DataField := 'PostName';
end;

end.
