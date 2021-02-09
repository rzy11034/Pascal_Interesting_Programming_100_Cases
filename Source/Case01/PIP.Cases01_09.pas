unit PIP.Cases01_09;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

type
  TIntArr = array of integer;

function Binary_search(k: integer; arr: TIntArr): integer;
var
  l, r, mid: integer;
begin
  l := 0;
  r := Length(arr) - 1;

  while l <= r do
  begin
    mid := l + (r - l) div 2;

    if k = arr[mid] then
    begin
      Result := mid;
      Exit;
    end;

    if k > arr[mid] then
      l := mid + 1
    else
      r := mid - 1;
  end;

  Result := -1;
end;

procedure Main;
var
  a: TIntArr;
begin
  a := [1, 2, 3, 4, 5, 6, 7, 8, 9];
  Writeln(Binary_search(5, a));
end;

end.
