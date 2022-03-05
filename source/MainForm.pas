unit MainForm;

interface

uses
  Winapi.Windows,
  Winapi.Messages,

  System.Types,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.IOUtils,
  System.Generics.Collections,

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  Styles,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxLayoutControlAdapters,
  Vcl.StdCtrls,
  dxLayoutContainer,
  cxClasses,
  dxLayoutControl,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  dxLayoutcxEditAdapters,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMaskEdit,
  cxButtonEdit,
  cxDBEdit,
  cxCheckBox,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  dxDateRanges,
  dxScrollbarAnnotations,
  cxDBData,
  cxGridLevel,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  cxTL,
  cxTLdxBarBuiltInMenu,
  cxInplaceContainer,
  cxTLData,
  cxDBTL;

type
  TFormMain = class(TForm)
    GeneralLayoutControlGroup_Root: TdxLayoutGroup;
    GeneralLayoutControl: TdxLayoutControl;
    ButtonsLayoutControl: TdxLayoutControl;
    ButtonsLayoutGroup: TdxLayoutGroup;
    StartLayoutItem: TdxLayoutItem;
    ExitLayoutItem2: TdxLayoutItem;
    StartButton: TButton;
    ExitButton: TButton;
    StudioTable: TFDMemTable;
    SettingsTable: TFDMemTable;
    SettingsLayoutGroup: TdxLayoutGroup;
    VFSIsReadOnly: TcxDBCheckBox;
    IsReadOnlyLayoutItem: TdxLayoutItem;
    VFSPath: TcxDBButtonEdit;
    PathLayoutItem: TdxLayoutItem;
    StudioLayoutGroup: TdxLayoutGroup;
    StudioTableView: TcxGridDBTableView;
    StudioLevel: TcxGridLevel;
    Studio: TcxGrid;
    StudioLayoutItem: TdxLayoutItem;
    SettingsDataSource: TDataSource;
    StudioDataSource: TDataSource;
    SettingsTablePath: TStringField;
    SettingsTableIsReadOnly: TBooleanField;
    StudioTableName: TStringField;
    StudioTablePath: TStringField;
    StudioTableViewName: TcxGridDBColumn;
    StudioTableId: TAutoIncField;
    PackagesTable: TFDMemTable;
    PackagesDataSource: TDataSource;
    dxLayoutSplitterItem1: TdxLayoutSplitterItem;
    StudioPackage: TcxDBTreeList;
    dxLayoutItem1: TdxLayoutItem;
    PackagesTableId: TAutoIncField;
    PackagesTableParentId: TIntegerField;
    PackagesTableDirectory: TStringField;
    PackagesTableName: TStringField;
    PackagesTableIsFind: TBooleanField;
    StudioPackageDirectory: TcxDBTreeListColumn;
    StudioPackageName: TcxDBTreeListColumn;
    PackagesTablePath: TStringField;
    StudioPackagePath: TcxDBTreeListColumn;
    PackagesTableStudioId: TIntegerField;
    StudioPackageId: TcxDBTreeListColumn;
    StudioPackageParentId: TcxDBTreeListColumn;
    StudioPackageStudioId: TcxDBTreeListColumn;
    procedure FormCreate(Sender: TObject);
    procedure StudioTableAfterScroll(DataSet: TDataSet);
  private
    FPackageIndex: NativeInt;
    procedure StudioGet(const aPath: string);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

resourcestring
  rsErrorBuildFormat = 'Ошибка выполнения или компиляции: '#13#10'%s';

function GetDosOutput(const ACommandLine: string; var AResultCode: Cardinal): string;
var
  StdOutPipeRead : THandle;
  StdOutPipeWrite: THandle;
  StdInPipeRead  : THandle;
  StdInPipeWrite : THandle;
  SA             : TSecurityAttributes;
  SI             : TStartupInfo;
  PI             : TProcessInformation;
  WasOK          : Boolean;
  BytesRead      : Cardinal;
  Line           : string;
  Buffer         : array [0 .. 255] of AnsiChar;
