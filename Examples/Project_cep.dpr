program Project_cep;

uses
  Vcl.Forms,
  FRM_CEP in 'FRM_CEP.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
