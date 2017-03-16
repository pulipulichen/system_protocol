#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

$sFilePath = "system_protocol.reg"

If FileExists($sFilePath) Then
   FileDelete($sFilePath)
EndIf

Local $hFileOpen = FileOpen($sFilePath, $FO_APPEND + $FO_ANSI )
If $hFileOpen = -1 Then
	 MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the file: " & $sFilePath)
	 Return False
EndIf

$dir = StringReplace(@ScriptDir, "\", "\\")


FileWrite($hFileOpen, "Windows Registry Editor Version 5.00" & @CRLF)

FileWrite($hFileOpen, "[HKEY_CLASSES_ROOT\sp]" & @CRLF)
FileWrite($hFileOpen, '@="URL:System Protocol"' & @CRLF)
FileWrite($hFileOpen, '"URL Protocol"=""' & @CRLF)

FileWrite($hFileOpen, '[HKEY_CLASSES_ROOT\sp\DefaultIcon]' & @CRLF)
FileWrite($hFileOpen, '@="' & $dir &  '\\system_call.exe"' & @CRLF)

FileWrite($hFileOpen, "[HKEY_CLASSES_ROOT\sp\shell]" & @CRLF)
FileWrite($hFileOpen, '@=""' & @CRLF)

FileWrite($hFileOpen, "[HKEY_CLASSES_ROOT\sp\shell\open]" & @CRLF)
FileWrite($hFileOpen, '@=""' & @CRLF)

FileWrite($hFileOpen, "[HKEY_CLASSES_ROOT\sp\shell\open\command]" & @CRLF)
FileWrite($hFileOpen, '@="' & $dir &  '\\system_call.exe %1"' & @CRLF)

FileClose($hFileOpen)

ShellExecuteWait($sFilePath)
FileDelete($sFilePath)