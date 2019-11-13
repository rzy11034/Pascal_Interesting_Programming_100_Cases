unit PIP.Cases01_04;

interface

uses
  System.SysUtils;

procedure Main;

implementation

procedure Main;
var
  i, j, k, tmp: integer;
begin
  for i := 0 to 9 do
  begin
    for j := 0 to 9 do
    begin
      if i <> j then
      begin
        k := i * 1000 + i * 100 + j * 10 + j;

        for tmp := 1 to 99 do
        begin
          if Sqr(tmp) = k then
            writeln('车牌号为：', k);
        end;
      end;
    end;
  end;
end;

end.
