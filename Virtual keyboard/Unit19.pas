unit Unit19;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFormKeyb = class(TForm)
    FlowPanel: TFlowPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button0: TButton;
    CheckBox1: TCheckBox;
    procedure ClickedButton(Sender: TObject);
  private
  public
  end;

TYPE
  TCristina = class(TObject)
    Suparata: Boolean;
  end;

var
  FormKeyb: TFormKeyb;

implementation  {$R *.dfm}






procedure TFormKeyb.ClickedButton(Sender: TObject);
begin
 if Sender is TButton  // Does the click originates from a button?
 then Caption:= 'You pressed button '+ (Sender as TButton).Caption
 else
    // Bonus code
    if Sender is TCheckBox  // Does the click originates from a checkbox?
    then Caption:= 'You click the checkbox.';
end;





end.










