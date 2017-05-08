; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "Service"
#define MyAppVersion "1.0.0.186"
#define MyAppPublisher "WCompany"
#define MyAppExeName "service.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E65CE08F-228D-43E5-AC1D-93D204C45257}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={pf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
DefaultGroupName=My Program
UninstallDisplayIcon={app}\Service.exe
ArchitecturesInstallIn64BitMode=x64


[Languages]
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]        
Source: "C:\W\Servis\Temp\Service32.exe"; DestDir: "{app}"; DestName: "Service.exe"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib32\libeay32.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib32\libiconv-2.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib32\libintl-8.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib32\libpq.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib32\ssleay32.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: not Is64BitInstallMode
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "C:\W\Servis\Temp\Service64.exe"; DestDir: "{app}"; DestName: "Service.exe"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib64\libeay32.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib64\libiconv-2.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib64\libintl-8.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib64\libpq.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode
Source: "C:\W\Servis\UTILS\lib64\ssleay32.dll"; DestDir: "{app}"; Flags: ignoreversion; Check: Is64BitInstallMode


[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent
