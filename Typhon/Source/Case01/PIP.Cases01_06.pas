unit PIP.Cases01_06;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  Math;

procedure Main;

implementation

function Solution(a, b, c, d: double): double;
var
  x0, x, f, fd, h: double; // f用来描述方程的值，fd用来描述方程求导之后的值
begin
  x := 1.5;

  repeat
    x0 := x; // 用所有求得的x的值代替x0原来的值
    f := 2 * x0 ** 3 + b * x0 ** 2 + c * x0 + d;
    fd := 3 * a * x0 ** 2 + 2 * b * x0 + c;
    h := f / fd;
    x := x0 - h; // 求得更接近方程根的x的值
  until Abs(x - x0) >= 1e-5;

  Result := x;
end;

procedure Main;
var
  a, b, c, d, x: double;
begin
  Write('请输入方程的系数: ');
  ReadLn(a, b, c, d);

  x := solution(a, b, c, d);
  WriteLn('所求方程的根 x = ', x.ToString);
end;

end.
