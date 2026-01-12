Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease tom-englert RegionToShare
     
    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL32   = $LatestRelease.assets | Where-Object {$_.name -Match 'RegionToShare.zip'} | Select-Object -ExpandProperty browser_download_url
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\`$downloadUrl\s*=\s*)('.*')"  = "`$1'$($Latest.URL32)'"
            "(?i)(^\`$fileChecksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }

        "legal\verification.txt" = @{
            "(?i)(^\s*32-Bit:)(.*)" = "`$1 $($Latest.URL32)"
            "(?i)(^\s*checksum32:)(.*)" = "`$1 $($Latest.Checksum32)"
        }
    }
}

Update-Package