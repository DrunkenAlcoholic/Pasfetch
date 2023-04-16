unit uPasfetchUtils;

{$MODE OBJFPC}{$H+}{$J-}

interface

uses 
Classes, SysUtils, uPasfetchAscii, Dos;

// Public functions for Pasfetch
procedure WriteOSLogo(strOS: string);
function GetHostName(): string;
function GetRamUsage(): string;
function GetUptime(): string;
function GetOS(): string;
function GetKernel(): string;
function GetShell(): String;

  
implementation

//Compare OS out put and write logo
procedure WriteOSLogo(strOS: string);
begin
  if pos('Pop', strOS) <> 0 then
    // Write the popos logo
    WritePopOS
  else if pos('Solus', strOS) <> 0 then
   // Write the Solus logo
   WriteSolus
  else if ((pos('Arch', strOS) <> 0) or (pos('RebornOS', strOS) <> 0)) then
   // Write the arch logo
   WriteArch
  else if pos('Fedora', strOS) <> 0 then
   // Write the fedora logo
   WriteFedora
  else if pos('Crystal', strOS) <> 0 then
  // Write the fedora logo
   WriteCrystal
  else
    WriteGeneric;
end;

// Function to Extract a string between 2 strings
function ExtractString(StrSource, StrFirst, StrLast: string): string;
begin
  Result := Copy(StrSource, Pos(StrFirst, StrSource) + Length(StrFirst),
            Pos(StrLast, StrSource) - (Pos(StrFirst, StrSource) + Length(StrFirst)));
end;

// Function to remove all instants of a char from string
function StripChars(StrSource, StrRemove: string): string;
var 
  i: integer;
begin
  Result := StrSource;
  repeat
    i := pos(StrRemove, Result);
    if i > 0 then
      Delete(Result, i, 1);
  until pos(StrRemove, Result) = 0;
end;

//Get hostname
function GetHostName(): string;
var 
  strHostName: string;
  txtHostName: TextFile;
begin
  AssignFile(txtHostName, '/proc/sys/kernel/hostname');
  try
    Reset(txtHostName);
    ReadLn(txtHostName, strHostName);
  finally
    CloseFile(txtHostName);
  end;
  Result := strHostName;
end;

// Get Memory and usage
function GetRamUsage(): string;
var 
  iMemTotal, iMemFree, iMemAvailable, iBuffers, iCached, iReclaimable: integer;
  fltUsed, fltPercent : single;
  strMeminfo, strLine: string;
  txtMeminfo: TextFile;
begin
  Result := 'Error';
  strMeminfo := '';
  try
    AssignFile(txtMeminfo, '/proc/meminfo');
    try
      Reset(txtMeminfo);

      while not eof(txtMeminfo) do
        begin
          ReadLn(txtMeminfo, strLine);
          strMeminfo := strMeminfo + strLine;
        end;

      SScanf(strMeminfo,'MemTotal: %d kB'+
             'MemFree: %d kB'+
             'MemAvailable: %d kB'+
             'Buffers: %d kB'+
             'Cached: %d kB'+
             'SReclaimable: %d kB',
             [@iMemTotal, @iMemFree, @iMemAvailable, @iBuffers, @iCached, @iReclaimable]);
             
      // Calulate used and percentage       
      fltUsed:= (iMemTotal - iMemFree - iBuffers - iCached - iReclaimable);
      fltPercent:= ((fltUsed / iMemtotal) * 100);

    finally
      CloseFile(txtMeminfo);
    end;
  except
   on E: EInOutError do
    writeln('File handling error occurred. Details: ', E.Message);
  end;
    // Format and convert the result to GB
	Result := Format('%.2fGB / %.2fGB (%.2f%%)', [fltUsed / (1024 * 1024), iMemTotal / (1024 * 1024), fltPercent]);
end;

// Get uptime using GetTickCount64
function GetUptime(): string;
var 
  aDatetime: TDateTime;
begin
  aDatetime := (GetTickCount64 / SecsPerDay / MSecsPerSec);
  Result := Format('%d days, %s', [Trunc(aDatetime),
 	    FormatDateTime('hh:nn:ss', Frac(aDatetime))]);
end;

// Get Kernel
function GetKernel(): string;
var 
  strOSType, strOSRelease: string;
  txtOStype, txtOSRelease: TextFile;
begin
  AssignFile(txtOStype, '/proc/sys/kernel/ostype');
  AssignFile(txtOSRelease, '/proc/sys/kernel/osrelease');
  try
    Reset(txtOStype);
    Reset(txtOSRelease);

    ReadLn(txtOStype, strOSType);
    ReadLn(txtOSRelease, strOSRelease);

  finally
    CloseFile(txtOStype);
    CloseFile(txtOSRelease);
  end;
  Result := strOSType + '  ' + strOSRelease;
end;

// Get Shell enviroment variable
function GetShell(): String;
var 
  strTemp: TStringArray;
  sTmp: String;
begin
  sTmp := GetEnv('SHELL');
  // Quick and dirty way to parse $SHELL enviroment variable 
  // by splitting values with "/" and selecting the last value
  strTemp := sTmp.Split('/');
  Result := strTemp[High(strTemp)];
end;

// Get OS
function GetOS(): string;
var 
  strOS: string;
  slOS: TStringList;
  i: integer;
begin
  Result := 'Error';
  slOS := TStringList.Create;
  try
    slOS.LoadFromFile('/etc/os-release');
    try
      for i := 0 to pred(slOS.Count) do
        begin		          //"NAME=" <- Pos 1                "PRETTY_NAME=" <- pos 8
          if ((pos('NAME=', slOS.Strings[i]) = 1) or (pos('NAME=', slOS.Strings[i]) = 8))  then
            begin
              strOS := slOS.Strings[i];
              Delete(strOS, 1, pos('=', strOS));
              //you could gtfo now because we have what we came for, but if you want FANCY_NAME then continue..
              //Break; 
            end;
        end;
    finally
      slOS.Free;
    end;
  except
   on E: EInOutError do
    writeln('File handling error occurred. Details: ', E.Message);
  end;
  Result := StripChars(strOS, '"');
end;

end.
