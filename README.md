# VDimensions.MSBuild.Sdk

This project contains some useful MSBuild targets which address common needs across many different projects. Here are a few:

- Introducing sensible defaults to MSBuild properties that are not being pre-initialized by the MSBuild.SDK. For details, check [VDimensions.MSBuild.Sdk.Defaults](src/Defaults/readme.md)

- Improved multi-targeting support  

  Introduces additional preprocessor definitions for improved netstandard/netframework version detection. For example `NET35_OR_NEWER` would be available for all `.NetFramework` framework versions above version 3.5 (including). Similarly, the `NETSTANDARD1_6_OR_NEWER` is available for `netstandard1.6` or above, as well as for the `.NetFramework` versions compatible with this particular standard. So, for instance projects targeting .NET Framework 4.7.* would also define the respective standard-version-or-newer symbols.