begin
  // Application.ProcessMessages;
  with SA do
  begin
    nLength := SizeOf(SA);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  // создаём пайп для перенаправления стандартного вывода
  CreatePipe(StdOutPipeRead, // дескриптор чтения
    StdOutPipeWrite,         // дескриптор записи
    @SA,                     // аттрибуты безопасности
    0                        // количество байт принятых для пайпа - 0 по умолчанию
    );
  // создаём пайп для перенаправления стандартного ввода
  CreatePipe(StdInPipeRead, // дескриптор чтения
    StdInPipeWrite,         // дескриптор записи
    @SA,                    // аттрибуты безопасности
    0                       // количество байт принятых для пайпа - 0 по умолчанию
    );

  try
    // Создаём дочерний процесс, используя StdOutPipeWrite в качестве стандартного вывода,
    // а так же проверяем, чтобы он не показывался на экране.
    with SI do
    begin
      FillChar(SI, SizeOf(SI), 0);
      cb := SizeOf(SI);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_HIDE or SW_SHOWMINNOACTIVE;
      hStdInput := StdInPipeRead; // GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := StdOutPipeWrite;
      hStdError := StdOutPipeWrite;
    end;

    // Запускаем компилятор из командной строки
    // WorkDir := ExtractFilePath(CommandLine);
    WasOK := CreateProcess(nil, PChar(ACommandLine), nil, nil, True, 0, nil, nil, SI, PI);

    // если процесс может быть создан, то дескриптор, это его вывод
    CloseHandle(StdOutPipeWrite);
    if not WasOK then
      raise Exception.Create(format(rsErrorBuildFormat, [ACommandLine]))
    else
      try
        // получаем весь вывод до тех пор, пока DOS-приложение не будет завершено
        Line := '';
        repeat
          // читаем блок символов (могут содержать возвраты каретки и переводы строки)
          WasOK := ReadFile(StdOutPipeRead, Buffer, 255, BytesRead, nil);
          // есть ли что-нибудь ещё для чтения?
          if BytesRead > 0 then
          begin
            // завершаем буфер PChar-ом
            Buffer[BytesRead] := #0;
            // добавляем буфер в общий вывод
            Line := Line + string(AnsiString(Buffer));
          end;
          // Application.ProcessMessages;
        until not WasOK or (BytesRead = 0);
        // ждём, пока завершится консольное приложение
        WaitForSingleObject(PI.hProcess, INFINITE);
        AResultCode := 0;
        GetExitCodeProcess(PI.hProcess, AResultCode);
      finally
        // Закрываем все оставшиеся дескрипторы
        CloseHandle(PI.hThread);
        CloseHandle(PI.hProcess);
      end;
  finally
    Result := Line;
    CloseHandle(StdOutPipeRead);
    CloseHandle(StdInPipeRead);
    CloseHandle(StdInPipeWrite);
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  SettingsTable.Close;
  SettingsTable.Open;
{$IFDEF DEBUG}
  SettingsTable.Append;
  try
    SettingsTablePath.AsString := 'Z:\__data\virtuals\pascal';
    SettingsTableIsReadOnly.AsBoolean := False;
    SettingsTable.Post;
  except
    SettingsTable.Cancel;
  end;
{$ENDIF DEBUG}
  StudioTable.Close;
  StudioTable.Open;
  if SettingsTable.RecordCount > 0 then
    StudioGet(SettingsTablePath.AsString);
end;

