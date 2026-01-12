@echo off

set BARE_HOME=C:\PortableApps\bare.js\1.25.0
set PATH=%BARE_HOME%;%PATH%

call "%~dp0..\..\..\..\.recipes\00. generic use cases\%~nx0"
