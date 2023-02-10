unit uAnsiCrt;

{$MODE OBJFPC}{$H+}{$J-}

interface

const 
  // text styles
  tsResetAll     = #27'[0m';
  tsBold         = #27'[1m';
  tsDefault      = #27'[20m';
  // foreground colors
  fcBlack        = #27'[30m';
  fcRed          = #27'[31m';
  fcGreen        = #27'[32m';
  fcBrown        = #27'[33m';
  fcBlue         = #27'[34m';
  fcMagenta      = #27'[35m';
  fcCyan         = #27'[36m';
  fcLightGray    = #27'[37m';
  fcDefault      = #27'[39m';
  fcDarkGray     = #27'[90m';
  fcLightRed     = #27'[91m';
  fcLightGreen   = #27'[92m';
  fcYellow       = #27'[93m';
  fcLightBlue    = #27'[94m';
  fcLightMagenta = #27'[95m';
  fcLightCyan    = #27'[96m';
  fcWhite        = #27'[97m';

  // CRT's screen clearance
procedure ClrScr;

// CRT's cursor mode and positioning
procedure GotoXY(const X, Y: integer);

// helper functions
function int2Str(const int: integer): string;



implementation

function int2Str(const int: integer): string;
begin
  Str(int, result);
end;

procedure ClrScr;
begin
  write(#27'[2J'#27'[H');
end;

procedure GotoXY(const X, Y: integer);
begin
  write(#27'[',y,';',x,'H');
end;

end.
