$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$downloadUrl = 'https://github.com/tom-englert/RegionToShare/releases/download/1.11.0/RegionToShare.zip'
$fileChecksum = '47f08f0d27a50d656e6ba08320a6001c038ffe85ff1fdacc1ab28108fb3929e7'

$installArgs = @{
    packageName   = 'regiontoshare'
    unzipLocation = $toolsDir
    fileType      = 'zip'
    url           = $downloadUrl
    checksum      = $fileChecksum
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @installArgs
