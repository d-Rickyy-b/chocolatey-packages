$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.7.2/Heynote_2.7.2.exe'
$checksum = 'b3e1e6e881c9a497a814aac905ea573401262193dfcb4fa6653f1aa41239c925'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
