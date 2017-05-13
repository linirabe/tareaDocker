@echo off
docker-machine start
docker-machine ip > hostname.txt
set /p REN_RT_EXTERNAL_IP=<hostname.txt
del hostname.txt
echo Host-ip: %REN_RT_EXTERNAL_IP%
FOR /f "tokens=*" %%i IN ('docker-machine env') DO %%i
call docker build -t webserver .
ping localhost -n 10 >nul
docker run --name webserver -d -p 8080:8080 webserver
ping localhost -n 10 >nul
start http://192.168.99.100:8080/WSEsferaCliente/index.jsp
ping localhost -n 10 >nul
