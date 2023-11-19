$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.7/RegionToShare.zip'
$fileChecksum = '8ee110b38bbf8a95b662ae7f772e82e3f4a648aa55e75e3297f3abb07919d9d1'

$installArgs = @{
    packageName   = 'regiontoshare'
    unzipLocation = $toolsDir
    fileType      = 'zip'
    url           = $downloadUrl
    checksum      = $fileChecksum
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @installArgs
