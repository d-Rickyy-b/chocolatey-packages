$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.10/RegionToShare.zip'
$fileChecksum = '79d19915cf6305429ae668bafc01d9ea85ff50a9ca596770431b75109bd65a63'

$installArgs = @{
    packageName   = 'regiontoshare'
    unzipLocation = $toolsDir
    fileType      = 'zip'
    url           = $downloadUrl
    checksum      = $fileChecksum
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @installArgs
