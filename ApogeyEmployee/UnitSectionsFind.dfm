object FormSectionsFind: TFormSectionsFind
  Left = 0
  Top = 0
  Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1088#1072#1079#1076#1077#1083#1072#1084
  ClientHeight = 456
  ClientWidth = 856
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object PanelSections: TPanel
    Left = 521
    Top = 0
    Width = 335
    Height = 456
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 313
    ExplicitWidth = 360
    object RadioGroupSections: TRadioGroup
      Left = 1
      Top = 25
      Width = 333
      Height = 430
      Align = alClient
      Caption = #1056#1072#1079#1076#1077#1083#1099
      TabOrder = 0
      OnClick = RadioGroupSectionsClick
      ExplicitLeft = 136
      ExplicitWidth = 534
    end
    object PanelPostSelect: TPanel
      Left = 1
      Top = 1
      Width = 333
      Height = 24
      Align = alTop
      Padding.Left = 5
      Padding.Right = 5
      TabOrder = 1
      ExplicitWidth = 358
      object LabelPostSelect: TLabel
        Left = 6
        Top = 1
        Width = 96
        Height = 22
        Align = alLeft
        AutoSize = False
        Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
        Layout = tlCenter
        ExplicitLeft = 1
      end
      object ComboBoxPost: TComboBox
        Left = 102
        Top = 1
        Width = 225
        Height = 23
        Align = alClient
        Style = csDropDownList
        TabOrder = 0
        OnChange = ComboBoxPostChange
        ExplicitWidth = 250
      end
    end
  end
  object PanelGridEmployee: TPanel
    Left = 0
    Top = 0
    Width = 521
    Height = 456
    Align = alLeft
    TabOrder = 1
    object DBGridEmployees: TDBGrid
      Left = 1
      Top = 1
      Width = 519
      Height = 431
      Align = alClient
      DataSource = DataModule1.DataSourceSectionFind
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
    object PanelGridSettings: TPanel
      Left = 1
      Top = 432
      Width = 519
      Height = 23
      Align = alBottom
      TabOrder = 1
      object CheckBoxShowSubSection: TCheckBox
        Left = 1
        Top = 1
        Width = 144
        Height = 21
        Align = alLeft
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1087#1086#1076#1088#1072#1079#1076#1077#1083
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBoxShowSubSectionClick
      end
    end
  end
end
