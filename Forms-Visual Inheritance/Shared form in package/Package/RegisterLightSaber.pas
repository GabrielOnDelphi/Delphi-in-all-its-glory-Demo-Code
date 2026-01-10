unit RegisterLightSaber;

interface

uses
  DesignIntf, DesignEditors;  // For IDE integration

procedure Register;

implementation

uses
  ParentForm;  // Your unit with TLightForm

procedure Register;
begin
  RegisterCustomModule(TfrmParentPkg, TCustomModule);
end;

end.
