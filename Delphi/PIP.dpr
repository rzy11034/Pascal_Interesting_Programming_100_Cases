program PIP;

{$APPTYPE CONSOLE}
{$R *.res}


uses
  System.SysUtils,
  PIP.Main in 'Source\PIP.Main.pas',
  PIP.Utils in 'Source\PIP.Utils.pas',
  PIP.Cases01_01_百鸡百线问题 in 'Source\Case01_趣味算法入门\PIP.Cases01_01_百鸡百线问题.pas',
  PIP.Cases01_02_借书方案知多少 in 'Source\Case01_趣味算法入门\PIP.Cases01_02_借书方案知多少.pas',
  PIP.Cases01_03_打鱼还是晒网 in 'Source\Case01_趣味算法入门\PIP.Cases01_03_打鱼还是晒网.pas',
  PIP.Cases01_04_抓交通肇事犯 in 'Source\Case01_趣味算法入门\PIP.Cases01_04_抓交通肇事犯.pas',
  PIP.Cases01_05_兔子产子问题 in 'Source\Case01_趣味算法入门\PIP.Cases01_05_兔子产子问题.pas',
  PIP.Cases01_06_牛顿迭代法求方程根 in 'Source\Case01_趣味算法入门\PIP.Cases01_06_牛顿迭代法求方程根.pas',
  PIP.Cases01_07_最佳存款方案 in 'Source\Case01_趣味算法入门\PIP.Cases01_07_最佳存款方案.pas',
  PIP.Cases01_08_冒泡排序 in 'Source\Case01_趣味算法入门\PIP.Cases01_08_冒泡排序.pas',
  PIP.Cases01_09_折半查找 in 'Source\Case01_趣味算法入门\PIP.Cases01_09_折半查找.pas',
  PIP.Cases01_10_数值转换 in 'Source\Case01_趣味算法入门\PIP.Cases01_10_数值转换.pas';

begin
  try
    Run;
    TLAUtils.DrawLine;
    Writeln(END_OF_PROGRAM_EN);
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
