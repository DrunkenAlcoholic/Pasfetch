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


procedure WriteOSLogo(strOS: string);
begin
  if pos('Pop', strOS) <> 0 then
    // Write the popos logo
    WritePopOS
  else if pos('Solus', strOS) <> 0 then
    // Write the Solus logo
	WriteSolus
  else if pos('Arch', strOS) <> 0 then
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
  strTmp, strMemTotal, strMemFree, strBuffers, strCached,
  strSRclaimable: string; //strShmem removed for now
  intMemUsage, intTotalMem: single;
  slMemInfo: TStringList;
begin
  Result := 'Error';
  // Set the name of the file that will be read
  slMemInfo := TStringList.Create;
  try
    slMemInfo.LoadFromFile('/proc/meminfo');
    try
      // Process MemTotal
      strTmp := slMemInfo.Strings[0];
      strMemTotal := Trim(ExtractString(strTmp, 'MemTotal:', 'kB'));

      // Process MemFree
      strTmp := slMemInfo.Strings[1];
      strMemFree := Trim(ExtractString(strTmp, 'MemFree:', 'kB'));

      // Process Buffers
      strTmp := slMemInfo.Strings[3];
      strBuffers := Trim(ExtractString(strTmp, 'Buffers:', 'kB'));

      // Process Cached
      strTmp := slMemInfo.Strings[4];
      strCached := Trim(ExtractString(strTmp, 'Cached:', 'kB'));

      // Process Shmem ... Removed for now to match htop formnula
      //strTmp := slMemInfo.Strings[20];
      //strShmem := Trim(ExtractString(strTmp, 'Shmem:', 'kB'));

      // Process SReclaimable
      strTmp := slMemInfo.Strings[25];
      strSRclaimable := Trim(ExtractString(strTmp, 'SReclaimable:', 'kB'));

      // Calc Mem Total
      intTotalMem := StrToFloat(strMemTotal);

      // Calc Mem Usage
      intMemUsage := (intTotalMem - StrToFloat(strMemFree) - StrToFloat(strBuffers) - 
        StrToFloat(strCached) - StrToFloat(strSRclaimable));
    finally
      slMemInfo.Free;
    end;

  except
    on E: EInOutError do
      writeln('File handling error occurred. Details: ', E.Message);
  end;

  Result := Format('%.2fGB / %.2fGB', [intMemUsage / (1024 * 1024), intTotalMem / (1024 * 1024)]);
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

function GetShell(): String;
var
 strTemp: TStringArray;
 sTmp: String;
begin
  
  sTmp:= GetEnv('SHELL');
  
  // Quick and dirty way to parse $SHELL enviroment variable
  strTemp:= sTmp.Split('/');
  Result:= strTemp[High(strTemp)];
  
end;


// Get OS
function GetOS(): string;
var
  strOS, strTmp: string;
  slOS: TStringList;
  i: integer;
begin
  Result := 'Error';
  slOS := TStringList.Create;
  try
    slOS.LoadFromFile('/etc/os-release');
    try
      for i := 0 to pred(slOS.Count) do
      begin
        strTmp := slOS.Strings[i];
        if pos('NAME=', slOS.Strings[i]) = 1 then
        begin
          strOS := strTmp;
          Delete(strOS, 1, 5);
          strOS := StripChars(strOS, '"');
        end
        else if pos('_NAME="', slOS.Strings[i]) > 6 then
        begin
          strOS := strTmp;
          Delete(strOS, 1, 13);
          strOS := StripChars(strOS, '"');
        end;
      end;
    finally
      slOS.Free;
    end;
  except
    on E: EInOutError do
      writeln('File handling error occurred. Details: ', E.Message);
  end;
  Result := strOS;
end;

end.
