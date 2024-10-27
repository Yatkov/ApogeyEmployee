program ApogeyEmployee;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {FormMain},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  UnitAddEmployee in 'UnitAddEmployee.pas' {FormAddEmployee};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.Title := 'Сотрудники';
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFormMain, FormMain);
  //Application.CreateForm(TFormAddEmployee, FormAddEmployee);
  Application.Run;
end.
