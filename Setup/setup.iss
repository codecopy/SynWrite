[Setup]
AppName=SynWrite
AppVersion=6.8.1540
AppPublisher=UVViewSoft
AppPublisherURL=http://uvviewsoft.com
AppSupportURL=http://uvviewsoft.com
DefaultDirName=C:\SynWrite
DefaultGroupName=SynWrite
DisableProgramGroupPage=yes
OutputDir=D:\
OutputBaseFilename=SynWrite
SetupIconFile=setup.ico
Compression=lzma
SolidCompression=yes
AppMutex=UVViewSoft.SynWrite
PrivilegesRequired=none

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
;Name: "german"; MessagesFile: "compiler:Languages\German.isl"
;Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Files]
Source: "..\Syn.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Enc.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Lexers.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Tidy.cfg"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\HL\*"; DestDir: "{app}\HL"; Flags: ignoreversion
Source: "..\Lang\*"; DestDir: "{app}\Lang"; Flags: ignoreversion
Source: "..\Readme\*"; DestDir: "{app}\Readme"; Flags: ignoreversion

Source: "..\DLLs\*"; DestDir: "{app}\DLLs"; Flags: ignoreversion
Source: "..\Py\sw*.py"; DestDir: "{app}\Py"; Flags: ignoreversion
Source: "..\python*.zip"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\*.manifest"; DestDir: "{app}"; Flags: ignoreversion

Source: "..\Template\colors\*"; DestDir: "{app}\Template\colors"; Flags: ignoreversion
Source: "..\Template\newdoc\*"; DestDir: "{app}\Template\newdoc"; Flags: ignoreversion
Source: "..\Template\tools\*"; DestDir: "{app}\Template\tools"; Flags: ignoreversion
Source: "..\Template\clips\*"; DestDir: "{app}\Template\clips"; Flags: ignoreversion
Source: "..\Template\skins\*"; DestDir: "{app}\Template\skins"; Flags: ignoreversion
Source: "..\Template\conv\*"; DestDir: "{app}\Template\conv"; Flags: ignoreversion

Source: "..\Template\snippets\Std.C\*";      DestDir: "{app}\Template\snippets\Std.C";      Flags:
Source: "..\Template\snippets\Std.Java\*";   DestDir: "{app}\Template\snippets\Std.Java";   Flags:
Source: "..\Template\snippets\Std.Python\*"; DestDir: "{app}\Template\snippets\Std.Python"; Flags:
Source: "..\Template\snippets\Std.Php\*";    DestDir: "{app}\Template\snippets\Std.Php";    Flags:
Source: "..\Template\snippets\Std.Pascal\*"; DestDir: "{app}\Template\snippets\Std.Pascal"; Flags:
Source: "..\Template\snippets\Std.AutoIt\*"; DestDir: "{app}\Template\snippets\Std.AutoIt"; Flags:
Source: "..\Template\snippets\Std.Lua\*";    DestDir: "{app}\Template\snippets\Std.Lua";    Flags:

Source: "..\Tools\*"; DestDir: "{app}\Tools"; Flags: ignoreversion
Source: "..\Dictionaries\*"; DestDir: "{app}\Dictionaries"; Flags: ignoreversion

Source: "..\SynPlugins.sample.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: "..\Plugins\Explorer\*"; DestDir: "{app}\Plugins\Explorer"; Flags: ignoreversion
Source: "..\Plugins\SynFTP\*"; DestDir: "{app}\Plugins\SynFTP"; Flags: ignoreversion

[Icons]
Name: "{group}\SynWrite"; Filename: "{app}\Syn.exe"
Name: "{group}\SynWrite Help"; Filename: "{app}\Readme\SynWrite.chm"
Name: "{group}\{cm:UninstallProgram,SynWrite}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\SynWrite"; Filename: "{app}\Syn.exe"; Tasks: desktopicon

[Run]
Filename: "{app}\Syn.exe"; Parameters: "/reg"; Description: "Configure SynWrite file types"; Flags: nowait postinstall skipifsilent runascurrentuser
;;Filename: "{app}\Readme\History.txt"; Description: "View versions history"; Flags: nowait shellexec postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\Syn*.ini"

[Registry]
Root: HKCR; Subkey: "*\shell\SynWrite"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\SynWrite\command"; Flags: uninsdeletekey
Root: HKCR; Subkey: "*\shell\SynWrite\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Syn.exe"" ""%1"""