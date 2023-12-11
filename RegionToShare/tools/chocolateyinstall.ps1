$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.8.0/RegionToShare.zip'
$fileChecksum = '34499e2c20c8bc31089925866c29831cef716b174dcab0d8a5323f75f7044108'

$installArgs = @{
    packageName   = 'regiontoshare'
    unzipLocation = $toolsDir
    fileType      = 'zip'
    url           = $downloadUrl
    checksum      = $fileChecksum
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @installArgs
