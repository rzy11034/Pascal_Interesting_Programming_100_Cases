program PIP;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  PIP.Main in 'Source\PIP.Main.pas',
  PIP.Utils in 'Source\PIP.Utils.pas',
  PIP.Cases01_01 in 'Source\Case01\PIP.Cases01_01.pas',
  PIP.Cases01_02 in 'Source\Case01\PIP.Cases01_02.pas',
  PIP.Cases01_03 in 'Source\Case01\PIP.Cases01_03.pas';

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
