unit Components.Package.StringGridObject.IColumnsGen;

interface

uses
  System.Classes;

type
  IColumnsGenerate = Interface
    ['{A017C52C-475B-40A5-8164-B48C6D7429E9}']

    procedure GenerateColumns(Columns: TCollection; obj: TClass);

  End;

implementation

end.
