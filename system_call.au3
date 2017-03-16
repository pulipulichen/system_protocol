#include <Constants.au3>

$filename = ""
if $CmdLine[0] > 0 Then
    $filename = StringMid($CmdLine[1], 6, StringLen($CmdLine[1])-5)
	If StringMid($filename, StringLen($filename), StringLen($filename)-1) = "/" Then
	  ;MsgBox($MB_SYSTEMMODAL, "Debug",StringMid($p, StringLen($p), StringLen($p)-1))
	  $filename = StringMid($filename, 1, StringLen($filename)-1)
   EndIf
EndIf
$parameters = ""
For $i = 2 To $CmdLine[0]
   $p = $CmdLine[$i]
   If StringMid($p, StringLen($p), StringLen($p)-1) = "/" Then
	  ;MsgBox($MB_SYSTEMMODAL, "Debug",StringMid($p, StringLen($p), StringLen($p)-1))
	  $p = StringMid($p, 1, StringLen($p)-1)
   EndIf
   ;$p = StringMid($p, 0, StringLen($p))
   $parameters = $parameters & " " & $p
Next

$oSC = ObjCreate("ScriptControl")
$oSC.language = "Javascript"
$filename = StringReplace($filename, "\", "%5C")
$filename = StringReplace($filename, '"', "%22")
$filename = $oSC.eval("decodeURIComponent('" & $filename & "');")

$parameters = StringReplace($parameters, "\", "%5C")
$parameters = StringReplace($parameters, '"', "%22")
$parameters = $oSC.eval("decodeURIComponent('" & $parameters & "');")

;MsgBox($MB_SYSTEMMODAL, "Debug", '"' &$filename & '" ' & $parameters)
ShellExecute($filename, $parameters)