unit uPasfetchAscii;

{$MODE OBJFPC}{$H+}{$J-}

interface

uses 
uAnsiCrt;

procedure WriteArch;
procedure WritePopOS;
procedure WriteSolus;
procedure WriteFedora;
procedure WriteCrystal;
procedure WriteGeneric;

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
  
implementation

// Colour blocks/icons
procedure WriteBoxes(iXpos, iYpos: Integer; strIcon: String);
var
 i: Integer;
begin
  
   for i:= 1 to 6 do
    begin
      GotoXY(iXpos,iYpos);
      write(#27'['+ int2Str(90+i)+'m');
      writeLn(strIcon);
      inc(iXpos,2);
    end;
end;

// Arch Linux Logo
procedure WriteArch;
begin

  writeLn(tsDefault,fcLightBlue,'       /\\         ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightBlue,'      /  \\        ',fcLightGreen,  ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightBlue,'     /\\  \\       ',fcYellow,      ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightBlue,'    /      \\      ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,'   /   ,,   \\     ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightBlue,'  /   |  |  -\\    ',fcLightCyan,   ' ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightBlue,' /__-''    ''-__\\ '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,7,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'
  
end;

// PopOS Logo
procedure WritePopOS;
begin

  writeLn(tsDefault,fcLightCyan,' ______             ');
  writeLn(tsDefault,fcLightCyan,' \   _ \        __  ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightCyan,'  \ \ \ \      / /  ',fcLightGreen,  ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightCyan,'   \ \_\ \    / /   ',fcYellow,      ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightCyan,'    \  ___\  /_/    ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightCyan,'     \ \    _       ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightCyan,'    __\_\__(_)_     ',fcLightCyan,   ' ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightCyan,'   (___________)    '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'

end;

//Solus OS
procedure WriteSolus;
begin

  writeLn(tsDefault,fcLightBlue,' 				   ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightBlue,'     /|			   ',fcLightGreen,  ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightBlue,'    / |\\		   ',fcYellow,      ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightBlue,'   /  | \\ _		   ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,'  /___|__\\_\\	   ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightBlue,' \\         /	   ',fcLightCyan,   ' ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightBlue,'  \`-------´	       '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,7,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'

end;

// Fedora OS
procedure WriteFedora;
begin

  writeLn(tsDefault,fcWhite,    '        _____       ');
  writeLn(tsDefault,fcWhite,    '       /   __)',fcLightBlue,'\    '           ,fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcWhite,    '       |  /  ',fcLightBlue,'\ \   '           ,fcLightGreen,  ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightBlue,'    ___',fcWhite,'|  |',fcLightBlue,'__/ /   ',fcYellow,      ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightBlue,'   / ',fcWhite,'(_    _)',fcLightBlue,'_/    ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,'  / /  ',fcWhite,'|  |        '               ,fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightBlue,'  \ \',fcWhite,'__/  |        '               ,fcLightCyan,   ' ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightBlue,'   \',fcWhite,'(_____/        '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

// Crystal OS
procedure WriteCrystal;
begin

  writeLn(tsDefault,fcMagenta,'           -//.     ');
  writeLn(tsDefault,fcMagenta,'         -//.       ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcMagenta,'       -//. .       ',fcLightGreen,  ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcMagenta,'     -//.  ''//-    ',fcYellow,      ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcMagenta,'    /+:      :+/    ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcMagenta,'     .//''  .//.    ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcMagenta,'       . .//.       ',fcLightCyan,   ' ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcMagenta,'       .//.         '); // Call WriteBoxes to fill this area with coloured boxes
  writeLn(tsDefault,fcMagenta,'     .//.           '); 
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

// Generic
procedure WriteGeneric;
begin

  writeLn(tsDefault,fcWhite,'       .---.	       ');
  writeLn(tsDefault,fcWhite,'      /     \	   ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcWhite,'      \.@-@./	   ',fcLightGreen,  ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcWhite,'      /`\_/`\	   ',fcYellow,      ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcWhite,'     //  _  \\	   ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcWhite,'    | \     )|_	   ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcWhite,'   /`\_`>  <_/ \	   ',fcLightCyan,   ' ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcWhite,'   \__/''---''\__/  '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

end.
