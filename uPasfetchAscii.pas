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

  write(fcLightBlue);
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

  write(fcLightCyan);
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

  write(fcLightBlue);
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

  write(fcWhite);
  writeLn('        _____');
  writeLn('       /   __)',fcLightBlue,'\   ');
  writeLn('       ',fcWhite,'|  /  ',fcLightBlue,'\ \ ');
  writeLn('    ___',fcWhite,'|  |',fcLightBlue,'__/ /  ');
  writeLn('   / ',fcLightBlue,'(_    _)',fcLightBlue,'_/   ');
  writeLn('  / /  ',fcWhite,'|  |       ');
  writeLn(fcLightBlue,'  \ \',fcWhite,'__/  |     ');
  writeLn(fcLightBlue,'   \',fcWhite,'(_____/      ');

end;

// Crystal OS
procedure WriteCrystal;
begin

  write(fcLightMagenta);
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

  write(fcWhite);
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
