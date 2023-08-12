$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url32 = 'https://github.com/ayoisaiah/f2/releases/download/v1.9.1/f2_1.9.1_windows_386.tar.gz'
$checksum32 = '92bc9b00d88356c26b947b9a75b87bdb751385665c606e70ce31c49459612fb1'
$url64 = 'https://github.com/ayoisaiah/f2/releases/download/v1.9.1/f2_1.9.1_windows_amd64.tar.gz'
$checksum64 = '5c4a3d825c7fb4d371d3fb8e0b987868b07b279047c507ebef1c1cc6c59e9469'

$installArgs = @{
    packageName   = 'f2'
    unzipLocation = $toolsDir
    fileType      = 'GZIP'
    url           = $url32
    checksumType  = 'sha256'
    checksum      = $checksum32
    url64bit      = $url64
    checksumType64   = 'sha256'
    checksum64       = $checksum64
}

Install-ChocolateyZipPackage @installArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\
