@echo Off
SETLOCAL
SET VERSION=0.1
SET NUGET=build\nuget.exe

set config=%1
if "%config%" == "" (
   set config=Debug
)

%WINDIR%\Microsoft.NET\Framework\v4.0.30319\msbuild build.proj /p:Configuration="%config%" /m /v:M /fl /flp:LogFile=msbuild.log;Verbosity=Normal /nr:false

mkdir artifacts

.\build\nuget.exe pack src\Code52.i18n\NuSpec\Code52.i18n.nuspec -BasePath src\Code52.i18n\NuSpec\ -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC3\NuSpec\Code52.i18n.MVC3.nuspec -BasePath src\Code52.i18n.MVC3\NuSpec\ -OutputDirectory artifacts
.\build\nuget.exe pack src\Code52.i18n.MVC4\NuSpec\Code52.i18n.MVC4.nuspec -BasePath src\Code52.i18n.MVC4\NuSpec\ -OutputDirectory artifacts