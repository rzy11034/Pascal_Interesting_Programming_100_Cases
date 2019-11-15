unit PIP.Cases02_01_个人所得税问题;

interface

uses
  System.SysUtils;

procedure Main;

implementation

type
  TTaxNode = record
    StartPoint: Currency; // 起征点
    EndPoint: Currency; // 止行点
    Rate: double; // 征收比率
  end;

const
  TAX_BASE = 3500;

  TAX_TABLE: array [0 .. 6] of TTaxNode =
    (
    (StartPoint: 0; EndPoint: 1500; Rate: 0.03), // 不超过1500元的部分，征收3%
    (StartPoint: 1500; EndPoint: 4500; Rate: 0.1), // 超过1500~4500元的部分，征收10%
    (StartPoint: 4500; EndPoint: 9000; Rate: 0.2), // 超过4500~9000元的部分，征收20%
    (StartPoint: 9000; EndPoint: 35000; Rate: 0.25), // 超过9000~35000元的部分，征收25%
    (StartPoint: 35000; EndPoint: 55000; Rate: 0.3), // 超过35000~55000元的部分，征收30%
    (StartPoint: 55000; EndPoint: 80000; Rate: 0.35), // 超过55000~80000元的部分，征收35%
    (StartPoint: 80000; EndPoint: 1E10; Rate: 0.45) // 超过80000元以上的，征收45%
    );

function __tn(money: Currency): TTaxNode;
var
  tn: TTaxNode;
begin
  for tn in TAX_TABLE do
  begin
    if (money > tn.StartPoint) and (money <= tn.EndPoint) then
    begin
      Break;
    end;
  end;

  Result := tn;
end;

//  个人所行税征收办法如下：
//    起征点为3000元。
//      不超过1500元的部分，征收3%；
//      超过1500~4500元的部分，征收10%
//      超过4500~9000元的部分，征收20%
//      超过9000~35000元的部分，征收25%
//      超过35000~55000元的部分，征收30%
//      超过55000~80000元的部分，征收35%
//      超过80000元以上的，征收45%
function __CalcTax(money: Currency): Currency;
var
  tax, tmpM: Currency;
  tn: TTaxNode;
begin
  if (money <= 0) then
  begin
    Result := 0;
    Exit;
  end;

  tn := __tn(money);
  tmpM := money - tn.StartPoint;
  tax := tmpM * tn.Rate;
  Result := tax + __CalcTax(money - tmpM);
end;

// error
function CalcTax(money: Currency): Currency;
var
  tax: Currency;
  tn: TTaxNode;
begin
  tax := 0;

  for tn in TAX_TABLE do
  begin
    if money > tn.StartPoint then
    begin
      if money > tn.EndPoint then
        tax := tax + (tn.EndPoint - tn.StartPoint) * tn.Rate
      else
        tax := tax + (money - tn.StartPoint) * tn.Rate;

      money := money - tn.EndPoint;
    end;
  end;

  Result := tax;
end;

procedure Main;
var
  money: Currency;
begin
  money := 9000;

  WriteLn(Format('%0.2m : %0.2m', [money, CalcTax(money)])); // error
  WriteLn(Format('%0.2m : %0.2m', [money, __CalcTax(money)]));
end;

end.
