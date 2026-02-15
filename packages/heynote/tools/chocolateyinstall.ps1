$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.8.2/Heynote_2.8.2.exe'
$checksum = 'be58acadf31999c64967f6dc9c0774b947d0b23c682e21f2fb47a196b11a4c1a'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
