$ErrorActionPreference = 'Stop';

$uninstallArgs = @{
    packageName    = 'heynote'
    softwareName   = 'Heynote*'
    fileType       = 'EXE'
    silentArgs     = '/S'
    validExitCodes = @(0)
}

[array]$key = Get-UninstallRegistryKey -SoftwareName $uninstallArgs['softwareName']

if ($key.Count -eq 1) {
    # electron-builder stores the uninstaller as '"C:\...\Uninstall Heynote.exe" /allusers'
    if ($key[0].UninstallString -match '^"([^"]+)"\s*(.*)$') {
        $uninstallArgs['file'] = $Matches[1]
        $uninstallArgs['silentArgs'] = "$($Matches[2]) /S".Trim()
    } else {
        $uninstallArgs['file'] = $key[0].UninstallString
    }

    Uninstall-ChocolateyPackage @uninstallArgs
} elseif ($key.Count -eq 0) {
    Write-Warning "$($uninstallArgs['packageName']) has already been uninstalled by other means."
} else {
    Write-Warning "$($key.Count) matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert the package maintainer that the following keys were matched:"
    $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}
