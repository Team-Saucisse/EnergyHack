[%@ encoding name="iso-8859-1" %]
[%@ reference name="CodeFluent.Producers.Documentation.dll"%]
[%@ namespace name="CodeFluent.Producers.Documentation" %]
[%@ namespace name="System.IO" %]
@echo off
rem [%=Producer.GetSignature()%]
[%DocumentationProducer documentationProducer = (DocumentationProducer)(Producer.SubProducers[typeof(DocumentationProducer)].Instance);%]


rem CD [%=documentationProducer.PortableTargetDirectory%]
[% if (documentationProducer.SandcastleCompilerToolPath != "%DXROOT%") { %]SET DXROOT=[%=documentationProducer.SandcastleCompilerToolPath%][% } %]
SET PATH=%windir%\Microsoft.NET\Framework\v2.0.50727;%DXROOT%\ProductionTools;%PATH%
SET TOOLSPATH=%ProgramFiles%
if exist "%ProgramFiles% (x86)" set TOOLSPATH=%ProgramFiles(x86)%
SET PATH=[%=documentationProducer.ChmCompilerToolPath%];%TOOLSPATH%\HTML Help Workshop;%TOOLSPATH%\Microsoft Help 2.0 SDK;%PATH%
rem remove previous directories
if exist output rmdir output /s /q
if exist chm rmdir chm /s /q

rem get the generated xml comment file
copy /y "[%=documentationProducer.RelativeGeneratedDocumentationFilePath%]" comments.xml
if not %errorlevel% == 0 goto err1
rem extract information by reflection
"MrefBuilder.exe" "[%=documentationProducer.RelativeOutputName%]" [% {
		bool firstReference = true;
		foreach(string referencedAssembly in Producer.ReferencedAssemblies)
		{
			if(firstReference)
			{
			 %]/dep:"[%=referencedAssembly%]"[%
			}
			else
			{
			 %],"[%=referencedAssembly%]"[%
			}
			firstReference = false;
		}
	} %] /out:reflection.org  /internal- /config:MRefBuilder.config

rem apply transform to reflexion data
"XslTransform.exe" /xsl:"%DXROOT%\ProductionTransforms\ApplyVSDocModel.xsl" reflection.org /xsl:"%DXROOT%\ProductionTransforms\AddFriendlyFilenames.xsl" /out:reflection.xml /arg:IncludeAllMembersTopic=true /arg:IncludeInheritedOverloadTopics=true
rem produce the list of topics
"XslTransform.exe" /xsl:"%DXROOT%\ProductionTransforms\ReflectionToManifest.xsl"  reflection.xml /out:manifest.xml
rem copy files to output dir
call "%DXROOT%\Presentation\vs2005\copyOutput.bat"
rem generate a TOC
"XslTransform.exe"  /xsl:"%DXROOT%\ProductionTransforms\createvstoc.xsl" reflection.xml /out:toc.xml 
rem generate HTML
"BuildAssembler.exe" /config:BuildAssembler.config manifest.xml
[% if (documentationProducer.MustCompileChmFile) { %]
rem generate CHM project
if not exist chm mkdir chm
if not exist chm\html mkdir chm\html
if not exist chm\icons mkdir chm\icons
if not exist chm\scripts mkdir chm\scripts
if not exist chm\styles mkdir chm\styles
rem copy html in chm project
xcopy output\icons\* chm\icons\ /y /r
xcopy output\scripts\* chm\scripts\ /y /r
xcopy output\styles\* chm\styles\ /y /r


"ChmBuilder.exe" /project:[%=Producer.Project.DefaultNamespace%] /config:ChmBuilder.config /html:Output\html /lcid:1033 /toc:Toc.xml /out:Chm

rem No suport for locale
rem "DBCSFix.exe" /d:Chm /l:1033 

"hhc" chm\[%=Producer.Project.DefaultNamespace%].hhp
goto end:
:err1

echo.
echo *** ERROR: cannot find .XML documentation file "[%=documentationProducer.RelativeGeneratedDocumentationFilePath%]".
echo  Make sure you have compiled the project with XML documentation file option turned on.
echo  Also make sure the BOM project has the 'outputName' attribute set to the corresponding output assembly name.
echo.

:end

[% } %]
