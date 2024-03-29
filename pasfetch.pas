program pasfetch(input, output, stdErr);

{$MODE OBJFPC}{$H+}{$J-}

uses 
uPasfetchUtils, uPasfetchAscii,
uAnsiCrt;


begin
  // Get system information and place it in record
  with info do
    begin
      OS := GetOS;
      HostName := GetHostName;
      Kernel := GetKernel;
      Shell  := GetShell;
      Pkgs	 := GetPkgs;
      Uptime := GetUptime;
      Memory := GetRamUsage;
    end;

  //Clear the screen
  ClrScr;

  //Check for Parameter(debugging ascii) otherwise print OS
  if paramCount() > 0 then
   WriteOSLogo(paramStr(1)) //e.g pasfetch Popos
  else
	WriteOSLogo(info.OS);

  //Write System information
  (* 
  * Moved all the system info writting to the ascii logo's
  * for more customization.
  *)


  // end,move cursor to new line
  write(tsResetAll);
  GoToXY(1, 10);

  // Forkers... Below are some other useful information using enviroment variables if needed
  //WriteLn(GetEnv('HOME'));
  //WriteLn(GetEnv('USER'));
  //WriteLn(GetEnv('SHELL'));
  //WriteLn(GetEnv('TERM'));
  //WriteLn(GetEnv('DESKTOP_SESSION'));

end.
