This project contains MSBuild targets that will provide easier support for multi-targeting .NET projects that use the new MS.NET Sdk. 

* `src/MultitargetingFrameworkSupport.targets`   
  - automatically detects and defines framework monikers based on the selected build target framework version
  - provides MSBuild properties relevant for the curret target framework
