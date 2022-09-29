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

implementation


// Arch Linux Logo
procedure WriteArch;
begin

  TextColor(LightBlue);
  writeLn('       /\\       ');
  writeLn('      /  \\      ');
  writeLn('     /\\  \\     ');
  writeLn('    /      \\    ');
  writeLn('   /   ,,   \\   ');
  writeLn('  /   |  |  -\\  ');
  writeLn(' /__-''    ''-__\\ ');

end;

// PopOS Logo
procedure WritePopOS;
begin

  TextColor(Cyan);
  writeLn(' ______               ');
  writeLn(' \   _ \        __    ');
  writeLn('  \ \ \ \      / /    ');
  writeLn('   \ \_\ \    / /     ');
  writeLn('    \  ___\  /_/      ');
  writeLn('     \ \    _         ');
  writeLn('    __\_\__(_)_       ');
  writeLn('   (___________)      ');

end;

//Solus OS
procedure WriteSolus;
begin

  TextColor(LightBlue);
  writeLn(' 				');
  writeLn('     /|		');
  writeLn('    / |\\		');
  writeLn('   /  | \\ _	');
  writeLn('  /___|__\\_\\	');
  writeLn(' \\         /	');
  writeLn('  \`-------´	');

end;

// Fedora OS
procedure WriteFedora;
begin

  TextColor(White);
  writeLn('        _____');
  writeLn('       /   __)',#27'[94m','\   ');
  writeLn('       ',#27'[97m','|  /  ',#27'[94m','\ \ ');
  writeLn('    ___',#27'[97m','|  |',#27'[94m','__/ /  ');
  writeLn('   / ',#27'[97m','(_    _)',#27'[94m','_/   ');
  writeLn('  / /  ',#27'[97m','|  |       ');
  writeLn(#27'[94m','  \ \',#27'[97m','__/  |     ');
  writeLn(#27'[94m','   \',#27'[97m','(_____/      ');

end;

// Crystal OS
procedure WriteCrystal;
begin

  TextColor(Magenta);
  writeLn('           -//.     ');
  writeLn('         -//.       ');
  writeLn('       -//. .       ');
  writeLn('     -//.  ''//-     ');
  writeLn('    /+:      :+/    ');
  writeLn('     .//''  .//.     ');
  writeLn('       . .//.       ');
  writeLn('       .//.         ');
  writeLn('     .//.    ');

end;

// Generic
procedure WriteGeneric;
begin

  TextColor(White);
  writeLn('       .---.		');
  writeLn('      /     \		');
  writeLn('      \.@-@./		');
  writeLn('      /`\_/`\		');
  writeLn('     //  _  \\	');
  writeLn('    | \     )|_	');
  writeLn('   /`\_`>  <_/ \	');
  writeLn('   \__/''---''\__/	');

end;

end.
