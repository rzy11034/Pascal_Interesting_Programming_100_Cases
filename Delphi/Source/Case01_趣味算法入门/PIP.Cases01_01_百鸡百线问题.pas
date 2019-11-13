unit PIP.Cases01_01_百鸡百线问题;

interface

uses
  System.SysUtils;

procedure Main;

implementation

procedure Main;
var
  cock, hen, chicken: integer;
begin
  for cock := 0 to 20 do
  begin
    for hen := 0 to 33 do
    begin
      chicken := 100 - cock - hen;

      if (chicken mod 3 = 0) and ((5 * cock + 3 * hen + chicken div 3) = 100) then
        WriteLn(Format('cock: %d, hen: %d, chicken: %d', [cock, hen, chicken]));
    end;
  end;
end;

end.
