@echo off

set openssl_HOME=C:\PortableApps\OpenSSL\1.1.0
set PATH=%openssl_HOME%;%PATH%

cd /D "%~dp0.."

if exist "cert.pem" (
  openssl x509 -in cert.pem -noout -text
)

echo.
pause
