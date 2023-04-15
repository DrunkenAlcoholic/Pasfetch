program pasfetch(input, output, stdErr);

{$MODE OBJFPC}{$H+}{$J-}

uses 
uPasfetchUtils,
uAnsiCrt;


var 
  // A record to store system information
  Info: packed record
    OS: packed array [1..40] of char;
    HostName: packed array [1..40] of char;
    Kernel: packed array [1..40] of char;
    Shell: packed array [1..10] of char;
    Uptime: packed array [1..20] of char;
    Memory: packed array [1..30] of char;

  end;

  i, iBoxPos: Integer;

begin
  // Get system information and place it in record
  with info do
    begin
      OS := GetOS;
      HostName := GetHostName;
      Kernel := GetKernel;
      Shell  := GetShell;
      Uptime := GetUptime;
      Memory := GetRamUsage;
    end;

  //Clear the screen
  ClrScr;

  //Check what operating system and write logo
  WriteOSLogo(info.OS);


  // Info Names with icons
  write(fcLightRed);
  GoToXY(19, 2);
  Write(''); // OS
  write(fcLightGreen);
  GoToXY(19, 3);
  Write(''); // HOST
  write(fcYellow);
  GoToXY(19, 4);
  Write(''); // KERNEL
  write(fcLightBlue);
  GoToXY(19, 5); 
  Write('');//SHELL
  write(fcLightMagenta);
  GoToXY(19, 6);
  Write(''); // UPTIME
  write(fcLightCyan);
  GoToXY(19, 7);
  Write(''); // MEMORY
	//NormVideo;
		
 (* // Info Names without icons
  write(fcYellow);
  GoToXY(20, 2);
  Write(' OS:');
  GoToXY(20, 3);
  Write(' HOST:');
  GoToXY(20, 4);
  Write(' KERNEL:');
  GoToXY(20, 5);
  Write(' SHELL:');
  GoToXY(20, 6);
  Write(' UPTIME:');
  GoToXY(20, 7);
  Write(' MEMORY:');
  //NormVideo; *)


  // Info
  write(fcWhite);
  GoToXY(22, 2);
  writeln(info.OS);

  GoToXY(22, 3);
  Write(info.HostName);

  GoToXY(22, 4);
  Write(info.Kernel);

  GoToXY(22, 5);
  Write(info.Shell);

  GoToXY(22, 6);
  Write(info.Uptime);

  GoToXY(22, 7);
  Write(info.Memory);

  // Color blocks 
  iBoxPos := 26;
 
   for i:= 1 to 6 do
    begin
      GotoXY(iBoxPos,8);
      write(#27'['+ int2Str(90+i)+'m');
      writeLn('▄');
      inc(iBoxPos,2);
    end;

  // end
  write(tsResetAll);
  GoToXY(1, 10);

  // Forkers... Below are some other useful information using enviroment variables if needed
  //WriteLn(GetEnv('HOME'));
  //WriteLn(GetEnv('USER'));
  //WriteLn(GetEnv('SHELL'));
  //WriteLn(GetEnv('TERM'));
  //WriteLn(GetEnv('DESKTOP_SESSION'));

end.
