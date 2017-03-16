@echo off
setlocal ENABLEDELAYEDEXPANSION
set str=%1
call :strlen result str
REM echo %result%


set start=6
set end=%result%
set /a end-=1
REM echo %end%
set str=!str:~%start%,%end%!


REM set str=%1
REM set str=%str: =" "%
set str=%str:/"="%
REM set str="%str%


REM %str%

echo %str%
SET /p exit=Press any key to exit

goto :eof



:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    set "s=!%~2!#"
    set "len=0"
    for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
        if "!s:~%%P,1!" NEQ "" ( 
            set /a "len+=%%P"
            set "s=!s:~%%P!"
        )
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)
