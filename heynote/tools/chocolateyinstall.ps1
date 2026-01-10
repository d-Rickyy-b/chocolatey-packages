$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.7.1/Heynote_2.7.1.exe'
$checksum = ''

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
