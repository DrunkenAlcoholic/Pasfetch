unit uPasfetchAscii;

{$MODE OBJFPC}{$H+}{$J-}

interface

uses 
uAnsiCrt;

procedure WriteArch;
procedure WriteArco;
procedure WritePopOS;
procedure WriteSolus;
procedure WriteFedora;
procedure WriteCrystal;
procedure WriteLinuxMint;
procedure WriteGeneric;

var
// A record to store system information
  Info: packed record
    OS: packed array [1..40] of char;
    HostName: packed array [1..40] of char;
    Kernel: packed array [1..40] of char;
    Shell: packed array [1..10] of char;
    Pkgs: Integer;
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

// Arch Linux Logo 󰏕
procedure WriteArch;
begin

  writeLn(tsDefault,fcLightBlue,'       /\\         ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightBlue,'      /  \\        ',fcLightGreen,  ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightBlue,'     /\\  \\       ',fcYellow,      '󰏖 ',fcWhite,tsBold, info.Pkgs, ' pkgs');    // PKGS
  writeLn(tsDefault,fcLightBlue,'    /      \\      ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,'   /   ,,   \\     ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightBlue,'  /   |  |  -\\    ',fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightBlue,' /__-''    ''-__\\ '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,7,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'
  
end;

// Arco Linux Logo
procedure WriteArco;
begin

  writeLn(tsDefault,fcLightBlue,'      /\        ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightBlue,'     /  \       ',fcLightGreen,  ' ',fcWhite,tsBold, info.Kernel);       // KERNEL
  writeLn(tsDefault,fcLightBlue,'    / /\ \      ',fcYellow,      '󰏖 ',fcWhite,tsBold, info.Pkgs, ' pkgs');    // PKGS
  writeLn(tsDefault,fcLightBlue,'   / /  \ \     ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,'  / /    \ \    ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);       // UPTIME
  writeLn(tsDefault,fcLightBlue,' / / _____\ \   ',fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightBlue,'/_/  ''----.\_\  '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,7,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'
  
end;

// PopOS Logo
procedure WritePopOS;
begin

  writeLn(tsDefault,fcLightCyan,' ______             ');
  writeLn(tsDefault,fcLightCyan,' \   _ \        __  ',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightCyan,'  \ \ \ \      / /  ',fcLightGreen,  ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightCyan,'   \ \_\ \    / /   ',fcYellow,      ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightCyan,'    \  ___\  /_/    ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightCyan,'     \ \    _       ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightCyan,'    __\_\__(_)_     ',fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightCyan,'   (___________)    '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'

end;

//Solus OS
procedure WriteSolus;
begin

  writeLn(tsDefault,fcLightBlue,'               ');
  writeLn(tsDefault,fcLightBlue,'     /|		',fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightBlue,'    / |\\       ',fcLightGreen, ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightBlue,'   /  | \\ _	',fcYellow,      '󰏖 ',fcWhite,tsBold, info.Pkgs, ' pkgs');    // PKGS
  writeLn(tsDefault,fcLightBlue,'  /___|__\\_\\	',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,' \\         /	',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightBlue,'  \`-------´	',fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

// Fedora OS
procedure WriteFedora;
begin

  writeLn(tsDefault,fcWhite,    '        _____       ');
  writeLn(tsDefault,fcWhite,    '       /   __)',fcLightBlue,'\    '           ,fcLightRed,    ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcWhite,    '       |  /  ',fcLightBlue,'\ \   '           ,fcLightGreen,  ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightBlue,'    ___',fcWhite,'|  |',fcLightBlue,'__/ /   ',fcYellow,      ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightBlue,'   / ',fcWhite,'(_    _)',fcLightBlue,'_/    ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightBlue,'  / /  ',fcWhite,'|  |        '               ,fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightBlue,'  \ \',fcWhite,'__/  |        '               ,fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcLightBlue,'   \',fcWhite,'(_____/        '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

// Crystal OS
procedure WriteCrystal;
begin

  writeLn(tsDefault,fcMagenta,'           -//.   ');
  writeLn(tsDefault,fcMagenta,'         -//.     ',fcLightRed,     ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcMagenta,'       -//. .     ',fcLightGreen,   ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcMagenta,'     -//.  ''//-   ',fcYellow,      '󰏖 ',fcWhite,tsBold, info.Pkgs, ' pkgs');    // PKGS
  writeLn(tsDefault,fcMagenta,'    /+:      :+/  ',fcLightBlue,    ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcMagenta,'     .//''  .//.   ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcMagenta,'       . .//.     ',fcLightCyan,    '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcMagenta,'       .//.       '); // Call WriteBoxes to fill this area with coloured boxes
  writeLn(tsDefault,fcMagenta,'     .//.         ');
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

// Linux Mint
procedure WriteLinuxMint;
begin

  writeLn(tsDefault,fcLightGreen,'  _____________   ');
  writeLn(tsDefault,fcLightGreen,' |_            \  ',fcLightRed,     '󰣭 ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcLightGreen,'   |  ',fcWhite,'| _____  ',fcLightGreen,'|  ',fcLightGreen,   ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcLightGreen,'   |  ',fcWhite,'| | | |  ',fcLightGreen,'|  ',fcYellow,       ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcLightGreen,'   |  ',fcWhite,'| | | |  ',fcLightGreen,'|  ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcLightGreen,'   |  ',fcWhite,'\_____/  ',fcLightGreen,'|  ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcLightGreen,'   \___________/  ',fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 7th line down, and block/icon string '▄'

end;

// Generic
procedure WriteGeneric;
begin

  writeLn(tsDefault,fcWhite,'       .---.	  ');
  writeLn(tsDefault,fcWhite,'      /     \	  ',fcLightRed,     ' ',fcWhite,tsBold, info.OS);       // OS
  writeLn(tsDefault,fcWhite,'      \.@-@./	  ',fcLightGreen,   ' ',fcWhite,tsBold, info.Kernel);   // KERNEL
  writeLn(tsDefault,fcWhite,'      /`\_/`\	  ',fcYellow,       ' ',fcWhite,tsBold, info.HostName); // HOST
  writeLn(tsDefault,fcWhite,'     //  _  \\    ',fcLightBlue,   ' ',fcWhite,tsBold, info.Shell);    // SHELL
  writeLn(tsDefault,fcWhite,'    | \     )|_   ',fcLightMagenta,' ',fcWhite,tsBold, info.Uptime);   // UPTIME
  writeLn(tsDefault,fcWhite,'   /`\_`>  <_/ \  ',fcLightCyan,   '󰍛 ',fcWhite,tsBold, info.Memory);   // MEMORY
  writeLn(tsDefault,fcWhite,'   \__/''---''\__/ '); // Call WriteBoxes to fill this area with coloured boxes
  
  WriteBoxes(26,8,'▄'); //26 spaces across, 8th line down, and block/icon string '▄'

end;

end.


