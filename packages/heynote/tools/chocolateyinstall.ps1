$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.9.0/Heynote_2.9.0.exe'
$checksum = '993e827850950789f8e74a02ec1354cc4d130a1af2e63277f21aa6d3c376219a'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
