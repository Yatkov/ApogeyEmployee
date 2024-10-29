object FormSectionsFind: TFormSectionsFind
  Left = 0
  Top = 0
  Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1088#1072#1079#1076#1077#1083#1072#1084
  ClientHeight = 456
  ClientWidth = 673
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
  object DBGridEmployees: TDBGrid
    Left = 0
    Top = 0
    Width = 313
    Height = 456
    Align = alLeft
    DataSource = DataModule1.DataSourceEmployeeSQL
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object PanelSections: TPanel
    Left = 313
    Top = 0
    Width = 360
    Height = 456
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 232
    ExplicitTop = 176
    ExplicitWidth = 185
    ExplicitHeight = 41
    object RadioGroupSections: TRadioGroup
      Left = 1
      Top = 25
      Width = 358
      Height = 430
      Align = alClient
      Caption = #1056#1072#1079#1076#1077#1083#1099
      TabOrder = 0
      ExplicitLeft = 289
      ExplicitTop = 0
      ExplicitWidth = 321
      ExplicitHeight = 423
    end
    object PanelPostSelect: TPanel
      Left = 1
      Top = 1
      Width = 358
      Height = 24
      Align = alTop
      Padding.Left = 5
      Padding.Right = 5
      TabOrder = 1
      ExplicitWidth = 319
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
      object DBComboBoxPosts: TDBComboBox
        Left = 102
        Top = 1
        Width = 250
        Height = 23
        Align = alClient
        DataSource = DataModule1.DataSourcePost
        TabOrder = 0
        ExplicitLeft = 160
        ExplicitTop = 16
        ExplicitWidth = 145
      end
    end
  end
end
