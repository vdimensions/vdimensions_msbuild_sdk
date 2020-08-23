# VDimensions.MSBuild.Sdk.Defaults

Introduces various defaults to MSBuild properties that are often originally unset.
The defaults are described in the table below:

|Property|Default Value|Condition|
|--|--|--|
|`Configuration`|`Debug`|is not set|
|`Platform`|`AnyCPU`|is not set|
|`PlatformTarget`|`AnyCPU`|is not set|
|`OutputPath`|`bin\$(Configuration)`|is not set|
|`RootNamespace`|`$(AssemblyName)`|is not set and `$(AssemblyName) !== ''`|
|`AssemblyVersion`|`$(Version)`|is not set and `$(Version) !== ''`|
|`AssemblyFileVersion`|`$(Version)`|is not set and `$(Version) !== ''`|
|`AssemblyInformationalVersion`|`$(Version)`|is not set and `$(Version) !== ''`|
