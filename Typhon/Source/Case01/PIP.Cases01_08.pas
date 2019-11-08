unit PIP.Cases01_08;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

type
  TIntArr = specialize TArray<integer>;

procedure BubbleSort(const arr: specialize TArray<integer>);
var
  isSwaped: boolean;
  i, j, tmp, n: integer;
begin
  n := Length(arr);
  j := 1;
  isSwaped := True;

  while isSwaped do
  begin
    isSwaped := False;
    j += 1;

    for i := 0 to n - j do
    begin
      if arr[i] > arr[i + 1] then
      begin
        tmp := arr[i];
        arr[i] := arr[i + 1];
        arr[i + 1] := tmp;

        isSwaped := True;
      end;
    end;
  end;
end;

procedure Main;
var
  arr: specialize TArray<integer>;
  i: integer;
begin
  arr := [8, 7, 9, 5, 3, 10, 11, 20, 6, 11, 15];
  BubbleSort(arr);

  for i := 0 to Length(arr) - 1 do
    Write(arr[i], ' ');

  WriteLn;
end;

end.
