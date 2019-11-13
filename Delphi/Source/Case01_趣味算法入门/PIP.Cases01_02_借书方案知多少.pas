unit PIP.Cases01_02_借书方案知多少;

interface

uses
  System.SysUtils;

procedure Main;

implementation

procedure Main;
var
  a, b, c, i: integer;
begin
  i := 0;

  for a := 1 to 5 do
  begin
    for b := 1 to 5 do
    begin
      if a <> b then
      begin
        for c := 1 to 5 do
        begin
          if (c <> a) and (c <> b) then
          begin
            inc(i);
            WriteLn(Format('A:%d, B:%d, C:%d', [a, b, c]));
          end;
        end;
      end;
    end;
  end;

  WriteLn(Format('共有%d种有效借阅方法', [i]));
end;

end.
