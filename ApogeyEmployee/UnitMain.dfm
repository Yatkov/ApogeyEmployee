object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1080
  ClientHeight = 686
  ClientWidth = 1097
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
    Width = 1097
    Height = 686
    ActivePage = TabSheetWrite
    Align = alClient
    TabOrder = 0
    object TabSheetRead: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1093
      OnShow = TabSheetReadShow
      object PanelEmployeesList: TPanel
        Left = 0
        Top = 0
        Width = 681
        Height = 656
        Align = alLeft
        TabOrder = 0
        object DBGridEmployeesList: TDBGrid
          Left = 1
          Top = 25
          Width = 679
          Height = 630
          Align = alClient
          Color = 5195575
          DataSource = DataModule1.DataSourceEmployeeSQL
          Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
        object ToolBar1: TToolBar
          Left = 1
          Top = 1
          Width = 679
          Height = 24
          ButtonHeight = 23
          ButtonWidth = 71
          Caption = 'ToolBar1'
          ShowCaptions = True
          TabOrder = 1
          object ToolButton1: TToolButton
            Left = 0
            Top = 0
            Caption = 'ToolButton1'
            ImageIndex = 0
          end
          object SearchBoxFindEmployee: TSearchBox
            Left = 71
            Top = 0
            Width = 217
            Height = 23
            Align = alLeft
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TextHint = #1053#1072#1081#1090#1080' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
            StyleName = 'Windows'
            OnChange = SearchBoxFindEmployeeChange
          end
        end
      end
      object ScrollBoxEmployeeInfo: TScrollBox
        Left = 681
        Top = 0
        Width = 408
        Height = 656
        Align = alClient
        Padding.Left = 5
        Padding.Top = 25
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        object Bevel1: TBevel
          Left = 5
          Top = 58
          Width = 394
          Height = 23
          Align = alTop
          Shape = bsSpacer
          ExplicitWidth = 367
        end
        object EmployeeData: TPanel
          Left = 5
          Top = 81
          Width = 394
          Height = 566
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 100
          TabOrder = 0
          object Bevel2: TBevel
            Left = 100
            Top = 42
            Width = 294
            Height = 18
            Align = alTop
            Shape = bsSpacer
            ExplicitLeft = 80
            ExplicitTop = 47
            ExplicitWidth = 287
          end
          object Bevel3: TBevel
            Left = 100
            Top = 85
            Width = 294
            Height = 18
            Align = alTop
            Shape = bsSpacer
            ExplicitLeft = 80
            ExplicitTop = 88
            ExplicitWidth = 287
          end
          object Bevel5: TBevel
            Left = 100
            Top = 126
            Width = 294
            Height = 18
            Align = alTop
            Shape = bsSpacer
            ExplicitLeft = 88
            ExplicitTop = 201
            ExplicitWidth = 287
          end
          object Bevel6: TBevel
            Left = 100
            Top = 169
            Width = 294
            Height = 18
            Align = alTop
            Shape = bsSpacer
          end
          object DBLabeledEditCity: TDBLabeledEdit
            Left = 100
            Top = 0
            Width = 294
            Height = 23
            Align = alTop
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 4998197
            Ctl3D = True
            DataSource = DataModule1.DataSourceEmployeeSQL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            StyleName = 'Windows'
            EditLabel.Width = 33
            EditLabel.Height = 23
            EditLabel.Caption = #1043#1086#1088#1086#1076
            LabelPosition = lpLeft
            LabelSpacing = 20
          end
          object DBLabeledEditContact: TDBLabeledEdit
            Left = 100
            Top = 144
            Width = 294
            Height = 25
            Align = alTop
            BorderStyle = bsNone
            Color = 4998197
            DataSource = DataModule1.DataSourceEmployeeSQL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            StyleName = 'Windows'
            EditLabel.Width = 43
            EditLabel.Height = 25
            EditLabel.Caption = #1050#1086#1085#1090#1072#1082#1090
            LabelPosition = lpLeft
            LabelSpacing = 20
          end
          object DBLabeledEditGrade: TDBLabeledEdit
            Left = 100
            Top = 103
            Width = 294
            Height = 23
            Align = alTop
            BorderStyle = bsNone
            Color = 4998197
            DataSource = DataModule1.DataSourceEmployeeSQL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            StyleName = 'Windows'
            EditLabel.Width = 32
            EditLabel.Height = 23
            EditLabel.Caption = #1043#1088#1077#1081#1076
            LabelPosition = lpLeft
            LabelSpacing = 20
          end
          object DBLabeledEditPost: TDBLabeledEdit
            Left = 100
            Top = 60
            Width = 294
            Height = 25
            Align = alTop
            BorderStyle = bsNone
            Color = 4998197
            DataSource = DataModule1.DataSourceEmployeeSQL
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            StyleName = 'Windows'
            EditLabel.Width = 62
            EditLabel.Height = 25
            EditLabel.Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
            LabelPosition = lpLeft
            LabelSpacing = 20
          end
          object DBEditEmployeeID: TDBEdit
            Left = 8
            Top = 187
            Width = 25
            Height = 23
            DataSource = DataModule1.DataSourceEmployeeSQL
            ReadOnly = True
            TabOrder = 4
            Visible = False
            OnChange = DBEditEmployeeIDChange
          end
          object LinkLabelShowMap: TLinkLabel
            Left = 100
            Top = 23
            Width = 294
            Height = 19
            Align = alTop
            Caption = '<a href="http://www.somelink.com">'#1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1072' '#1082#1072#1088#1090#1077'</a>'
            TabOrder = 5
            UseVisualStyle = True
            OnLinkClick = LinkLabelShowMapLinkClick
            ExplicitWidth = 103
          end
          object PanelSections: TPanel
            Left = 100
            Top = 187
            Width = 294
            Height = 198
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 6
            object DBGridSections: TDBGrid
              Left = 0
              Top = 0
              Width = 530
              Height = 198
              Align = alLeft
              DataSource = DataModule1.DataSourceQuerySections
              Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -12
              TitleFont.Name = 'Segoe UI'
              TitleFont.Style = []
            end
          end
        end
        object DBLabeledEditName: TDBLabeledEdit
          Left = 5
          Top = 25
          Width = 394
          Height = 33
          Align = alTop
          BorderStyle = bsNone
          Color = 4998197
          DataSource = DataModule1.DataSourceEmployeeSQL
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          StyleName = 'Windows'
          EditLabel.Width = 59
          EditLabel.Height = 15
          EditLabel.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        end
      end
    end
    object TabSheetWrite: TTabSheet
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077' '#1073#1072#1079#1099
      ImageIndex = 1
      object DBGridEmployees: TDBGrid
        Left = 0
        Top = 27
        Width = 1089
        Height = 629
        Align = alClient
        DataSource = DataModule1.DataSourceEmployee
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
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
        Width = 1083
        Height = 21
        AutoSize = True
        ButtonHeight = 21
        ButtonWidth = 130
        DrawingStyle = dsGradient
        List = True
        ShowCaptions = True
        TabOrder = 1
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
