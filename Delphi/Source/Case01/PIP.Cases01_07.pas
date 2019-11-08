unit PIP.Cases01_07;

interface

uses
  System.SysUtils;

procedure Main;

implementation

function Solution(a: integer; money: double): double;
var
  tmp: double;
begin
  if a = 0 then
    Exit(0);

  tmp := money / (1 + 12 * 0.0063);
  Result := tmp + Solution(a - 1, tmp);
end;

procedure Main;
var
  n: integer;
begin
  n := 5;
  WriteLn(Format('%d年应存入: %0.2f', [n, Solution(n, 1000)]));
end;

end.
