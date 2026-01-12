@echo off

set hlsd_js="%~dp0..\..\hls-proxy\bin\hlsd.js"

if defined verbosity_level (
  set hlsd_opts=%hlsd_opts% -v %verbosity_level%
)

bare %hlsd_bare_opts% %hlsd_js% %hlsd_opts%

if not %ERRORLEVEL% EQU 0 (
  echo.
  pause
)
