unit PIP.Cases01_10;

{$mode objfpc}{$H+}
{$ZEROBASEDSTRINGS ON}

interface

uses
  Classes,
  SysUtils,
  gstack,
  Math;

procedure Main;

implementation

type
  TStack = specialize TStack<char>;

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

function AnyToDec(numStr: string; inType: integer): integer;
var
  tmp, i: integer;
  stack: TStack;
begin
  tmp := 0;

  stack := TStack.Create;
  try
    for i := Low(numStr) to High(numStr) do
    begin
      stack.Push(numStr[i]);
    end;

    i := 0;
    while not stack.IsEmpty do
    begin
      tmp := tmp + CharToNum(stack.Top) * Round(IntPower(inType, i));
      stack.Pop;

      i += 1;
    end;


    Result := tmp;
  finally
    stack.Free;
  end;
end;

function DecToAny(numStr: integer; OutType: integer): string;
var
  tmp: integer;
  stack: TStack;
  sb: TAnsiStringBuilder;
begin
  stack := TStack.Create;
  sb := TAnsiStringBuilder.Create;
  try
    tmp := numStr;

    while tmp > 0 do
    begin
      stack.Push(NumToChar(tmp mod OutType));
      tmp := tmp div OutType;
    end;

    while not stack.IsEmpty do
    begin
      sb.Append(stack.Top);
      stack.Pop;
    end;

    Result := sb.ToString;
  finally
    sb.Free;
    stack.Free;
  end;
end;

function NumTrans(numStr: string; inType, outType: integer): string;
begin
  Result := DecToAny(AnyToDec(numStr, inType), outType);
end;

procedure Main;
begin
  writeLn(NumTrans('100000', 10, 16));
end;

end.
