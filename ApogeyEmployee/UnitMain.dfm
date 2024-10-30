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
    ActivePage = TabSheetRead
    Align = alClient
    TabHeight = 30
    TabOrder = 0
    object TabSheetRead: TTabSheet
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072#1093
      OnShow = TabSheetReadShow
      object PanelEmployeesList: TPanel
        Left = 0
        Top = 0
        Width = 681
        Height = 646
        Align = alLeft
        TabOrder = 0
        object DBGridEmployeesList: TDBGrid
          Left = 1
          Top = 33
          Width = 679
          Height = 593
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
        object PanelDBControl: TPanel
          Left = 1
          Top = 1
          Width = 679
          Height = 32
          Align = alTop
          Padding.Left = 5
          Padding.Top = 3
          Padding.Right = 5
          Padding.Bottom = 3
          TabOrder = 1
          object Bevel4: TBevel
            Left = 238
            Top = 4
            Width = 27
            Height = 24
            Align = alLeft
            Shape = bsSpacer
          end
          object SearchBoxFindEmployee: TSearchBox
            Left = 6
            Top = 4
            Width = 217
            Height = 24
            Align = alLeft
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            TextHint = #1055#1086#1080#1089#1082
            StyleName = 'Windows'
            OnChange = SearchBoxFindEmployeeChange
            ExplicitHeight = 23
          end
          object ButtonSearchSettings: TButton
            Left = 223
            Top = 4
            Width = 15
            Height = 24
            Align = alLeft
            DropDownMenu = PopupMenuSearchSettings
            ImageAlignment = iaCenter
            ImageIndex = 1
            Style = bsSplitButton
            TabOrder = 1
          end
          object BitBtnSectionsFind: TBitBtn
            Left = 265
            Top = 4
            Width = 152
            Height = 24
            Align = alLeft
            Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1088#1072#1079#1076#1077#1083#1072#1084
            ImageIndex = 1
            Images = ImageList
            TabOrder = 2
            OnClick = BitBtnSectionsFindClick
          end
        end
        object StatusBarEmployeeCount: TStatusBar
          Left = 1
          Top = 626
          Width = 679
          Height = 19
          Panels = <
            item
              Width = 50
            end>
          ExplicitLeft = 64
          ExplicitTop = 216
          ExplicitWidth = 0
        end
      end
      object ScrollBoxEmployeeInfo: TScrollBox
        Left = 681
        Top = 0
        Width = 408
        Height = 646
        Align = alClient
        Padding.Left = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        object Bevel1: TBevel
          Left = 5
          Top = 114
          Width = 394
          Height = 8
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 113
        end
        object DBTextContact: TDBText
          Left = 5
          Top = 97
          Width = 394
          Height = 17
          Cursor = crHandPoint
          Hint = #1058#1077#1083#1077#1075#1088#1072#1084
          Align = alTop
          DataSource = DataModule1.DataSourceEmployeeSQL
          ParentShowHint = False
          ShowHint = True
          OnClick = DBTextContactClick
          OnMouseEnter = DBTextContactMouseEnter
          OnMouseLeave = DBTextContactMouseLeave
          ExplicitLeft = 3
          ExplicitTop = 81
        end
        object EmployeeData: TPanel
          Left = 5
          Top = 122
          Width = 394
          Height = 515
          Align = alClient
          BevelOuter = bvNone
          Padding.Left = 100
          TabOrder = 0
          object Bevel2: TBevel
            Left = 100
            Top = 38
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
            Top = 81
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
            Top = 122
            Width = 294
            Height = 18
            Align = alTop
            Shape = bsSpacer
            ExplicitLeft = 88
            ExplicitTop = 201
            ExplicitWidth = 287
          end
          object LabelMapLink: TLabel
            Left = 100
            Top = 23
            Width = 294
            Height = 15
            Cursor = crHandPoint
            Align = alTop
            Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1085#1072' '#1082#1072#1088#1090#1077
            OnClick = LabelMapLinkClick
            OnMouseEnter = LabelMapLinkMouseEnter
            OnMouseLeave = LabelMapLinkMouseLeave
            ExplicitWidth = 99
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
          object DBLabeledEditGrade: TDBLabeledEdit
            Left = 100
            Top = 99
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
            TabOrder = 1
            StyleName = 'Windows'
            EditLabel.Width = 32
            EditLabel.Height = 23
            EditLabel.Caption = #1043#1088#1077#1081#1076
            LabelPosition = lpLeft
            LabelSpacing = 20
          end
          object DBLabeledEditPost: TDBLabeledEdit
            Left = 100
            Top = 56
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
            TabOrder = 2
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
            TabOrder = 3
            Visible = False
            OnChange = DBEditEmployeeIDChange
          end
          object PanelSections: TPanel
            Left = 100
            Top = 140
            Width = 294
            Height = 198
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 4
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
          Top = 64
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
        object PanelEmployeeEdit: TPanel
          Left = 5
          Top = 0
          Width = 394
          Height = 64
          Align = alTop
          BevelOuter = bvNone
          Padding.Top = 10
          Padding.Bottom = 30
          TabOrder = 2
          object BitBtnEmployeeEdit: TBitBtn
            Left = 0
            Top = 10
            Width = 152
            Height = 24
            Align = alLeft
            Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Segoe UI'
            Font.Style = []
            ImageIndex = 0
            Glyph.Data = {
              42090000424D4209000000000000420000002800000018000000180000000100
              20000300000000090000A6000000A600000000000000000000000000FF0000FF
              0000FF000000E4D8D041E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6
              D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6
              D1C8E4D6D1C8E4D6D1C8E4D5D154FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008578658EA6998AE0E1D3CEC9E5D5D1B8E7D5CE2AE4D6D1C8E4D6
              D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6D1C8E4D6
              D1C8E4D6D1C8E4D6D1C8E4D5D154FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0062563F91675840FF778187E884AEDF689999CC05FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00676359797891ABF786B1E2FF86B1E2FF86B1E2DE86B0E2618080
              FF02FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00789AC0517DA4D0FF86B1E2FF86B1E2FF86B1E2FF86B1E2FF6FC3
              F2A1FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF007C9DCB277CA2CDFF86B1E2FF86B1E2FF86B2E3FE7DB7E8FF60CD
              FDFD5CD1FF3DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF008080AA067AA0CAFD86B1E2FF85B1E2FF72B5EFFF5EBFFCF45CD0
              FFFF5CD0FFE05BC8FF0EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00709ED1E17FAEE3FF57AAF8F95FB8FBFF5FB8FBFF5CC7
              FDFE5CD0FFFF5CD0FFA4FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF003D98F92A4298F9F64299F9FF5BB3FBF35FB8FBFF5FB9
              FBF85CCDFFFF5CD0FFFF5CD1FF59FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF004297F86C4198F9FF469DF9FF5EB7FBFB5FB8
              FBFF5EBDFCF35CD0FFFF5CD0FFEF5ECCFF1EFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004097F9B64198F9FF4EA6FAFC5FB8
              FBFF5FB8FBFF5EC5FDFA5CD0FFFF5CD1FFC080FFFF02FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004095F4184198F8EB4198F9FF58B0
              FBF45FB8FBFF5FB8FBFC5DCBFEFF5CD0FFFF5BD0FF78FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004198F94F4198F9FF449B
              F9FF5EB7FBF75FB8FBFF5EBAFBF45CCFFFFF5CD0FFFA5CD1FF32FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004198F89A4198
              F9FF4AA2FAFF5FB8FBFF5FB8FBFF5EC1FCF75CD0FFFF5DD0FFD766CCFF0AFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0046A2FF0B4298
              F9DA4198F9FF54ACFBF65FB8FBFF5FB8FBFF5DC9FEFF5CD0FFFF5CCFFF96FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004297
              FA364198F9FB4299F9FF5CB5FBF45FB8FBFF5EBAFBF65CCEFFFF92D3EEEEE2D7
              D047FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF004199F97D4198F9FF479FF9FF5FB7FBFD68BAF8FFC0D1DDE8E4D6D1FFE4D6
              D2E6E4D7D713FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0055AAFF034197F9C54198F9FF78B4EEF1DED4D3EFE4D6D1FFE4D6D1FFE3D5
              D1FF9A9BE0B5FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF003E9BF72198B2D1DDE0D2CDFEE4D6D1FFE4D6D1FFD1C7D4FF636F
              E8F54054EFFF4154EF5EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C9BDBD64CFC3BEFFE4D6D1FFACAADBFF4658EFF84054
              EFFF4054EFFF4055F0C7FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C0B6BDB3737AD6F84054EFFF4054EFFF4054
              EFFF4054EFFF3F53EF8DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF005E71D01B3E4FD3E93F53E8FF4054EFFF4054
              EFFB3F54EE790000FF01FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003C4FD5373E50D3D33E51DFA94155
              F227FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
              000000000000}
            ParentFont = False
            TabOrder = 0
            OnClick = BitBtnEmployeeEditClick
          end
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
        Height = 619
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
          ImageIndex = 1
          OnClick = ToolButtonDeleteClick
        end
      end
    end
  end
  object PopupMenuSearchSettings: TPopupMenu
    Left = 388
    Top = 82
    object N1: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1060#1048#1054
      Checked = True
      OnClick = NSearchSettingClick
    end
    object N2: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1075#1086#1088#1086#1076#1091
      OnClick = NSearchSettingClick
    end
    object N3: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1076#1086#1083#1078#1085#1086#1089#1090#1080
      OnClick = NSearchSettingClick
    end
    object N4: TMenuItem
      Caption = #1055#1086#1080#1089#1082' '#1087#1086' '#1075#1088#1077#1081#1076#1091
      OnClick = NSearchSettingClick
    end
  end
  object ImageList: TImageList
    Left = 268
    Top = 84
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000E3D5D524E4D6D1FFE4D6D1FFE4D6
      D1FFE4D6D1FFE4D6D1FFE4D6D1FFE4D6D1FFE4D6D1FFE4D6D1FFE4D6D1FFE4D6
      D1FF000000000000000000000000000000000000000000000000000000000000
      0000673E2925663C285A653C2944000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7D7CF20E7D7CF20EAD5
      D50CE7D7CF20E7D7CF20E7D7CF20E7D7CF20E7D7CF20E7D7CF20E7D7CF20E6D6
      CE1F0000000000000000000000000000000000000000000000006D4129BC9065
      2AFBE2B12BFFF0BF2CFFEABA2CFFAA7E2AFF673E28FC6644220F000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063553E6F6B5B41FF86ACDD4A0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000693F2AFBFFCB2FFFFFCB
      2FFFFFCB2FFFFFCB2FFFFFCB2FFFFECA2FFFEEBD2CFF946729FC653C29440000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006C6C662D85AFDFFF86B1E2FF86B1
      E2FF76B7EB270000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000683E28FCFFCB2FFFFFCB2FFFFFCB
      2FFFFFCB2FFFFFCB2FFFFFCB2FFFFFCB2FFFFFCB2FFFC2922BFF6A3F29956840
      2BCB000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081AAD8FF86B1E2FF86B1
      E2FF63CBFAFF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093535BFAA6772CFCFFCB2FFFFFCB
      2FFFFFCB2FFFFFCB2FFFFFCB2FFFFFCB2FFF9A6D2CFC663A2846663F29F78FC9
      51FF673F2AE600000000000000006A3E2DAE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007EA5D2FF7CB2E9FD5FB8
      FBFF5CCFFFFF5CCFFFDC00000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF86D9FFFD85D7FF704231FBD2A1
      2DFFFFCB2FFFFFCB2FFFFFCB2FFF764B2AF968392F1B673E29FD9BDE59FF99DB
      58FF797D3BFD0000000000000000693D2DFC0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000459AF79F4198F9FF5FB8
      FBFF5FB9FBFE5CD0FFFF5CD1FF53000000000000000000000000000000000000
      000000000000000000000000000000000000FF86D9FFFF86D9FFFF86D9FFE278
      B8FF683E29FEF5C12FFF673D28FD643825296E5430FA9BDE59FF9BDE59FF9BDE
      59FF90CC52FF673C284D00000000894D51F30000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004198F9FB469D
      F9FF5FB8FBFF5DBFFCFB5CD0FFFF00FFFF010000000000000000000000000000
      000000000000000000000000000000000000FF86D9FFFF86D9FFFF86D9FFFF86
      D9FFFF86D9FF7C4742FB643B2A3D777339FE9BDE59FF9BDE59FF9BDE59FF9BDE
      59FF92D154FF653D287E0000000076443CF40000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000055AAFF034198
      F9FF57AFFAFA5FB8FBFF5CCDFEFF5CD0FFF80000000000000000000000000000
      000000000000000000000000000000000000FF86D9FFFF86D9FFFF86D9FFFF86
      D9FFFF86D9FF844B4CF900000000653D28536A4A2DF89ADD59FF9BDE59FF9BDE
      59FF94D455FF653D2865000000006A3E2EF00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004099
      FA5F4198F9FF5FB8FBFF5FB8FBFF5CD0FFFF5BD0FF9100000000000000000000
      000000000000000000000000000000000000FF86D9FFFF86D9FFFF86D9FFFF86
      D9FFFF86D9FF844B4CF9663D2971653F2FDF0000000067402AA37A773BFA9BDE
      59FF84A247FF6040200800000000673A28390000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00004198F9E34299F9FF5FB8FBFF5EBAFCF95CD0FFFF59CCFF14000000000000
      00000000000000000000000000000000000092525DF9FF86D9FFFF86D9FFFF86
      D9FFFF86D9FF844B4CF9673C287242BAF5FF5A6469F9643D2C9B00000001673F
      2AE9663C2AFE0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004198F9FF50A8FAFE5FB8FBFF5EC8FEFFE2D6D1FA000000000000
      000000000000000000000000000000000000673B294AC86C9AFFFF86D9FFFF86
      D9FFFF86D9FF844B4CF9673C287242BAF5FF42BAF5FF43B8F2FF644436F9673B
      294A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004398F92A4198F9FF8CC1ECEEE4D6D1FFE4D6D1FFBEB8D8CD0000
      00000000000000000000000000000000000000000000673D2A43804948F9FF86
      D9FFFF86D9FF844B4CF9673C287242BAF5FF42BAF5FF42BAF5FF42BAF5FF449C
      C7FF663D2DBB0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B7B9C4C2E3D5D0FFE4D6D1FF6672E8FC4054EFFF3E55
      F02100000000000000000000000000000000000000000000000000000000663D
      2A7A663C29FE663C29FF673C287242BAF5FF42BAF5FF42BAF5FF3EAFE7FF653F
      2EFC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C2B7BBFF4054EFFF4054EFFF4054EFFF4053
      F034000000000000000000000000000000000000000000000000000000000000
      00000000000000000000673C287242BAF5FF41B6F0FF43A0CDFF663D2CFB0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003749C80E3E50DBFF4054EFFF4257F0230000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000653C296F634233F9653F2DF3643B2A3D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00000FF1FF00000000800FC03F00000000
      1FFF801F0000000007FF000F0000000087FF00060000000083FF000600000000
      81FF000200000000C0FF000200000000C0FF020200000000E07F008200000000
      F03F000700000000F83F000F00000000F81F800700000000FC0FE00F00000000
      FE0FFC1F00000000FE1FFC3F0000000000000000000000000000000000000000
      000000000000}
  end
end
