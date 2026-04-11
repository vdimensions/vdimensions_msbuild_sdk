# VDimensions.MSBuild.Sdk.Copyright

Ensures that the assembly copyright information that is built into the output dll files is aligned with the copyright information of the package and the project in general.

## The Problem

MSBuild uses separate properties to express this infomation:

|Property|Purpose|
|-|-|
|`$(Authors)`|Authors of the package, part of the nuget package properties|
|`$(Company)`|The company that produces the binaries, part of the nuget package properties|
|`$(AssemblyCompany)`|Embedded in the binary output of the project|
|`$(AssemblyCopyright)`|Embedded in the binary output of the project, expresses a copyright notice|

It is up to the developer to specify each these, and most people often overlook them. There is also no sensible fallback if you for example define `$(Company)`, and expect that `$(AssemblyCompany)` assumes the same value, to MSBuild those are separate properties. So, not only those are not easily defineable, but also developers have to know what is the purpose of each properties and to provide all of them in the end.  

## The Solution

This package adds MSBuild targets that would align these 4 properties in the following way:

- Unless explicitly set, `$(Company)` will assume the value of `$(Authors)`
- Unless explicitly set, `$(AssemblyCompany)` will assume the value of `$(Company)`. This will take into account the previous step, so if both `$(Company)` and `$(AssemblyCompany)` were not defined, they will now assume the value of `$(Authors)`

In addition to the above rules, this package will auto-evaluate `$(AssemblyCopyright)` if not provided by your project as follows.

1. First, it will evaluate the current year. This happens during the build phase of your project, so it is the real-time year of your build. This will be stored in a `$(CopyrightYearCurrent)` property.
2. It will look for a `$(CopyrightYearSince)` property - that is a custom property that package authors might want to include, but it is completely optional.
3. Evaluates a temporary `$(_CopyrightYear)` property that looks like this:
  - `$(CopyrightYearSince)-$(CopyrightYearCurrent)` if both properties are present
  - `$(CopyrightYearCurrent)` if `$(CopyrightYearSince)` was not set. Remember, that `$(CopyrightYearCurrent)` is automatically evaluated, but package authors could specify it by hand to prevent the auto-generation.
4. Combines the other copyright metadata into a single copyright notice expression, that takes the following form:  
  `Copyright © $(Company) $(_CopyrightYear)`

## Examples

### Authors only

|Property|Value|
|-|-|
|`$(Authors)`|MyGreatCompany|
|`$(CopyrightYearCurrent)`|2026 (at the time of writing this document)|

__Result__

|Property|Purpose|
|-|-|
|`$(Authors)`|MyGreatCompany|
|`$(Company)`|MyGreatCompany|
|`$(AssemblyCompany)`|MyGreatCompany|
|`$(AssemblyCopyright)`|Copyright © MyGreatCompany 2026|

### Authors and year since

|Property|Value|
|-|-|
|`$(Authors)`|MyGreatCompany|
|`$(CopyrightYearSince)`|2010 (at the time of writing this document)|
|`$(CopyrightYearCurrent)`|2026 (at the time of writing this document)|

__Result__

|Property|Purpose|
|-|-|
|`$(Authors)`|MyGreatCompany|
|`$(Company)`|MyGreatCompany|
|`$(AssemblyCompany)`|MyGreatCompany|
|`$(AssemblyCopyright)`|Copyright © MyGreatCompany 2010-2026|

### Authors, company and year since

|Property|Value|
|-|-|
|`$(Authors)`|MyGreatCompany|
|`$(Company)`|MyGreatCompany inc.|
|`$(CopyrightYearSince)`|2010 (at the time of writing this document)|
|`$(CopyrightYearCurrent)`|2026 (at the time of writing this document)|

__Result__

|Property|Purpose|
|-|-|
|`$(Authors)`|MyGreatCompany|
|`$(Company)`|MyGreatCompany inc.|
|`$(AssemblyCompany)`|MyGreatCompany inc.|
|`$(AssemblyCopyright)`|Copyright © MyGreatCompany inc. 2010-2026|