$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.11.0/RegionToShare.zip'
$fileChecksum = '47f08f0d27a50d656e6ba08320a6001c038ffe85ff1fdacc1ab28108fb3929e7'

$packageArgs = @{
    packageName    = 'regiontoshare'
    fileFullPath   = Join-Path $toolsDir 'RegionToShare.exe'
    url64bit       = $downloadUrl
    checksum64     = $fileChecksum
    checksumType64 = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
