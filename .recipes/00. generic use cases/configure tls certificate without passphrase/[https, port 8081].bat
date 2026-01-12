@echo off

set hlsd_opts=%hlsd_opts% --tls-cert "%~dp0.\cert\cert.pem"
set hlsd_opts=%hlsd_opts% --tls-key  "%~dp0.\cert\key.pem"

call "%~dp0..\%~nx0"
