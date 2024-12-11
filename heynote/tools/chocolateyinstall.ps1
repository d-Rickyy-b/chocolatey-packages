$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/heyman/heynote/releases/download/v1.8.0/Heynote_1.8.0.exe'
$checksum = '1cb7542da7acceb1b25b9b487641a500ea97021d0693bfdf09ce0413e9a7923b'

$installArgs = @{
    packageName   = 'heynote'
    url           = $url
    checksumType  = 'sha256'
    checksum      = $checksum
    silentArgs    = "/ALLUSERS=0 /S"
}

Install-ChocolateyPackage @installArgs
