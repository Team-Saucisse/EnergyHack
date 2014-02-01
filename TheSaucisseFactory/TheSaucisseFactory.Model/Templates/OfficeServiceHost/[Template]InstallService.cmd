[%@ encoding name="iso-8859-1" %]
@echo off
rem [%=Producer.GetSignature()%]

CodeFluent.Runtime.ServiceHost.exe /i /name:[%=Producer.Project.DefaultNamespace%].OfficeHost /displayName:"[%=Producer.Project.DefaultNamespace.Replace('.', ' ')%] Office Host Service" %1 %2 %3 %4 %5 %6 %7 %8 %9