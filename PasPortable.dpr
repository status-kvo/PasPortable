program PasPortable;

uses
  Vcl.Forms,
  MainForm in 'source\MainForm.pas' {FormMain},
  Styles in 'source\Styles.pas' {DMStyles: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDMStyles, DMStyles);
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
