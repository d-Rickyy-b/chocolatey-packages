$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.8.1/Heynote_2.8.1.exe'
$checksum = '94fb9f08e1f5ae7a372eb4060e0cd2918fbbe76dc7e29f74185eef9b55de162f'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
