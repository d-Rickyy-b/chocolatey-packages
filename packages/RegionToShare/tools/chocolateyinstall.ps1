$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.12.0/RegionToShare.exe'
$fileChecksum = 'ed46a0a905645e16bef8b3136a968152f022620a40691d384abd5335131ceefa'

$packageArgs = @{
    packageName    = 'regiontoshare'
    fileFullPath   = Join-Path $toolsDir 'RegionToShare.exe'
    url64bit       = $downloadUrl
    checksum64     = $fileChecksum
    checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

# Mark the exe as a GUI app so its shim doesn't block the console
New-Item -Path "$($packageArgs.fileFullPath).gui" -ItemType File -Force | Out-Null
