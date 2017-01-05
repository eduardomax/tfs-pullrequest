#define MyAppName "Codereview"
#define MyAppVersion "1.2"
#define MyAppPublisher "Yuri Claure"
#define MyAppExeName "Codereview Installer"
#define MyDefaultDirName "{pf}\Codereview"

[Files]
Source: ..\dist\cr\*; DestDir: {app}; Flags: overwritereadonly recursesubdirs createallsubdirs

[Setup]
AppId={{444B4311-848B-4EA8-B743-51DE98FF6700}
OutputDir=..\dist
AppName={#MyAppName}
AppPublisher={#MyAppPublisher}
DefaultDirName={#MyDefaultDirName}
AppVersion={#MyAppVersion}
OutputBaseFilename={#MyAppExeName}

[Registry]
Root: HKCU; Subkey: "Environment"; \
    ValueType: expandsz; ValueName: PATH; ValueData: "{olddata};{#MyDefaultDirName}"; \
    Check: NeedsAddPath   
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; \
    ValueType: expandsz; ValueName: Path; ValueData: "{olddata};{#MyDefaultDirName}"; \
    Check: NeedsAddPath

[Code]

function NeedsAddPath(): boolean;
var
  OrigPath: string;
begin
  if not RegQueryStringValue(HKEY_LOCAL_MACHINE,'SYSTEM\CurrentControlSet\Control\Session Manager\Environment', 'Path', OrigPath)
  then begin
    Result := True;
    exit;
  end;
  // look for the path with leading and trailing semicolon
  // Pos() returns 0 if not found
  Result := Pos(';' + UpperCase(ExpandConstant('{#MyDefaultDirName}')) + ';', ';' + UpperCase(OrigPath) + ';') = 0;
end;
