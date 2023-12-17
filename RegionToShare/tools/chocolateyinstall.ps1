$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.9.0/RegionToShare.zip'
$fileChecksum = 'dc41c02734d668077a9f91bb859740dc6b0baeae0342a32f55b63dc9fad2fbc8'

$installArgs = @{
    packageName   = 'regiontoshare'
    unzipLocation = $toolsDir
    fileType      = 'zip'
    url           = $downloadUrl
    checksum      = $fileChecksum
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @installArgs
