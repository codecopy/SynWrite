unit unProcHelp;

interface

function FHelpLangSuffix: string;
function FHelpFilename: string;
var SynDirForHelpFiles: string;

type
  TSynHelpId = (
    helpDonate,
    helpRegex,
    helpCarets,
    helpDateFmt,
    helpACP,
    helpSmartTabbing,
    helpAutoClose,
    helpAutoCase,
    helpExtTools,
    helpFindDlg,
    helpCmdListDlg,
    helpEmmet,
    helpProjOpts,
    helpLoremIpsum,
    helpKeys
  );
const
  cSynHelpId: array[TSynHelpId] of string = (
    'Donate.html',
    'RegEx.html',
    'MultiCarets.html',
    'MiscDateFormat.html',
    'HelperACP.html',
    'HelperSmartTagTabbing.html',
    'HelperAClose.html',
    'HelperACase.html',
    'ExternalTools.html',
    'DialogFind.html',
    'DialogCmdList.html',
    'HelperZenCoding.html',
    'DialogProjOpt.html',
    'DialogLorem.html',
    'Keys.html'
  );

procedure SynHelpTopic(ID: TSynHelpId; Handle: THandle);

implementation

uses
  SysUtils,
  DKLang,
  ATxFProc;

function FHelpLangSuffix: string;
begin
  //see contents of SynWrite LNG files - string "LANGID="
  case LangManager.LanguageID of
    1029: Result:= 'Cz';
    1031: Result:= 'De';
    1036: Result:= 'Fr';
	1038: Result:= 'Hu';
    1040: Result:= 'It';
    1041: Result:= 'Jp';
	1042: Result:= 'Kr';
    1049: Result:= 'Ru';
    2052: Result:= 'Chs';
	1028: Result:= 'Cht';
    3082: Result:= 'Sp';
    else Result:= 'En';
  end;
end;

function FHelpFilename: string;
var
  Suffix, HelpEn, HelpLocal: string;
begin
  Suffix:= FHelpLangSuffix;
  HelpEn:= SynDirForHelpFiles + '\SynWrite.chm';
  HelpLocal:= SynDirForHelpFiles + '\SynWrite.' + Suffix + '.chm';

  if Suffix='En' then
    Result:= HelpEn
  else
    if FileExists(HelpLocal) then
      Result:= HelpLocal
    else
      Result:= HelpEn;
end;

procedure SynHelpTopic(ID: TSynHelpId; Handle: THandle);
begin
  FExecute('hh.exe', '"' + FHelpFilename + '::/' + cSynHelpId[ID] + '"', '', Handle);
end;

end.
