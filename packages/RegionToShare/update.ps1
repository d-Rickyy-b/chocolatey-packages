Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease tom-englert RegionToShare
     
    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL64   = $LatestRelease.assets | Where-Object {$_.name -Match '^RegionToShare\.exe$'} | Select-Object -ExpandProperty browser_download_url
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\`$downloadUrl\s*=\s*)('.*')"  = "`$1'$($Latest.URL64)'"
            "(?i)(^\`$fileChecksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }

        "legal\verification.txt" = @{
            "(?i)(^\s*64-Bit:)(.*)" = "`$1 $($Latest.URL64)"
            "(?i)(^\s*checksum64:)(.*)" = "`$1 $($Latest.Checksum64)"
        }
    }
}

Update-Package