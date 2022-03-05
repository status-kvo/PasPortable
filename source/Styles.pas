unit Styles;

interface

uses
  System.SysUtils,
  System.Classes,
  cxLookAndFeels,
  cxClasses,
  dxLayoutLookAndFeels;

type
  TDMStyles = class(TDataModule)
    dxLayoutLookAndFeels: TdxLayoutLookAndFeelList;
    lcMainStyle: TdxLayoutCxLookAndFeel;
    LookAndFeelController: TcxLookAndFeelController;
  end;

var
  DMStyles: TDMStyles;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

end.
