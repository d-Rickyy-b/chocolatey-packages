Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease ayoisaiah f2
    $URL32 = $LatestRelease.assets | Where-Object {$_.name -Match '_windows_(i?)386.zip'} | Select-Object -ExpandProperty browser_download_url
    $URL64 = $LatestRelease.assets | Where-Object {$_.name -Match '_windows_amd64.zip'} | Select-Object -ExpandProperty browser_download_url

    if (-not $URL32) { throw "32-bit asset not found in release $($LatestRelease.tag_name)" }
    if (-not $URL64) { throw "64-bit asset not found in release $($LatestRelease.tag_name)" }

    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL32   = $URL32
        URL64   = $URL64
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\`$url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\`$checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\`$url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\`$checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }

        "legal\verification.txt" = @{
            "(?i)(^\s*32-Bit:)(.*)" = "`$1 $($Latest.URL32)"
            "(?i)(^\s*64-Bit:)(.*)" = "`$1 $($Latest.URL64)"
            "(?i)(^\s*checksum32:)(.*)" = "`$1 $($Latest.Checksum32)"
            "(?i)(^\s*checksum64:)(.*)" = "`$1 $($Latest.Checksum64)"
        }
    }
}

Update-Package -NoReadme