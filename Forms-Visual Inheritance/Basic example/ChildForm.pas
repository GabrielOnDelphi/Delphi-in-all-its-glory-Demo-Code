unit ChildForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ParentForm, Vcl.StdCtrls;

type
  TfrmChild = class(TfrmParent)
    Button2: TButton;
  private
  public
  end;

var
  frmChild: TfrmChild;

implementation

{$R *.dfm}

end.
