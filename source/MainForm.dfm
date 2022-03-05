object FormMain: TFormMain
  Left = 0
  Top = 0
  Caption = 'PasPortable'
  ClientHeight = 563
  ClientWidth = 1062
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GeneralLayoutControl: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 1062
    Height = 526
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = DMStyles.lcMainStyle
    object VFSIsReadOnly: TcxDBCheckBox
      Left = 16
      Top = 47
      Caption = #1054#1090#1082#1088#1099#1074#1072#1090#1100' '#1074' '#1088#1077#1078#1080#1084#1077' "'#1058#1086#1083#1100#1082#1086' '#1095#1090#1077#1085#1080#1077'"'
      DataBinding.DataField = 'IsReadOnly'
      DataBinding.DataSource = SettingsDataSource
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 1
    end
    object VFSPath: TcxDBButtonEdit
      Left = 159
      Top = 22
      DataBinding.DataField = 'Path'
      DataBinding.DataSource = SettingsDataSource
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Style.HotTrack = False
      Style.TransparentBorder = False
      TabOrder = 0
      Width = 887
    end
    object Studio: TcxGrid
      Left = 16
      Top = 98
      Width = 1030
      Height = 252
      TabOrder = 2
      object StudioTableView: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        ScrollbarAnnotations.CustomAnnotations = <>
        DataController.DataSource = StudioDataSource
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.MultiSelect = True
        OptionsView.CellAutoHeight = True
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        OptionsView.Indicator = True
        object StudioTableViewName: TcxGridDBColumn
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1088#1077#1076#1099' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1080
          DataBinding.FieldName = 'Name'
          HeaderAlignmentHorz = taCenter
          Width = 349
        end
      end
      object StudioLevel: TcxGridLevel
        GridView = StudioTableView
      end
    end
    object StudioPackage: TcxDBTreeList
      Left = 16
      Top = 360
      Width = 1030
      Height = 150
      Bands = <
        item
        end>
      DataController.DataSource = PackagesDataSource
      DataController.ParentField = 'ParentId'
      DataController.KeyField = 'Id'
      Navigator.Buttons.CustomButtons = <>
      OptionsData.Editing = False
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsView.CellAutoHeight = True
      OptionsView.ColumnAutoWidth = True
      OptionsView.PaintStyle = tlpsCategorized
      RootValue = -1
      ScrollbarAnnotations.CustomAnnotations = <>
      TabOrder = 3
      object StudioPackageDirectory: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.Text = #1055#1091#1090#1100
        DataBinding.FieldName = 'Directory'
        Width = 312
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object StudioPackageName: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.Text = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1072#1082#1077#1090#1072
        DataBinding.FieldName = 'Name'
        Width = 298
        Position.ColIndex = 1
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object StudioPackagePath: TcxDBTreeListColumn
        Caption.AlignHorz = taCenter
        Caption.Text = #1054#1090#1085#1086#1089#1080#1090#1077#1083#1100#1085#1099#1081' '#1087#1091#1090#1100
        DataBinding.FieldName = 'Path'
        Width = 384
        Position.ColIndex = 2
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object StudioPackageId: TcxDBTreeListColumn
        DataBinding.FieldName = 'Id'
        Position.ColIndex = 3
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object StudioPackageParentId: TcxDBTreeListColumn
        DataBinding.FieldName = 'ParentId'
        Position.ColIndex = 4
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
      object StudioPackageStudioId: TcxDBTreeListColumn
        DataBinding.FieldName = 'StudioId'
        Position.ColIndex = 5
        Position.RowIndex = 0
        Position.BandIndex = 0
        Summary.FooterSummaryItems = <>
        Summary.GroupFooterSummaryItems = <>
      end
    end
    object GeneralLayoutControlGroup_Root: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avParentManaged
      Hidden = True
      ItemIndex = 1
      ShowBorder = False
      Index = -1
    end
    object SettingsLayoutGroup: TdxLayoutGroup
      Parent = GeneralLayoutControlGroup_Root
      CaptionOptions.Text = #1054#1073#1097#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
      ItemIndex = 1
      Index = 0
    end
    object IsReadOnlyLayoutItem: TdxLayoutItem
      Parent = SettingsLayoutGroup
      CaptionOptions.Visible = False
      Control = VFSIsReadOnly
      ControlOptions.OriginalHeight = 17
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 1
    end
    object PathLayoutItem: TdxLayoutItem
      Parent = SettingsLayoutGroup
      CaptionOptions.Text = #1055#1091#1090#1100' '#1082' '#1074#1080#1088#1090#1091#1072#1083#1100#1085#1099#1084' '#1076#1080#1089#1082#1072
      Control = VFSPath
      ControlOptions.OriginalHeight = 21
      ControlOptions.OriginalWidth = 121
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object StudioLayoutGroup: TdxLayoutGroup
      Parent = GeneralLayoutControlGroup_Root
      AlignVert = avClient
      CaptionOptions.Text = #1057#1088#1077#1076#1072' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1080
      ItemIndex = 2
      Index = 1
    end
    object StudioLayoutItem: TdxLayoutItem
      Parent = StudioLayoutGroup
      AlignVert = avClient
      CaptionOptions.Visible = False
      Control = Studio
      ControlOptions.OriginalHeight = 200
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object dxLayoutSplitterItem1: TdxLayoutSplitterItem
      Parent = StudioLayoutGroup
      SizeOptions.AssignedValues = [sovSizableHorz, sovSizableVert]
      SizeOptions.SizableHorz = False
      SizeOptions.SizableVert = False
      CaptionOptions.Text = 'Splitter'
      Index = 1
    end
    object dxLayoutItem1: TdxLayoutItem
      Parent = StudioLayoutGroup
      CaptionOptions.Visible = False
      Control = StudioPackage
      ControlOptions.OriginalHeight = 150
      ControlOptions.OriginalWidth = 250
      ControlOptions.ShowBorder = False
      Index = 2
    end
  end
  object ButtonsLayoutControl: TdxLayoutControl
    Left = 0
    Top = 526
    Width = 1062
    Height = 37
    Align = alBottom
    BevelKind = bkFlat
    TabOrder = 1
    AutoSize = True
    LayoutLookAndFeel = DMStyles.lcMainStyle
    OptionsItem.SizableHorz = True
    OptionsItem.SizableVert = True
    object StartButton: TButton
      Left = 4
      Top = 4
      Width = 75
      Height = 25
      Caption = #1047#1072#1087#1091#1089#1082
      TabOrder = 0
    end
    object ExitButton: TButton
      Left = 979
      Top = 4
      Width = 75
      Height = 25
      Caption = #1042#1099#1093#1086#1076
      ModalResult = 8
      TabOrder = 1
    end
    object ButtonsLayoutGroup: TdxLayoutGroup
      AlignHorz = ahParentManaged
      AlignVert = avTop
      Hidden = True
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = -1
    end
    object StartLayoutItem: TdxLayoutItem
      Parent = ButtonsLayoutGroup
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = StartButton
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object ExitLayoutItem2: TdxLayoutItem
      Parent = ButtonsLayoutGroup
      AlignHorz = ahRight
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = ExitButton
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
  object StudioTable: TFDMemTable
    AfterScroll = StudioTableAfterScroll
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 96
    object StudioTableId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
      MaxValue = 2000000
    end
    object StudioTableName: TStringField
      FieldName = 'Name'
      Size = 128
    end
    object StudioTablePath: TStringField
      FieldName = 'Path'
      Size = 2048
    end
  end
  object SettingsTable: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 280
    Top = 96
    object SettingsTablePath: TStringField
      FieldName = 'Path'
      Size = 2048
    end
    object SettingsTableIsReadOnly: TBooleanField
      FieldName = 'IsReadOnly'
    end
  end
  object SettingsDataSource: TDataSource
    DataSet = SettingsTable
    Left = 280
    Top = 144
  end
  object StudioDataSource: TDataSource
    DataSet = StudioTable
    Left = 160
    Top = 144
  end
  object PackagesTable: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    IndexFieldNames = 'StudioId;Id'
    MasterSource = StudioDataSource
    MasterFields = 'Id'
    DetailFields = 'StudioId'
    FetchOptions.AssignedValues = [evMode, evDetailOptimize]
    FetchOptions.Mode = fmAll
    FetchOptions.DetailOptimize = False
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvLockMode, uvFetchGeneratorsPoint, uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.LockMode = lmOptimistic
    UpdateOptions.FetchGeneratorsPoint = gpImmediate
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    UpdateOptions.KeyFields = 'Id'
    StoreDefs = True
    Left = 392
    Top = 96
    object PackagesTableId: TAutoIncField
      AutoGenerateValue = arAutoInc
      FieldName = 'Id'
    end
    object PackagesTableParentId: TIntegerField
      FieldName = 'ParentId'
    end
    object PackagesTableStudioId: TIntegerField
      FieldName = 'StudioId'
    end
    object PackagesTableDirectory: TStringField
      FieldName = 'Directory'
      Size = 2048
    end
    object PackagesTableName: TStringField
      FieldName = 'Name'
      Size = 256
    end
    object PackagesTableIsFind: TBooleanField
      FieldName = 'IsFind'
    end
    object PackagesTablePath: TStringField
      FieldName = 'Path'
      Size = 2048
    end
  end
  object PackagesDataSource: TDataSource
    DataSet = PackagesTable
    Left = 392
    Top = 144
  end
end
