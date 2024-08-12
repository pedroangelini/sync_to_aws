@echo off
setlocal
set from=%1
set to=%2
:: chec args
IF "%1"=="" GOTO err
IF "%1"=="--help" GOTO err
IF "%2"=="" GOTO err

:: read .env file
FOR /F "tokens=*" %%i in ('type .env') do SET %%i

IF "%AWS_ACCESS_KEY%"=="" GOTO err
IF "%AWS_SECRET_ACCESS_KEY%"=="" GOTO err

:: all checks complete, let's sync
echo === new session == from %from%, to %to% >> sync_log.log
echo start rclone sync from %from%, to %to% >> sync_log.log
::rclone sync -v --dry-run --log-file=sync_log.log %from% %to%
rclone sync -v --log-file=sync_log.log %from% %to% 
echo completed ok
GOTO end

:err
echo usage: sync_aws.bat <from> <to>
echo expects to have a .env file containing the AWS key and secret in the format:
echo AWS_ACCESS_KEY=...
echo AWS_SECRET_ACCESS_KEY=...
exit /b 1

:end
endlocal
exit /b 0
