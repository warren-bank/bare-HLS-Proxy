@echo off

rem :: --------------------------------------------------------------------------
rem :: https://github.com/holepunchto/bare#usage
rem :: --------------------------------------------------------------------------

set hlsd_bare_opts=%hlsd_bare_opts% --inspect

call "%~dp0..\[http, port 8080].bat"
