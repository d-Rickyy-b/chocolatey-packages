# Rico's Chocolatey Packages

[![build](https://github.com/d-Rickyy-b/chocolatey-packages/actions/workflows/update.yml/badge.svg)](https://github.com/d-Rickyy-b/chocolatey-packages/actions/workflows/update.yml)

This repo holds all the chocolatey packages I created.

## Testing locally

Packages are updated automatically by [Chocolatey AU](https://github.com/chocolatey-community/chocolatey-au) via the [update workflow](.github/workflows/update.yml).
To check a change before pushing, install the tooling once and run `test_all.ps1` from the repository root on Windows:

```powershell
choco install chocolatey-au wormies-au-helpers -y

.\test_all.ps1                 # force-update and pack all packages
.\test_all.ps1 -Name heynote   # only one package
```

`test_all.ps1` forces an update of each package (downloads the latest release, recalculates checksums, runs `choco pack`) but never pushes anything.
It leaves the modified files and `.nupkg`s in your working tree, so reset them afterwards (e.g. `git checkout -- packages` and `git clean -fdX packages`).
Add `-ThrowOnErrors` to make it fail when any package errors.
