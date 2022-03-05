object DMStyles: TDMStyles
  OldCreateOrder = False
  Height = 312
  Width = 532
  object dxLayoutLookAndFeels: TdxLayoutLookAndFeelList
    Left = 64
    Top = 72
    object lcMainStyle: TdxLayoutCxLookAndFeel
      GroupOptions.CaptionOptions.TextColor = clBlue
      Offsets.ItemOffset = 3
      Offsets.RootItemsAreaOffsetHorz = 3
      Offsets.RootItemsAreaOffsetVert = 3
      Offsets.TabSheetContentOffsetHorz = -3
      Offsets.TabSheetContentOffsetVert = -3
      LookAndFeel.NativeStyle = True
      PixelsPerInch = 96
    end
  end
  object LookAndFeelController: TcxLookAndFeelController
    Kind = lfFlat
    Left = 64
    Top = 16
  end
end
