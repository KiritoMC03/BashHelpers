@echo off

set /p NewVal=EnterNewCommand
set sl=;

for /F "tokens=3" %%A in ('reg query HKCR\Directory\Background\shell\Custom /v SubCommands') DO (set startedValue=%%A)

echo %startedValue%

REG ADD HKCR\Directory\Background\shell\Custom /v SubCommands /t REG_SZ /d %startedValue%%sl%%NewVal% /f

pause