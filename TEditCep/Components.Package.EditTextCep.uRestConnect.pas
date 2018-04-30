unit Components.Package.EditTextCep.uRestConnect;

interface
uses
    REST.Client, REST.Json, JSON, Components.Package.EditTextCep.uEnd;

type
  THelperString =  record helper for String
    function GetNumber: string;
  end;


type
    TRest = class
    private
      FClient   : TRESTClient;
      FRequest  : TRESTRequest;
      FResponse : TRESTResponse;
    public
      constructor Create;
      destructor Destroy;
      function Result(Const Value: String): TRESTResponse;
    end;

implementation

uses
  IPPeerClient, System.SysUtils;

{ TRest }




constructor TRest.Create;
begin
  Self.FClient   := TRESTClient.Create(nil);
  Self.FRequest  := TRESTRequest.Create(nil);
  Self.FResponse := TRESTResponse.Create(nil);

  Self.FClient.BaseURL := 'https://viacep.com.br/ws/';;

  Self.FClient.AutoCreateParams  := True;
  Self.FRequest.AutoCreateParams := True;
  Self.FRequest.HandleRedirects  := True;
  Self.FRequest.Client           := Self.FClient;
  Self.FRequest.Response         := Self.FResponse;
end;

destructor TRest.Destroy;
begin
  Self.FClient.Free;
  Self.FRequest.Free;
  Self.FResponse.Free;
end;

function TRest.Result(Const Value: String): TRESTResponse;
var
     I: Integer;
begin
  if Length(Value.GetNumber)> 0 then
  begin
    try
      Self.FRequest.Resource := Value.GetNumber + '/json/';;
      Self.FRequest.Execute;
      Result := Self.FResponse;
    except
      raise Exception.Create('Conversão não realizada');
    end;
  end;

end;

{ THelperString }

function THelperString.GetNumber: string;
var
  I: Integer;
begin
  for I := 1 To Length(Self) do
       if Self [I] In ['0'..'9'] Then
            Result := Result + Self [I];
end;


end.
