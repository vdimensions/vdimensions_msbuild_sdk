rm -rf dist/*.nupkg

cd src/Defaults
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../

cd src/Copyright
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../

cd src/Versioning
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../

cd src/Versioning.AppVeyor
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../

cd src/Multitargeting 
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../

cd src/Nuspec
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../

cd src/ExternalAnnotations
dotnet pack -p:VersionPrefix=$1 -p:VersionSuffix=$2
cd ../../