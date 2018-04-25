unit StringGridColuns;

interface
uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.Grids, System.Generics.Collections,
   vcl.Forms, vcl.dialogs;

type
  TFieldDetail = class;
  TColunas = class;

  TCellsType = (ctNone, ctInteger, ctNumeric, ctFloat, ctDate, ctString, ctBoolean);

  TFieldDetail = class(TCollectionItem)
  private
    FColTitle: String;
    FMaskEdit: String;
    FColType: TCellsType;
    FCanSelect: Boolean;
    FisRequered: Boolean;
    FMaxLen: integer;
    FDecimal: integer;
    FFieldName: string;
    FSize: Integer;
    FCellsAlignment: TAlignment;
    procedure SetCanSelect(const Value: Boolean);
    procedure SetColTitle(const Value: String);
    procedure SetColType(const Value: TCellsType);
    procedure SetDecimal(const Value: integer);
    procedure SetisRequered(const Value: Boolean);
    procedure SetMaskEdit(const Value: String);
    procedure SetMaxLen(const Value: integer);
    procedure SetFieldName(const Value: string);
    procedure SetSize(const Value: Integer);
    procedure SetCellsAlignment(const Value: TAlignment);
  protected
    FColunas: TColunas;
    procedure SetIndex(Value: Integer); override;
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property ColTitle: String read FColTitle write SetColTitle;
    property ColType: TCellsType read FColType write SetColType;
    property FieldName: string read FFieldName write SetFieldName;
    property Decimal: integer read FDecimal write SetDecimal;
    property MaxLen: integer read FMaxLen write SetMaxLen;
    property MaskEdit: String read FMaskEdit write SetMaskEdit;
    property CanSelect: Boolean read FCanSelect write SetCanSelect;
    property isRequered: Boolean read FisRequered write SetisRequered;
    property Size: Integer read FSize write SetSize;
    property Colunas: TColunas read FColunas write FColunas stored True;
    property CellsAlignment: TAlignment read FCellsAlignment write SetCellsAlignment;

  end;

  TColunas = class(TOwnedCollection)
  protected
    function GetItem(Index: Integer): TFieldDetail;
    procedure SetItem(Index: Integer; Value: TFieldDetail);
    procedure Update(Item: TCollectionItem); override;
  public
    function Add: TFieldDetail;
    constructor Create(AOwner: TPersistent);
    property Items[Index: Integer]: TFieldDetail read GetItem write SetItem;
  end;

implementation

uses
   StringGrid;

constructor TFieldDetail.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FColunas := TColunas.Create(Collection.Owner);
  Self.FColTitle := '';
  Self.FColType := ctNone;
  Self.FCanSelect := False;
  Self.FisRequered := False;
  Self.FFieldName := '';
  Self.FSize := 30;
  Self.FCellsAlignment := taLeftJustify;
end;

destructor TFieldDetail.Destroy;
begin
  FColunas.Free;
  inherited Destroy;
end;

procedure TFieldDetail.SetCanSelect(const Value: Boolean);
begin
  FCanSelect := Value;
end;

procedure TFieldDetail.SetCellsAlignment(const Value: TAlignment);
begin
  FCellsAlignment := Value;
end;

procedure TFieldDetail.SetColTitle(const Value: String);
begin
  FColTitle := Value;
end;

procedure TFieldDetail.SetColType(const Value: TCellsType);
begin
  FColType := Value;
end;

procedure TFieldDetail.SetDecimal(const Value: integer);
begin
  FDecimal := Value;
end;

procedure TFieldDetail.SetFieldName(const Value: string);
begin
  FFieldName := Value;
end;

procedure TFieldDetail.SetIndex(Value: Integer);
begin
  inherited SetIndex(Value);
end;

procedure TFieldDetail.SetisRequered(const Value: Boolean);
begin
  FisRequered := Value;
end;

procedure TFieldDetail.SetMaskEdit(const Value: String);
begin
  FMaskEdit := Value;
end;

procedure TFieldDetail.SetMaxLen(const Value: integer);
begin
  FMaxLen := Value;
end;

procedure TFieldDetail.SetSize(const Value: Integer);
begin
  FSize := Value;
end;

function TFieldDetail.GetDisplayName: string;
begin
  Result := FColTitle;
end;

procedure TFieldDetail.Assign(Source: TPersistent);
begin
  FColTitle := TFieldDetail(Source).FColTitle;
  FColunas.Assign(TFieldDetail(Source).Colunas);
end;

function TColunas.Add: TFieldDetail;
begin
   Result := TFieldDetail(inherited Add);
end;

constructor TColunas.Create(AOwner: TPersistent);
begin
  inherited Create(AOwner, TFieldDetail);
end;

function TColunas.GetItem(Index: Integer): TFieldDetail;
begin
  Result := TFieldDetail(inherited GetItem(Index));
end;

procedure TColunas.SetItem(Index: Integer;
  Value: TFieldDetail);
begin
  inherited SetItem(Index, Value);
end;

procedure TColunas.Update(Item: TCollectionItem);
begin
  inherited;

end;

end.