procedure TFormMain.StudioGet(const aPath: string);
var
  Packages: TDictionary<string, Integer>;

  procedure Add(var aParentIndex: Integer; const aPackageName, aPackagePath, aDirectory, aDirectoryFull: string; aPackageIsFind: Boolean);
  begin
    PackagesTable.Append;
    try
      PackagesTableStudioId.AsInteger := StudioTableId.AsInteger;
      PackagesTableName.AsString := aPackageName;
      PackagesTablePath.AsString := aPackagePath;
      PackagesTableDirectory.AsString := aDirectory;
      PackagesTableIsFind.AsBoolean := aPackageIsFind;
      PackagesTableParentId.AsInteger := aParentIndex;
      PackagesTableId.AsInteger := FPackageIndex;
      PackagesTable.Post;
      aParentIndex := FPackageIndex;
      Packages.AddOrSetValue(aDirectoryFull, aParentIndex);
      Inc(FPackageIndex);
    except
      PackagesTable.Cancel;
    end;
  end;

  procedure PackagesGet(aParams: TStrings);
  begin
    for var index := 1 to Pred(aParams.Count) do
    begin
      var
      PackageName := aParams.Names[index];
      var
      PackageParam := PackageName.Split([',']);
      var
      PackagePath := aParams.ValueFromIndex[index];
      var
      PackagePathUni := PackagePath.ToLower;
      var
      PackagePathDirectory := PackagePathUni.Split([PathDelim]);
      var
      PackageIsFind := False;
      var
      ItemIndex := -1;
      var
      ParentIndex := -1;
      var
      DirectoryFull := '';

      if Length(PackageParam) > 0 then
        PackageIsFind := (Length(TDirectory.GetFiles(aPath, PackageParam[0] + '.vhd', TSearchOption.soAllDirectories)) > 0);

      for var IndexDirectory := low(PackagePathDirectory) to high(PackagePathDirectory) do
      begin
        var
        Directory := PackagePathDirectory[IndexDirectory];
        if DirectoryFull = '' then
          DirectoryFull := Directory
        else
          DirectoryFull := IncludeTrailingPathDelimiter(DirectoryFull) + Directory;

        if Packages.TryGetValue(DirectoryFull, ItemIndex) then
          ParentIndex := ItemIndex
        else
          if IndexDirectory <> high(PackagePathDirectory) then
            Add(ParentIndex, '', PackagePath, Directory, DirectoryFull, True)
          else
            Add(ParentIndex, PackageName, PackagePath, Directory, DirectoryFull, PackageIsFind)
      end;
    end;
  end;

  procedure BuildsGet;
  begin
    var
    Builds := TDirectory.GetFiles(aPath, '*.build', TSearchOption.soAllDirectories);
    if Length(Builds) > 0 then
    begin
      Packages := TDictionary<string, Integer>.Create;
      try
        var
        BuildParams := TStringList.Create;
        try
          for var Build in Builds do
          begin
            Packages.Clear;
            BuildParams.LoadFromFile(Build);
            if BuildParams.Count > 1 then
            begin
              StudioTable.Append;
              try
                StudioTableName.AsString := BuildParams.ValueFromIndex[0];
                StudioTablePath.AsString := Build;
                StudioTable.Post;

                PackagesGet(BuildParams);
              except
                StudioTable.Cancel;
              end;
            end;
          end;
        finally
          BuildParams.Destroy
        end
      finally
        Packages.Clear
      end;
    end
  end;

begin
  StudioTable.DisableControls;
  try
    StudioTable.Close;
    StudioTable.Open;

    PackagesTable.DisableControls;
    try
      PackagesTable.Close;
      PackagesTable.Open;
      BuildsGet;
    finally
      PackagesTable.EnableControls
    end;
  finally
    StudioTable.EnableControls
  end;
end;

procedure TFormMain.StudioTableAfterScroll(DataSet: TDataSet);
begin
  if StudioTable.RecordCount  > 0 then
  begin
    PackagesTable.DisableControls;
    try
      PackagesTable.Filtered := False;
      PackagesTable.Filter := 'StudioId = ' + StudioTableId.AsString;
      PackagesTable.Filtered := True;
    finally
      PackagesTable.EnableControls
    end;
    StudioPackage.FullExpand
  end
end;

end.
