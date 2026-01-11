$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/ayoisaiah/f2/releases/download/v2.2.2/f2_2.2.2_windows_386.zip'
$checksum32 = 'f34478584a1a143ab0feb76255acb72b381c269d94148dc721341261f0692a49'
$url64 = 'https://github.com/ayoisaiah/f2/releases/download/v2.2.2/f2_2.2.2_windows_amd64.zip'
$checksum64 = '64eba7ddbadeca9cd5657b344058311f3c42d342c5e88f93a68d8f07fb8d0a53'

$installArgs = @{
    packageName   = 'f2'
    unzipLocation = $toolsDir
    fileType      = 'ZIP'
    url           = $url32
    checksumType  = 'sha256'
    checksum      = $checksum32
    url64bit      = $url64
    checksumType64   = 'sha256'
    checksum64       = $checksum64
}

Install-ChocolateyZipPackage @installArgs
