unit PIP.Cases01_10_数值转换;

interface

uses
  System.SysUtils,
  System.Generics.Collections;

procedure Main;

implementation

type
  TStack = TStack<string>;

function CharToNum(c: Char): integer;
var
  ret: integer;
  tmp: Char;
begin
  ret := -1;
  tmp := UpCase(c);

  if (tmp >= '0') and (tmp <= '9') then
    ret := Ord(tmp) - Ord('0')
  else if (tmp >= 'A') and (tmp <= 'Z') then
    ret := Ord(tmp) - Ord('A') + 10;

  Result := ret;
end;

function NumToChar(n: integer): Char;
var
  ret: Char;
begin
  ret := #0;

  if (n = 0) and (n <= 9) then
    ret := chr(n + Ord('0'))
  else if (n >= 10) and (n <= 35) then
    ret := chr(n + Ord('A') - 10);

  Result := ret;
end;

function NumTrans(num: string; inType, outType: integer): string;
var
  stack: TStack;
  sb: TStringBuilder;
begin
  stack := TStack.Create;
  sb := TStringBuilder.Create;
  try
    if inType = outType then
    begin
      Result := num;
      Exit;
    end
    else if inType > outType then // 原进制大于输出进制
    begin
      stack.Clear;
      
      
    end
    else  // 原进制小于输出进制
    begin

    end;

  finally
    sb.Free;
    stack.Free;
  end; // try
end;

procedure Main;
begin
  writeLn(NumToChar(15));
  writeLn(CharToNum('F'));
end;

end.
