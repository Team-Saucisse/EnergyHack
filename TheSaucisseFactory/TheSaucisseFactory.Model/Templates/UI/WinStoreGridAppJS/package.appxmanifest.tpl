<?xml version="1.0" encoding="utf-8"?>
<Package xmlns="http://schemas.microsoft.com/appx/2010/manifest">

  <Identity
    Name="[%=Producer.Project.PermanentModelId.ToString()%]"
    Version="1.0.0.0"
    Publisher="CN=[%=System.Environment.UserName%]" />

  <Properties>
    <DisplayName>[%=Producer.WindowsStoreAppNamespace%]</DisplayName>
    <PublisherDisplayName>[%=System.Environment.UserName%]</PublisherDisplayName>
    <Logo>images\storelogo.png</Logo>
  </Properties>

  <Prerequisites>
    <OSMinVersion>6.2.0</OSMinVersion>
    <OSMaxVersionTested>6.2.0</OSMaxVersionTested>
  </Prerequisites>

  <Resources>
    <Resource Language="x-generate" />
  </Resources>

  <Applications>
    <Application 
      Id="App"
      StartPage="default.html">

      <VisualElements
        DisplayName="[%=Producer.WindowsStoreAppNamespace%]"
        Logo="images\logo.png"
        SmallLogo="images\smalllogo.png"
        Description="[%=Producer.WindowsStoreAppNamespace%]"
        ForegroundText="light"
        BackgroundColor="[%=Producer.AppBackgroundColor%]">

        <DefaultTile ShowName="allLogos" />
        <SplashScreen Image="images\splashscreen.png" />

      </VisualElements>
    </Application>
  </Applications>

  <Capabilities>
    <Capability Name="internetClient" />
  </Capabilities>

</Package>
