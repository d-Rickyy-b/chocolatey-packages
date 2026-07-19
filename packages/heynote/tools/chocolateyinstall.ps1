$ErrorActionPreference = 'Stop';
$url = 'https://github.com/heyman/heynote/releases/download/v2.9.1/Heynote_2.9.1.exe'
$checksum = '71695a55867c7ed32dcc7f3e7837f50c02f44fa2a9f79614f65bfc71ddd8cd82'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
