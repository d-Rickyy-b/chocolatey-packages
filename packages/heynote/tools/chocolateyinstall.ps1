$ErrorActionPreference = 'Stop';
$url64 = 'https://github.com/heyman/heynote/releases/download/v2.9.1/Heynote_2.9.1.exe'
$checksum64 = '71695a55867c7ed32dcc7f3e7837f50c02f44fa2a9f79614f65bfc71ddd8cd82'

$installArgs = @{
    packageName    = 'heynote'
    softwareName   = 'Heynote*'
    fileType       = 'EXE'
    url64bit       = $url64
    checksumType64 = 'sha256'
    checksum64     = $checksum64
    silentArgs     = '/S /allusers'
    validExitCodes = @(0)
}

Install-ChocolateyPackage @installArgs
