object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 686
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  RoundedCorners = rcSmall
  WindowState = wsMaximized
  ShowInTaskBar = True
  OnCreate = FormCreate
  TextHeight = 15
  object PageControlMain: TPageControl
    Left = 0
    Top = 0
    Width = 1014
    Height = 686
    ActivePage = TabSheetWrite
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 968
    object TabSheetRead: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1093
      object PanelEmployeesList: TPanel
        Left = 0
        Top = 0
        Width = 625
        Height = 656
        Align = alLeft
        TabOrder = 0
        object DBGridEmployeesList: TDBGrid
          Left = 1
          Top = 24
          Width = 623
          Height = 631
          Align = alClient
          DataSource = DataModule1.DataSourceEmployeeSQL
          Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object SearchBox1: TSearchBox
          Left = 1
          Top = 1
          Width = 623
          Height = 23
          Align = alTop
          TabOrder = 1
          Text = 'SearchBox1'
          OnChange = SearchBox1Change
          ExplicitWidth = 351
        end
      end
      object ScrollBoxEmployeeInfo: TScrollBox
        Left = 625
        Top = 0
        Width = 381
        Height = 656
        Align = alClient
        Padding.Left = 5
        Padding.Top = 25
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        ExplicitLeft = 353
        ExplicitWidth = 607
        DesignSize = (
          377
          652)
        object DBLabeledEditCity: TDBLabeledEdit
          Left = 82
          Top = 104
          Width = 285
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 0
          EditLabel.Width = 33
          EditLabel.Height = 23
          EditLabel.Caption = #1043#1086#1088#1086#1076
          LabelPosition = lpLeft
          LabelSpacing = 10
          ExplicitWidth = 511
        end
        object DBLabeledEditPost: TDBLabeledEdit
          Left = 82
          Top = 152
          Width = 285
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 1
          EditLabel.Width = 62
          EditLabel.Height = 23
          EditLabel.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          LabelPosition = lpLeft
          LabelSpacing = 10
          ExplicitWidth = 511
        end
        object DBLabeledEditGrade: TDBLabeledEdit
          Left = 82
          Top = 200
          Width = 285
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 2
          EditLabel.Width = 32
          EditLabel.Height = 23
          EditLabel.Caption = #1043#1088#1077#1081#1076
          LabelPosition = lpLeft
          LabelSpacing = 10
          ExplicitWidth = 511
        end
        object DBLabeledEditSection: TDBLabeledEdit
          Left = 82
          Top = 248
          Width = 285
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 3
          EditLabel.Width = 59
          EditLabel.Height = 23
          EditLabel.Caption = #1056#1072#1079#1076#1077#1083'(-'#1099')'
          LabelPosition = lpLeft
          LabelSpacing = 10
          ExplicitWidth = 511
        end
        object DBLabeledEditContact: TDBLabeledEdit
          Left = 82
          Top = 296
          Width = 285
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 4
          EditLabel.Width = 43
          EditLabel.Height = 23
          EditLabel.Caption = #1050#1086#1085#1090#1072#1082#1090
          LabelPosition = lpLeft
          LabelSpacing = 10
          ExplicitWidth = 511
        end
        object EditName: TEdit
          Left = 5
          Top = 25
          Width = 367
          Height = 33
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          ExplicitWidth = 593
        end
      end
    end
    object TabSheetWrite: TTabSheet
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
      ImageIndex = 1
      object DBGridEmployees: TDBGrid
        Left = 0
        Top = 27
        Width = 1006
        Height = 629
        Align = alClient
        DataSource = DataModule1.DataSourceEmployee
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object ToolBarDBControl: TToolBar
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 1000
        Height = 21
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 130
        DrawingStyle = dsGradient
        List = True
        ShowCaptions = True
        TabOrder = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 1006
        object ToolButtonAdd: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
          ImageIndex = 0
          OnClick = ToolButtonAddClick
        end
        object ToolButtonDelete: TToolButton
          Left = 130
          Top = 0
          Caption = #1059#1076#1072#1083#1080#1090#1100
          Enabled = False
          ImageIndex = 1
        end
      end
    end
  end
end
