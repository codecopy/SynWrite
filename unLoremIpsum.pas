unit unLoremIpsum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntForms, TntStdCtrls,
  Spin, DKLang;

type
  TfmLoremIpsum = class(TTntForm)
    bOk: TTntButton;
    bCopy: TTntButton;
    bCan: TTntButton;
    GroupBox1: TTntGroupBox;
    cbSent: TTntRadioButton;
    cbPara: TTntRadioButton;
    edCount: TSpinEdit;
    Label1: TTntLabel;
    cbTags: TTntCheckBox;
    DKLanguageController1: TDKLanguageController;
    LabelHelp: TTntLabel;
    procedure edCountKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWordsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabelHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  unProcHelp;

{$R *.dfm}

procedure TfmLoremIpsum.edCountKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_return) then
  begin
    bOk.Click;
    Key:= 0;
    Exit
  end;
  if (Key=vk_escape) then
  begin
    bCan.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmLoremIpsum.cbWordsClick(Sender: TObject);
begin
  cbTags.Enabled:= cbPara.Checked;
end;

procedure TfmLoremIpsum.FormShow(Sender: TObject);
begin
  cbWordsClick(Self);
end;

procedure TfmLoremIpsum.LabelHelpClick(Sender: TObject);
begin
  SynHelpTopic(helpLoremIpsum, Handle);
end;

end.
