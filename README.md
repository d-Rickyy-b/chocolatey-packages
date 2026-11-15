# Rico's Chocolatey Packages

[![build](https://github.com/d-Rickyy-b/chocolatey-packages/actions/workflows/update.yml/badge.svg)](https://github.com/d-Rickyy-b/chocolatey-packages/actions/workflows/update.yml)

This repo holds all the chocolatey packages I created.

## Forcing a resubmit

To push a package again without a new upstream release, run the [update workflow](.github/workflows/update.yml) manually (Actions → Update check → Run workflow) and pick the package in `force_package`.
By default AU pushes a fix version with the date appended (e.g. `1.12.0` → `1.12.0.20261114`).
If you also fill in `force_version` (e.g. `1.12.0`), exactly that version is pushed instead of the generated fix version, which is useful to re-upload a version that is stuck in moderation.
`force_version` is ignored when `force_package` is `none`.

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
