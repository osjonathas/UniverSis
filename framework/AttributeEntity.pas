unit AttributeEntity;

interface


type
  TableName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

type
  KeyField = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

type
  FieldName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;

type
  LookupField = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aName: String);
    property Name: String read FName write FName;
  end;


implementation

constructor TableName.Create(aName: String);
begin
  FName := aName
end;

constructor KeyField.Create(aName: String);
begin
  FName := aName;
end;

constructor FieldName.Create(aName: String);
begin
  FName := aName;
end;

{ LookField }

constructor LookupField.Create(aName: String);
begin
  FName := aName;
end;

end.
