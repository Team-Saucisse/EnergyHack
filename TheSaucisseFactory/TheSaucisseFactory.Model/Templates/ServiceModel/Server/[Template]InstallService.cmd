[%@ encoding name="iso-8859-1" %]
@echo off
rem [%=Producer.GetSignature()%]

if exist CodeFluent.Runtime.ServiceHost.exe goto install
if not exist "%CF_CURRENT_PATH%\CodeFluent.Runtime.ServiceHost.exe" goto copy2

copy "%CF_CURRENT_PATH%\CodeFluent.Runtime.ServiceHost.exe"
copy "%CF_CURRENT_PATH%\CodeFluent.Runtime.dll"
goto install:

:copy2
copy "%CF_SVCHOST%\CodeFluent.Runtime.ServiceHost.exe"
copy "%CF_SVCHOST%\CodeFluent.Runtime.dll"
goto install:

:install
rem NOTE: Change the following if you compile with Microsoft Visual Studio
copy "[%=Producer.ModelProducer.OutputName%]"
CodeFluent.Runtime.ServiceHost.exe /i /name:[%=Producer.Project.DefaultNamespace%] /displayName:"[%=Producer.Project.DefaultNamespace.Replace('.', ' ')%] Service" %1 %2 %3 %4 %5 %6 %7 %8 %9