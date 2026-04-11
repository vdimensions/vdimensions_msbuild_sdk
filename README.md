# VDimensions.MSBuild.Sdk

This project contains some useful MSBuild targets which address common needs across many different projects. Here are a few usecases:

## Sensible defaults to a number of MSBuild properties

`VDimensions.MSBuild.Sdk.Defaults` Introduces sensible defaults to MSBuild properties that are not being pre-initialized by the MSBuild.SDK. For details, check the package [readme file](src/Defaults/README.md)

## Improved Multi-targeting

`VDimensions.MSBuild.Sdk.Multitargeting` enables improved multi-targeting support in your code by providing you with a set of pre-processor symbols that allow you to identify the target framework version and flavour.  

The package introduces additional preprocessor definitions for improved netcore/netstandard/netframework version detection. For example:
- `NET35_OR_NEWER` pre-processor symbol would be available for all `.NetFramework` framework versions above version 3.5 (including). 
- `NETSTANDARD1_6_OR_NEWER` is available for `netstandard1.6` or above, __but also__ for all the `.NetFramework` versions compatible with this particular standard! Projects targeting .NET Framework 4.7.*, for example, would also receive the symbols for the respective .NETStandard they are compliant to.

## Solved pre-publishing caveats

Before publishing a new package out in the open, developers are advised to properly define their copyright notices and other metadata in their nuget package. Some of this information can also embedded in the compiled code binaries, and it is advised to do so.  

However, the package-related and binary-included information is managed by separate MSBuild properties, and most IDEs fail to properly align their values. To solve this, developers have to do that plumbing themsleves, but not everyone is familiar with MSBuild. One needs to know where and how these values are actually defined in the MSBuild syntax to set this important information correctly. At VDimensions, we believe that these efforts can be automated and simplified, and the MSBuild tooling allows for just this.  

The [VDimensions.MSBuild.Sdk.Copyright](src/Copyright/README.md) package, toghether with the [VDimensions.MSBuild.Sdk.Nuspec](src/Nuspec/README.md), which are both part of this project, solve aligning the metadata of packages and binaries, allowing for the [copyright] information, assembly, company and version match the values specified in the nuget package.
