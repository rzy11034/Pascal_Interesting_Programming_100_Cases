﻿unit PIP.Cases01_02;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils;

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
            Inc(i);
            WriteLn(Format('A:%d, B:%d, C:%d', [a, b, c]));
          end;
        end;
      end;
    end;
  end;

  WriteLn(Format('共有%d种有效借阅方法', [i]));
end;

end.
