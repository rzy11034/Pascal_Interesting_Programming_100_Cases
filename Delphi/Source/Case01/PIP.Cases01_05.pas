unit PIP.Cases01_05;

interface

uses
  System.SysUtils;

procedure Main;

implementation

function Fibonacci(i: integer): integer;
begin
  if i = 1 then
    Exit(1)
  else if i <= 0 then
    Exit(0);

  Result := Fibonacci(i - 1) + Fibonacci(i - 2);
end;

function Fibonacci_Iteration(n: integer): integer;
var
  tmp, fib1, fib2, i: integer;
begin
  fib1 := 1;
  fib2 := 1;
  tmp := 0;

  for i := 3 to n do
  begin
    tmp := fib1 + fib2;

    fib1 := fib2;
    fib2 := tmp;
  end;

  Result := tmp;
end;

procedure Main;
begin
  WriteLn(Fibonacci_Iteration(30));
end;

end.
