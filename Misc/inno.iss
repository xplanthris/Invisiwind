; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Invisiwind"
#define MyAppVersion "1.1.4"
#define MyAppPublisher "Radiantly"
#define MyAppURL "https://github.com/radiantly/Invisiwind"

[Code]
function MyAppExeName(Param: String): String;
begin
  if IsWin64 then 
    Result := 'Invisiwind.exe'
  else 
    Result := 'Invisiwind_32bit.exe';
end;

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{32D1543D-4B92-4705-85F0-15EC0AD3AC42}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
OutputBaseFilename=InvisiwindInstaller
Compression=lzma
SolidCompression=yes
WizardStyle=modern
; Custom install options
ArchitecturesInstallIn64BitMode=x64
SetupIconFile=invicon.ico

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "..\Build\bin\Release\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Build\bin\Release\*.dll"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{autoprograms}\{#MyAppName}"; Filename: "{app}\{code:MyAppExeName}"
Name: "{autodesktop}\{#MyAppName}"; Filename: "{app}\{code:MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{code:MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent