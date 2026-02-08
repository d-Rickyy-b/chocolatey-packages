$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.8.0/Heynote_2.8.0.exe'
$checksum = 'c0aea9295f95d781159da455e488db016af8e1594213cd49e6c098f9e2195f64'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
