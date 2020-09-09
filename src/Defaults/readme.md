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
|`PackageVersion`|`$(Version)`|is not set and `$(Version) !== ''`|

I addition, the current package defines the `UNSAFE` preprocessor directive automatically in case the `AllowUnsafeBlocks` setting is enabled for the importing project, which MSBuild does not do by default.  
This allows a developer to wrap `unsafe` code in `#if UNSAFE`/`#endif` preprocessor directives and play only with the `AllowUnsafeBlocks` flag in different build scenarios.  

For example, if we want to disable unsafe code for `.NETStandard1.0`, we could add the following code to our project file:

    <Choose>
      <When Condition=" '$(TargetFramework)' == 'netstandard1.0' ">
        <PropertyGroup>
          <AllowUnsafeBlocks></AllowUnsafeBlocks>
        </PropertyGroup>
      </When>
      <Otherwise>
        <PropertyGroup>
          <AllowUnsafeBlocks>true</AllowUnsafeBlocks>
        </PropertyGroup>
      </Otherwise>
    </Choose>

As a result the `UNSAFE` symbol will not be added to the `DefineConstants` property when `netstandard1.0` is being targeted, and any code inside an `#if UNSAFE`/`#endif` block will be skipped by the compiler for that particular platform.  
