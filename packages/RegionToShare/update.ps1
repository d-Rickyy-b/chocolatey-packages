Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease tom-englert RegionToShare
    $URL64 = $LatestRelease.assets | Where-Object {$_.name -Match '^RegionToShare\.exe$'} | Select-Object -ExpandProperty browser_download_url

    if (-not $URL64) { throw "64-bit asset not found in release $($LatestRelease.tag_name)" }

    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL64   = $URL64
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

Update-Package -ChecksumFor 64