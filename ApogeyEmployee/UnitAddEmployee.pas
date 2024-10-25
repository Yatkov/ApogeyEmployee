unit UnitAddEmployee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TFormAddEmployee = class(TForm)
    DBLabeledEditMiddleName: TDBLabeledEdit;
    Bevel1: TBevel;
    DBLabeledEditFirstName: TDBLabeledEdit;
    Bevel2: TBevel;
    DBLabeledEditLastName: TDBLabeledEdit;
    Bevel3: TBevel;
    DBLabeledEditCity: TDBLabeledEdit;
    Bevel4: TBevel;
    DBLabeledEditPost: TDBLabeledEdit;
    Bevel5: TBevel;
    DBLabeledEditGrade: TDBLabeledEdit;
    Bevel6: TBevel;
    DBComboBox1: TDBComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddEmployee: TFormAddEmployee;

implementation

{$R *.dfm}

uses DataModule;

end.
