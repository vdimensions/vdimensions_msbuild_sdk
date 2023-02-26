# VDimensions.MSBuild.Sdk.ExternalAnnotations

According to the [JetBrains.Annotations](https://www.jetbrains.com/help/resharper/Code_Analysis__External_Annotations.html#distributing), consumers of a library may provided its own `$(AssemblyName).ExternalAnnotations.xml` alongside the referenced binary, whcich will enable useful compiler hints for users of the JetBrains Resharper extension for VisualStuduio or their own Rider IDE.  

This package provides support for embedding this `$(AssemblyName).ExternalAnnotations.xml` file in the nuget package of your library.  

## How this package works

The package supports separate `ExternalAnnotations.xml` per TFM, because it is designed to support multi-targeting projects (typically libraries). Developers are required to maintain a separate ExternalAnnotations file per TFM, in the form of `ExternalAnnotations.$(TargetFramework).xml`. The file must be located in the root of the project structure. Referencing the `VDimensions.MSBuild.Sdk.ExternalAnnotations` package will take care for automatically embedding each external annotations xml file in the _appropriate place_ within nuget package file. This means, that for each TFM, the `ExternalAnnotations.$(TargetFramework).xml` will be embedded as `lib\$(TargetFramework)\$(AssemblyName).ExternalAnnotations.xml`, as per JetBrains documentation.  

__NOTE__  
The package is not responsible for producing the `ExternalAnnotations.xml` itself, it only takes care for properly embedding it into a nuget package while respecting the multi-targeting paradigm.  
It is expected that the package authors will produce the `ExternalAnnotations.xml` either manually, or with the help of other tools.  
