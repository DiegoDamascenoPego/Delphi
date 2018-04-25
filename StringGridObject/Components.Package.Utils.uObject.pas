unit Components.Package.Utils.uObject;

interface

uses
  System.Rtti, System.SysUtils;

Type
  EInstancia_Not_Null = class(Exception);

Type
  TGenericObject = class
    class function Instanciar(const Str_Class: TValue): TObject;
  end;

implementation

{ TGenericObject }

class function TGenericObject.Instanciar(const Str_Class: TValue): TObject;
var
  C: TRttiContext;
  instancia: TRttiInstanceType;
  p: TRttiType;
  Erro: String;
begin
  try
    case Str_Class.Kind of
      tkString, tkLString, tkWString, tkUString:
        begin
          Erro := Str_Class.AsString + ' Classe N�o encontrada' + sLineBreak + '<Lembrete : verifique ortografia&nbsp; / Case Sensitive>' + sLineBreak;
          instancia := (C.FindType(Str_Class.AsString) as TRttiInstanceType);
          result := (instancia.MetaclassType.Create);
        end;
      tkClassRef:
        begin
          Erro := 'O par�metro passado deve ser do tipo Tclass' + sLineBreak;
          p := C.GetType(Str_Class.AsClass);
          instancia := (C.FindType(p.QualifiedName) as TRttiInstanceType);
          result := instancia.MetaclassType.Create;

        end;
    else
      begin
        Erro := 'O par�metro passado n�o � v�lidado para a fun��o' + sLineBreak;
        abort;
      end;
    end;
  except
    on e: Exception do
    begin
      raise EInstancia_Not_Null.Create(Erro + 'Mensagem Original' + sLineBreak + e.Message);
    end;
  end;
end;

end.
