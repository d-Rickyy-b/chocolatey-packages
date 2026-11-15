$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/creativeprojects/resticprofile/releases/download/v0.34.0/resticprofile_no_self_update_0.34.0_windows_386.tar.gz'
$checksum32 = '770718bffe110b2b7f495bf52f4f5cf6593d6061bb49bc471d593d81fa76620a'
$url64 = 'https://github.com/creativeprojects/resticprofile/releases/download/v0.34.0/resticprofile_no_self_update_0.34.0_windows_amd64.tar.gz'
$checksum64 = '9960e82809312f8a8f4a0f2eacf4bf7c393aa60504d218711543aa676afead98'

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
