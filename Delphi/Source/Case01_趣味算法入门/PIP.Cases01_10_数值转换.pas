unit PIP.Cases01_10_数值转换;

{$ZEROBASEDSTRINGS ON}

interface

uses
  System.SysUtils,
  System.Math,
  System.Generics.Collections;

procedure Main;

implementation

type
  TStack = TStack<char>;

function CharToNum(c: char): integer;
var
  ret: integer;
  tmp: char;
begin
  ret := -1;
  tmp := UpCase(c);

  if (tmp >= '0') and (tmp <= '9') then
    ret := Ord(tmp) - Ord('0')
  else if (tmp >= 'A') and (tmp <= 'Z') then
    ret := Ord(tmp) - Ord('A') + 10;

  Result := ret;
end;

function NumToChar(n: integer): char;
var
  ret: char;
begin
  ret := #0;

  if (n >= 0) and (n <= 9) then
    ret := chr(n + Ord('0'))
  else if (n >= 10) and (n <= 35) then
    ret := chr(n + Ord('A') - 10);

  Result := ret;
end;

function AnyToDec(numStr: string; inType: integer): string;
var
  tmp, i: integer;
  stack: TStack;
begin
  tmp := 0;

  stack := TStack.Create;
  try
    for i := Low(numStr) to High(numStr) do
      stack.Push(numStr[i]);

    i := 0;
    while stack.Count > 0 do
    begin
      tmp := tmp + CharToNum(stack.Peek) * Round(IntPower(inType, i));
      stack.Pop;

      i := i + 1;
    end;

    Result := tmp.ToString;
  finally
    stack.Free;
  end;
end;

function DecToAny(numStr: string; OutType: integer): string;
var
  tmp: integer;
  stack: TStack;
  sb: TStringBuilder;
begin
  stack := TStack.Create;
  sb := TStringBuilder.Create;
  try
    tmp := numStr.ToInteger;

    while tmp > 0 do
    begin
      stack.Push(NumToChar(tmp mod OutType));
      tmp := tmp div OutType;
    end;

    while stack.Count > 0 do
    begin
      sb.Append(stack.Peek);
      stack.Pop;
    end;

    Result := sb.ToString;
  finally
    sb.Free;
    stack.Free;
  end;
end;

function NumTrans(numStr: string; inType, OutType: integer): string;
begin
  Result := DecToAny(AnyToDec(numStr, inType), OutType);
end;

procedure Main;
begin
  writeLn(NumTrans('255', 10, 16));
end;

end.
