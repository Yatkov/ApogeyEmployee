object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 686
  ClientWidth = 968
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
    Width = 968
    Height = 686
    ActivePage = TabSheetRead
    Align = alClient
    TabOrder = 0
    object TabSheetRead: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1093
      object PanelEmployeesList: TPanel
        Left = 0
        Top = 0
        Width = 353
        Height = 656
        Align = alLeft
        TabOrder = 0
        object DBGridEmployeesList: TDBGrid
          Left = 1
          Top = 24
          Width = 351
          Height = 631
          Align = alClient
          DataSource = DataModule1.DataSourceEmployee
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
          Width = 351
          Height = 23
          Align = alTop
          TabOrder = 1
          Text = 'SearchBox1'
          OnChange = SearchBox1Change
        end
      end
      object ScrollBoxEmployeeInfo: TScrollBox
        Left = 353
        Top = 0
        Width = 607
        Height = 656
        Align = alClient
        Padding.Left = 5
        Padding.Top = 25
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        DesignSize = (
          603
          652)
        object DBLabeledEditCity: TDBLabeledEdit
          Left = 82
          Top = 104
          Width = 511
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 0
          EditLabel.Width = 33
          EditLabel.Height = 23
          EditLabel.Caption = #1043#1086#1088#1086#1076
          LabelPosition = lpLeft
          LabelSpacing = 10
        end
        object DBLabeledEditPost: TDBLabeledEdit
          Left = 82
          Top = 152
          Width = 511
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 1
          EditLabel.Width = 64
          EditLabel.Height = 23
          EditLabel.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          LabelPosition = lpLeft
          LabelSpacing = 10
        end
        object DBLabeledEditGrade: TDBLabeledEdit
          Left = 82
          Top = 200
          Width = 511
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 2
          EditLabel.Width = 32
          EditLabel.Height = 23
          EditLabel.Caption = #1043#1088#1077#1081#1076
          LabelPosition = lpLeft
          LabelSpacing = 10
        end
        object DBLabeledEditSection: TDBLabeledEdit
          Left = 82
          Top = 248
          Width = 511
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 3
          EditLabel.Width = 61
          EditLabel.Height = 23
          EditLabel.Caption = #1056#1072#1079#1076#1077#1083'(-'#1099')'
          LabelPosition = lpLeft
          LabelSpacing = 10
        end
        object DBLabeledEditContact: TDBLabeledEdit
          Left = 82
          Top = 296
          Width = 511
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataSource = DataModule1.DataSourceEmployee
          TabOrder = 4
          EditLabel.Width = 43
          EditLabel.Height = 23
          EditLabel.Caption = #1050#1086#1085#1090#1072#1082#1090
          LabelPosition = lpLeft
          LabelSpacing = 10
        end
        object EditName: TEdit
          Left = 5
          Top = 25
          Width = 593
          Height = 33
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -18
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
    end
    object TabSheetWrite: TTabSheet
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
      ImageIndex = 1
      object DBGridEmployees: TDBGrid
        Left = 0
        Top = 29
        Width = 960
        Height = 627
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
      end
      object ToolBarDBControl: TToolBar
        Left = 0
        Top = 0
        Width = 960
        Height = 29
        ButtonHeight = 23
        ButtonWidth = 61
        ShowCaptions = True
        TabOrder = 1
        object ToolButtonAdd: TToolButton
          Left = 0
          Top = 0
          Caption = #1044#1086#1073#1072#1074#1080#1090#1100
          ImageIndex = 0
        end
        object ToolButtonDelete: TToolButton
          Left = 61
          Top = 0
          Caption = #1059#1076#1072#1083#1080#1090#1100
          ImageIndex = 1
        end
      end
    end
  end
end
