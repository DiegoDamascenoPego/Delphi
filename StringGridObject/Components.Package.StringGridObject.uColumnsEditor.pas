unit Components.Package.StringGridObject.uColumnsEditor;

interface

uses
  DesignEditors, DesignIntf, ColEdit;

type
  TColunmsEditor = class(TComponentEditor)
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): string; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;

implementation

uses
  System.Classes, System.Rtti, ColnEdit,
  Components.Package.StringGridObject.IColumnsGen,
  Components.Package.Utils.uObject,
  Components.Package.StringGridObject.uStringGrid;

{ TColunmsEditor }
procedure TColunmsEditor.ExecuteVerb(Index: Integer);
var
  context: TRttiContext;
  Types: TRttiType;
  prop: TRttiProperty;
  Detail: TColumnDetail;
  ColumnsCreate: IColumnsGenerate;
begin
  inherited;
  case Index of
    0:
      ShowCollectionEditor(Designer, Component, TStringGridObject(Component).Columns, 'Columns');
    1:
      begin
        ColumnsCreate := TGeneratorColumn.Create;
        ColumnsCreate.GenerateColumns(TStringGridObject(Component).Columns, TGenericObject.Instanciar(TStringGridObject(Component).ColumnObject).ClassType);
      end;
  end;

end;

function TColunmsEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0:
      Result := 'Create/Edit Colunms';
    1:
      Result := 'Generate Colunms';
  end;
end;

function TColunmsEditor.GetVerbCount: Integer;
begin
  Result := 2
end;

end.
