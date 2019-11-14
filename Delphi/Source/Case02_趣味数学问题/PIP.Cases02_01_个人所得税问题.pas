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
    class function Create(s, e: Currency; r: double): TTaxNode; static;
  end;

  TaxNodeArr = array of TTaxNode;

const
  TAX_BASE = 3500;

function TaxTable: TaxNodeArr;
var
  tmp: TaxNodeArr;
begin
  tmp :=
    [
    TTaxNode.Create(0, 1500, 0.03), // 不超过1500元的部分，征收3%
    TTaxNode.Create(1500, 4500, 0.1), // 超过1500~4500元的部分，征收10%
    TTaxNode.Create(4500, 9000, 0.2), // 超过4500~9000元的部分，征收20%
    TTaxNode.Create(9000, 35000, 0.25), // 超过9000~35000元的部分，征收25%
    TTaxNode.Create(35000, 55000, 0.3), // 超过35000~55000元的部分，征收30%
    TTaxNode.Create(55000, 80000, 0.35), // 超过55000~80000元的部分，征收35%
    TTaxNode.Create(80000, 1e10, 0.45) // 超过80000元以上的，征收45%
    ];

  Result := tmp;
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
function __CalcTax(money: Currency; const taxPoint: TaxNodeArr): Currency;

  function __tn(money: Currency; const taxPoint: TaxNodeArr): TTaxNode;
  var
    tn: TTaxNode;
  begin
    for tn in taxPoint do
    begin
      if (money > tn.StartPoint) and (money <= tn.EndPoint) then
      begin
        Break;
      end;
    end;

    Result := tn;
  end;

var
  tax, tmpM: Currency;
  tn: TTaxNode;
begin
  if (money <= 0) then
  begin
    Result := 0;
    Exit;
  end;

  tn := __tn(money, taxPoint);
  tmpM := money - tn.StartPoint; 
  tax := tmpM * tn.Rate;
  Result := tax + __CalcTax(money - tmpM, taxPoint);
end;

// error
function CalcTax(money: Currency): Currency;
var
  taxPoint: TaxNodeArr;
  tax: Currency;
  tn: TTaxNode;
begin
  taxPoint := TaxTable;
  //money := money - TAX_BASE;
  tax := 0;

  for tn in taxPoint do
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
  taxPoint: TaxNodeArr;
begin
  money := 9000;
  taxPoint := TaxTable;

  WriteLn(Format('%0.2m : %0.2m', [money, CalcTax(money)])); // error
  WriteLn(Format('%0.2m : %0.2m', [money, __CalcTax(money, taxPoint)]));
end;

{ TTaxNode }

class function TTaxNode.Create(s, e: Currency; r: double): TTaxNode;
var
  ret: TTaxNode;
begin
  ret.StartPoint := s;
  ret.EndPoint := e;
  ret.Rate := r;

  Result := ret;
end;

end.
