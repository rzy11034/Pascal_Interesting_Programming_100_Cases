unit PIP.Cases02_02_存钱问题;

interface

procedure Main;

implementation

type
  ff = record
    Year: Integer;
    Interest: Double;
  end;

const
  YEAR_INTEREST_TABLE: array [0 .. 4] of ff = (
    (Year: 1; Interest: 0.0063), // 0.63% 期限为1年
    (Year: 2; Interest: 0.0066), // 0.66% 期限为2年
    (Year: 3; Interest: 0.0069), // 0.69% 期限为3年
    (Year: 5; Interest: 0.0075), // 0.75% 期限为5年
    (Year: 8; Interest: 0.0084)); // 0.84% 期限为8年

procedure Main;
begin

end;

end.
