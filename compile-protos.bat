@echo off
cls

set PROTOC_PATH=d:\LinuxShared\Workspace\GLOBAL\Binaries\protobuf-3.3.x\binaries64\Release\

if exist cpp/ rmdir /s /q cpp
mkdir cpp

for /r protos\ %%i in (*.proto) do copy /-y %%i cpp\ > nul
cd cpp
for %%i in (*.proto) do (
	%PROTOC_PATH%\protoc.exe -I="." --cpp_out="." "%%i"
)
del /q *.proto

echo DONE!
pause
