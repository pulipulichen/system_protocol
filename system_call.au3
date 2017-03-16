#include <Constants.au3>

$filename = ""
if $CmdLine[0] > 0 Then
    $filename = StringMid($CmdLine[1], 6, StringLen($CmdLine[1])-4)
EndIf
$parameters = ""
For $i = 2 To $CmdLine[0]
	$parameters = $parameters & " " & $CmdLine[$i]
Next

;MsgBox($MB_SYSTEMMODAL, "Debug", $filename & " " & $parameters)
ShellExecute($filename, $parameters)