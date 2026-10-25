Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease heyman heynote
    $URL32 = $LatestRelease.assets | Where-Object {$_.name -Match 'Heynote_\d+\.\d+\.\d+\.exe$'} | Select-Object -ExpandProperty browser_download_url

    if (-not $URL32) { throw "Installer asset not found in release $($LatestRelease.tag_name)" }

    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL32   = $URL32
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\`$url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\`$checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }

        "legal\verification.txt" = @{
            "(?i)(^\s*32-Bit:)(.*)" = "`$1 $($Latest.URL32)"
            "(?i)(^\s*checksum32:)(.*)" = "`$1 $($Latest.Checksum32)"
        }
    }
}

Update-Package -NoReadme