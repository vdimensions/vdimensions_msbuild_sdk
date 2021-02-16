# Why this folder?

This folder exists for the following purposes:

- Make it easy to include its entire sub-structure in a nuget package via wildcards

- Prevent MSBuild from treating each TFM (target framework moniker) folder as an indicator to which TFMs the entire package is suitable for.
  If placed directly under the root, the TFM name folders will cause MSBuild to believe that
  only those TFMs are being supported by the package, which defeats its idea.
