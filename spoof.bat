@echo off
setlocal

set "WORKDIR=%~dp0"
set "sys32Dir=C:\Windows\System32"

if exist "%WORKDIR%hwid.sys" (
    copy /y "%WORKDIR%hwid.sys" "%sys32Dir%"
)

sc create freak binPath= "C:\Windows\System32\hwid.sys" DisplayName= "freak" start= boot tag= 2 type= kernel group= "System Reserved" >nul 2>&1
sc start freak

echo Press Enter to Restart Your PC
shutdown /r /t 0 /f

