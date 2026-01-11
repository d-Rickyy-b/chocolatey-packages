Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease ayoisaiah f2

    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL32   = $LatestRelease.assets | Where-Object {$_.name -Match '_windows_(i?)386.zip'} | Select-Object -ExpandProperty browser_download_url
        URL64   = $LatestRelease.assets | Where-Object {$_.name -Match '_windows_amd64.zip'} | Select-Object -ExpandProperty browser_download_url
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
    }
}

update -NoReadme