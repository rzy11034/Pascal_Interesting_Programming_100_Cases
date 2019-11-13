unit PIP.Cases01_08_冒泡排序;

interface

uses
  System.Generics.Collections;

procedure Main;

implementation

type
  TIntArr = TArray<integer>;

procedure BubbleSort(arr: TIntArr);
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
    Inc(j);

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
  arr: TIntArr;
  i: integer;
begin
  arr := [8, 7, 9, 5, 3, 10, 11, 20, 6, 11, 15];
  BubbleSort(arr);

  for i := 0 to Length(arr) - 1 do
    Write(arr[i], ' ');

  WriteLn;
end;

end.
