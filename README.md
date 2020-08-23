This project contains some useful MSBuild targets which address common needs across many different projects. Here are a few:

* Introducing some sensible defaults to a fiew MSBuild properties that are not being pre-initialized by the MSBuild.SDK. For details, check [VDimensions.MSBuild.Sdk.Defaults](src/Defaults/readme.md)

* Improved multi-targeting support  

  Introduces additional preprocessor definitions for improved netstandard/netframework version detection. For example `NET35_OR_NEWER` would be available for all `.NetFramework` framework versions above version 3.5 (including). Similarly, the `NETSTANDARD1_6_OR_NEWER` is available for `netstandard1.6` or above, as well as for the `.NetFranework` versions compatible with this particular standard. So, for insance projects targeting .NET Framework 4.7.* would also define the respective stadnard-version-or-newer monikers.


* Consistent versioning across builds  

  Multi-targeting projects in fact trigger a separate build for each target specified. If automatic version number generation is used, each bould output could end up with slightly different version number than the preceding ones, and they would likely not match the nuget package version number as well. This issue is addressed by providing the version numbers in a persistent manner for all build phases, thus elliminating the inconsistency.


* A useful set of pre-defined project metadata properties which one does not need to define in each `.csproj`/`.fsproj`/`.vbproj` file.

