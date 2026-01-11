$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.7.1/Heynote_2.7.1.exe'
$checksum = 'e5f4169f6082824806dbb155525622e963cc89a07e07ea4c5cda2a14126e08cc'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
