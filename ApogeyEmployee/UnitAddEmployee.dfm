object FormAddEmployee: TFormAddEmployee
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
  ClientHeight = 436
  ClientWidth = 848
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object PanelEdits: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 395
    Align = alClient
    Padding.Left = 80
    Padding.Top = 10
    Padding.Right = 15
    Padding.Bottom = 10
    TabOrder = 0
    DesignSize = (
      320
      395)
    object LabelGrade: TLabel
      Left = 38
      Top = 223
      Width = 32
      Height = 15
      Caption = #1043#1088#1077#1081#1076
      Enabled = False
    end
    object Bevel5: TBevel
      Left = 81
      Top = 174
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitLeft = 76
      ExplicitWidth = 374
    end
    object LabelPost: TLabel
      Left = 8
      Top = 188
      Width = 62
      Height = 15
      Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
      FocusControl = DBLookupComboBoxPost
    end
    object Bevel4: TBevel
      Left = 81
      Top = 139
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 134
      ExplicitWidth = 374
    end
    object LabelCity: TLabel
      Left = 37
      Top = 153
      Width = 33
      Height = 15
      Caption = #1043#1086#1088#1086#1076
      FocusControl = DBLookupComboBoxCity
    end
    object Bevel1: TBevel
      Left = 81
      Top = 34
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 40
      ExplicitWidth = 374
    end
    object Bevel2: TBevel
      Left = 81
      Top = 69
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 81
      ExplicitWidth = 374
    end
    object Bevel3: TBevel
      Left = 81
      Top = 104
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitWidth = 374
    end
    object Bevel7: TBevel
      Left = 81
      Top = 209
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 197
      ExplicitWidth = 374
    end
    object Bevel15: TBevel
      Left = 81
      Top = 244
      Width = 223
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 262
    end
    object LabelSections: TLabel
      Left = 13
      Top = 258
      Width = 59
      Height = 15
      Caption = #1056#1072#1079#1076#1077#1083'(-'#1099')'
    end
    object ShapeMiddleName: TShape
      Left = 79
      Top = 9
      Width = 227
      Height = 27
      Anchors = [akLeft, akTop, akRight, akBottom]
      Brush.Style = bsClear
      Pen.Color = 3682854
      Pen.Width = 2
    end
    object DBLookupComboBoxGrade: TDBLookupComboBox
      Left = 81
      Top = 221
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      DropDownRows = 9
      Enabled = False
      ListSource = DataModule1.DataSourceGrade
      TabOrder = 0
    end
    object DBLookupComboBoxPost: TDBLookupComboBox
      Left = 81
      Top = 186
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      DropDownRows = 9
      ListSource = DataModule1.DataSourcePost
      TabOrder = 1
      OnCloseUp = DBLookupComboBoxPostCloseUp
    end
    object DBLookupComboBoxCity: TDBLookupComboBox
      Left = 81
      Top = 151
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      DropDownRows = 9
      ListSource = DataModule1.DataSourceCity
      TabOrder = 2
    end
    object DBLabeledEditMiddleName: TDBLabeledEdit
      Left = 81
      Top = 11
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      TabOrder = 3
      EditLabel.Width = 51
      EditLabel.Height = 23
      EditLabel.Caption = #1060#1072#1084#1080#1083#1080#1103
      LabelPosition = lpLeft
      LabelSpacing = 10
    end
    object DBLabeledEditFirstName: TDBLabeledEdit
      Left = 81
      Top = 46
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      TabOrder = 4
      EditLabel.Width = 24
      EditLabel.Height = 23
      EditLabel.Caption = #1048#1084#1103
      LabelPosition = lpLeft
      LabelSpacing = 10
    end
    object DBLabeledEditLastName: TDBLabeledEdit
      Left = 81
      Top = 81
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      TabOrder = 5
      EditLabel.Width = 51
      EditLabel.Height = 23
      EditLabel.Caption = #1054#1090#1095#1077#1089#1090#1074#1086
      LabelPosition = lpLeft
      LabelSpacing = 10
    end
    object DBLabeledEditContact: TDBLabeledEdit
      Left = 81
      Top = 116
      Width = 223
      Height = 23
      Align = alTop
      DataSource = DataModule1.DataSourceEmployee
      TabOrder = 6
      EditLabel.Width = 57
      EditLabel.Height = 23
      EditLabel.Caption = #1058#1043' '#1082#1086#1085#1090#1072#1082#1090
      LabelPosition = lpLeft
      LabelSpacing = 10
    end
    object ListBoxSections: TListBox
      Left = 81
      Top = 256
      Width = 223
      Height = 133
      Align = alTop
      ItemHeight = 15
      TabOrder = 7
    end
  end
  object PanelConrol: TPanel
    Left = 0
    Top = 395
    Width = 848
    Height = 41
    Align = alBottom
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 10
    Padding.Bottom = 5
    TabOrder = 1
    object Bevel10: TBevel
      Left = 704
      Top = 6
      Width = 10
      Height = 29
      Align = alRight
      Shape = bsLeftLine
    end
    object Bevel11: TBevel
      Left = 697
      Top = 6
      Width = 7
      Height = 29
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 694
    end
    object LabelMsg: TLabel
      Left = 6
      Top = 6
      Width = 554
      Height = 29
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      Layout = tlCenter
    end
    object BitBtnSave: TBitBtn
      Left = 574
      Top = 6
      Width = 123
      Height = 29
      Align = alRight
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 0
      OnClick = BitBtnSaveClick
    end
    object ButtonCancel: TButton
      Left = 714
      Top = 6
      Width = 123
      Height = 29
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
    end
  end
  object PanelAddSections: TPanel
    Left = 320
    Top = 0
    Width = 528
    Height = 395
    Align = alRight
    TabOrder = 2
    object Bevel16: TBevel
      Left = 1
      Top = 191
      Width = 526
      Height = 12
      Align = alTop
      Shape = bsSpacer
      ExplicitTop = 197
    end
    object GroupBoxSectionName: TGroupBox
      Left = 1
      Top = 1
      Width = 526
      Height = 190
      Align = alTop
      Caption = #1056#1072#1079#1076#1077#1083#1099
      TabOrder = 0
      object PanelSectionNameBtns: TPanel
        Left = 241
        Top = 17
        Width = 38
        Height = 171
        Align = alLeft
        BevelOuter = bvNone
        Color = 6445643
        Padding.Left = 5
        Padding.Top = 15
        Padding.Right = 5
        ParentBackground = False
        TabOrder = 0
        StyleName = 'Windows'
        object SpeedButtonSectionNameInc: TSpeedButton
          Left = 5
          Top = 15
          Width = 28
          Height = 22
          Align = alTop
          Caption = '>'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSectionNameIncClick
          ExplicitLeft = 16
          ExplicitTop = 48
          ExplicitWidth = 23
        end
        object SpeedButtonSectionNameIncAll: TSpeedButton
          Left = 5
          Top = 48
          Width = 28
          Height = 22
          Align = alTop
          Caption = '>>'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSectionNameIncAllClick
          ExplicitLeft = 6
          ExplicitTop = 41
          ExplicitWidth = 56
        end
        object Bevel6: TBevel
          Left = 5
          Top = 37
          Width = 28
          Height = 11
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 47
          ExplicitWidth = 48
        end
        object Bevel8: TBevel
          Left = 5
          Top = 70
          Width = 28
          Height = 11
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = 6
          ExplicitTop = 87
          ExplicitWidth = 48
        end
        object SpeedButtonSectionNameEx: TSpeedButton
          Left = 5
          Top = 81
          Width = 28
          Height = 22
          Align = alTop
          Caption = '<'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSectionNameExClick
          ExplicitLeft = 6
          ExplicitTop = 104
          ExplicitWidth = 48
        end
        object Bevel9: TBevel
          Left = 5
          Top = 103
          Width = 28
          Height = 11
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = 6
          ExplicitTop = 115
          ExplicitWidth = 48
        end
        object SpeedButtonSectionNameExAll: TSpeedButton
          Left = 5
          Top = 114
          Width = 28
          Height = 22
          Align = alTop
          Caption = '<<'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSectionNameExAllClick
          ExplicitLeft = 6
          ExplicitTop = 126
          ExplicitWidth = 48
        end
      end
      object GroupBoxSectionNameSrc: TGroupBox
        Left = 2
        Top = 17
        Width = 239
        Height = 171
        Align = alLeft
        Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1088#1072#1079#1076#1077#1083#1099
        TabOrder = 1
        object ListBoxSectionNameSrc: TListBox
          Left = 2
          Top = 17
          Width = 235
          Height = 152
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
          OnDblClick = ListBoxSectionNameSrcDblClick
        end
      end
      object GroupBoxSectionNameDest: TGroupBox
        Left = 279
        Top = 17
        Width = 245
        Height = 171
        Align = alClient
        Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1088#1072#1079#1076#1077#1083#1099
        TabOrder = 2
        object ListBoxSectionNameDest: TListBox
          Left = 2
          Top = 17
          Width = 241
          Height = 152
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
          OnClick = ListBoxSectionNameDestClick
          OnDblClick = ListBoxSectionNameDestDblClick
        end
      end
    end
    object GroupBoxSubSection: TGroupBox
      Left = 1
      Top = 203
      Width = 526
      Height = 191
      Align = alClient
      Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1099
      TabOrder = 1
      object PanelSubSectionBtns: TPanel
        Left = 241
        Top = 17
        Width = 38
        Height = 172
        Align = alLeft
        BevelOuter = bvNone
        Color = 6445899
        Padding.Left = 5
        Padding.Top = 15
        Padding.Right = 5
        ParentBackground = False
        TabOrder = 0
        StyleName = 'Windows'
        object SpeedButtonSubSectionInc: TSpeedButton
          Left = 5
          Top = 15
          Width = 28
          Height = 22
          Align = alTop
          Caption = '>'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSubSectionIncClick
          ExplicitLeft = 16
          ExplicitTop = 48
          ExplicitWidth = 23
        end
        object SpeedButtonSubSectionIncAll: TSpeedButton
          Left = 5
          Top = 48
          Width = 28
          Height = 22
          Align = alTop
          Caption = '>>'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSubSectionIncAllClick
          ExplicitLeft = 6
          ExplicitTop = 41
          ExplicitWidth = 56
        end
        object Bevel12: TBevel
          Left = 5
          Top = 37
          Width = 28
          Height = 11
          Align = alTop
          Shape = bsSpacer
          ExplicitTop = 47
          ExplicitWidth = 48
        end
        object Bevel13: TBevel
          Left = 5
          Top = 70
          Width = 28
          Height = 11
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = 6
          ExplicitTop = 87
          ExplicitWidth = 48
        end
        object SpeedButtonSubSectionEx: TSpeedButton
          Left = 5
          Top = 81
          Width = 28
          Height = 22
          Align = alTop
          Caption = '<'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSubSectionExClick
          ExplicitLeft = 6
          ExplicitTop = 104
          ExplicitWidth = 48
        end
        object Bevel14: TBevel
          Left = 5
          Top = 103
          Width = 28
          Height = 11
          Align = alTop
          Shape = bsSpacer
          ExplicitLeft = 6
          ExplicitTop = 115
          ExplicitWidth = 48
        end
        object SpeedButtonSubSectionExAll: TSpeedButton
          Left = 5
          Top = 114
          Width = 28
          Height = 22
          Align = alTop
          Caption = '<<'
          StyleName = 'Windows10 SlateGray'
          OnClick = SpeedButtonSubSectionExAllClick
          ExplicitLeft = 6
          ExplicitTop = 126
          ExplicitWidth = 48
        end
      end
      object GroupBoxSubSectionSrc: TGroupBox
        Left = 2
        Top = 17
        Width = 239
        Height = 172
        Align = alLeft
        Caption = #1044#1086#1089#1090#1091#1087#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1099
        TabOrder = 1
        object ListBoxSubSectionSrc: TListBox
          Left = 2
          Top = 17
          Width = 235
          Height = 153
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
        end
      end
      object GroupBoxSubSectionDest: TGroupBox
        Left = 279
        Top = 17
        Width = 245
        Height = 172
        Align = alClient
        Caption = #1042#1099#1073#1088#1072#1085#1085#1099#1077' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1099
        TabOrder = 2
        object ListBoxSubSectionDest: TListBox
          Left = 2
          Top = 17
          Width = 241
          Height = 153
          Align = alClient
          ItemHeight = 15
          TabOrder = 0
        end
      end
    end
  end
  object ImageList1: TImageList
    Left = 776
    Top = 48
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C6FF59461DFF59461DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C6FF59461DFF59461DFF604A1FF00000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C6FF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C6FF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C6FF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FFE6E1C6FF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFEFF0
      E7FFEFF0E7FFEFF0E7FFEFF0E7FFEFF0E7FFE6E1C5FFE6E1C5FFE6E1C5FFE6E1
      C5FF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FF765C
      26FFCEC9B3FFCEC9B3FFCEC9B3FFCEC9B3FFDED9BFFFDED9BFFFDED9BFFF5946
      1DFF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FF765C
      26FF765C26FF765C26FF765C26FF765C26FF59461DFF59461DFF59461DFF5946
      1DFF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FF765C
      26FF765C26FF765C26FF765C26FF765C26FF59461DFF59461DFF59461DFF5946
      1DFF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFC4B9
      8DFFC4B98DFFC4B98DFFC4B98DFFC4B98DFF978C67FF978C67FF978C67FF5946
      1DFF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFC4B9
      8DFFC4B98DFFC4B98DFFC4B98DFFC4B98DFF978C67FF978C67FF978C67FF9B90
      6AFF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFC4B9
      8DFFC4B98DFFC4B98DFFC4B98DFFC4B98DFF978C67FF65542CFF978C67FF9B90
      6AFF59461DFF59461DFF59461DFF59461DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFC4B9
      8DFFC4B98DFFC4B98DFFC4B98DFFC4B98DFF978C67FF65542CFF978C67FF9B90
      6AFF59461DFF59461DFF59461DFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFC4B9
      8DFFC4B98DFFC4B98DFFC4B98DFFC4B98DFF978C67FF978C67FF978C67FF9B90
      6AFF59461DFF59461DFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000765C26FF765C26FF765C26FFC4B9
      8DFFC4B98DFFC4B98DFFC4B98DFFC4B98DFF978C67FF978C67FF978C67FF9B90
      6AFF59461DFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000001000000000000
      0003000000000000000700000000000000000000000000000000000000000000
      000000000000}
  end
  object TimerMsg: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerMsgTimer
    Left = 776
    Top = 120
  end
end
