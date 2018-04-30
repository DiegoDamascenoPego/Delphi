unit FRM_CEP;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Components.Package.EditTextCep.uEditCep;

type
  TForm9 = class(TForm)
    EditCep: TEditCep;
    ImageList1: TImageList;
    edtLogradouro: TEdit;
    EditBairro: TEdit;
    editComplemento: TEdit;
    editCidade: TEdit;
    editNumero: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

end.
