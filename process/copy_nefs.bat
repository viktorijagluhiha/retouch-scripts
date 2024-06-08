@echo off
set file=selection.txt
set prefix=DSC_
set extension=.NEF
echo V. Gluhih production
for /F "usebackq eol=| delims=" %%A in ("%file%") do (
  echo %~dp0DSC_%%~nxA\%prefix%%%~nxA%extension%
  if not exist "%~dp0%prefix%%%~nxA" (
    mkdir "%~dp0%prefix%%%~nxA"
    copy "%~dp0..\%prefix%%%~nxA%extension%" "%~dp0%prefix%%%~nxA\%prefix%%%~nxA%extension%"
  ) else echo.        Already exists.
)
