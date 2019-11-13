unit PIP.Cases01_03; // 打鱼还是晒网

interface

uses
  System.SysUtils;

procedure Main;

implementation

type
  TDate = record
    Year: 1990 .. 2019;
    Month: 1 .. 12;
    Day: 1 .. 31;
  end;

  // 是否润年
function IsLeapYear(Year: integer): boolean;
begin
  Result := (Year mod 4 = 0) and (Year mod 100 <> 0) or (Year mod 400 = 0);
end;

// 计算距离1990/01/01的总天数
function CountDay(current: TDate): integer;
var
  perMonth: array of integer;
  ret, i: integer;
begin
  perMonth := [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  ret := 0;

  for i := 1990 to current.Year - 1 do
  begin
    if IsLeapYear(i) then
      ret := ret + 366
    else
      ret := ret + 365;
  end;

  for i := 1 to current.Month - 1 do
  begin
    if (i = 2) and IsLeapYear(current.Year) then
      ret := ret + perMonth[i] + 1
    else
      ret := ret + perMonth[i];
  end;

  ret := ret + current.Day - 1;
  Result := ret;
end;

procedure Main;
var
  a: TDate;
  flag: integer;
begin
  WriteLn('输入年，月，日, 如：2010 01 01');
  //ReadLn(a.Year, a.Month, a.Day);
  a.Year := 2012;
  a.Month := 10;
  a.Day := 26;

  flag := CountDay(a);

  if (flag mod 5) > 3 then
    WriteLn('今天晒网。')
  else
    WriteLn('今天打渔。');

  WriteLn;
end;

end.
