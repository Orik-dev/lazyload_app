@echo off
rem This file was created by pub v3.2.5.
rem Package: spider
rem Version: 4.2.2
rem Executable: spider
rem Script: spider
if exist "C:\Users\orxan\AppData\Local\Pub\Cache\global_packages\spider\bin\spider.dart-3.2.5.snapshot"                                                                                                                                                                         (
  call dart "C:\Users\orxan\AppData\Local\Pub\Cache\global_packages\spider\bin\spider.dart-3.2.5.snapshot"                                                                                                                                                                         %*
  rem The VM exits with code 253 if the snapshot version is out-of-date.
  rem If it is, we need to delete it and run "pub global" manually.
  if not errorlevel 253 (
    goto error
  )
  call dart pub global run spider:spider %*
) else (
  call dart pub global run spider:spider %*
)
goto eof
:error
exit /b %errorlevel%
:eof
