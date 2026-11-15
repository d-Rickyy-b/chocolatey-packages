$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/creativeprojects/resticprofile/releases/download/v0.33.1/resticprofile_no_self_update_0.33.1_windows_386.tar.gz'
$checksum32 = '9167d162ed11058c7020d48bdd8aadb955d32cb473ac72324a6f2494bf4df07b'
$url64 = 'https://github.com/creativeprojects/resticprofile/releases/download/v0.33.1/resticprofile_no_self_update_0.33.1_windows_amd64.tar.gz'
$checksum64 = 'a11c4a14eaf06d807b90d9be43ff8872ac28b26b27979188f046dd037ea25cd7'

$installArgs = @{
    packageName    = 'resticprofile'
    unzipLocation  = $toolsDir
    url            = $url32
    checksumType   = 'sha256'
    checksum       = $checksum32
    url64bit       = $url64
    checksumType64 = 'sha256'
    checksum64     = $checksum64
}

# Upstream only ships the no_self_update build (self-update is left to Chocolatey) as .tar.gz,
# so the first extraction only yields the .tar, which has to be unpacked again
Install-ChocolateyZipPackage @installArgs

$tarFile = Get-ChildItem -Path $toolsDir -Filter '*.tar' | Select-Object -First 1
if (-not $tarFile) { throw "Extracted .tar archive not found in $toolsDir" }

Get-ChocolateyUnzip -FileFullPath $tarFile.FullName -Destination $toolsDir -PackageName 'resticprofile'
Remove-Item -Path $tarFile.FullName -Force
