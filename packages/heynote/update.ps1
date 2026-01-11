Import-Module Chocolatey-AU

function global:au_GetLatest {
    $LatestRelease = Get-GitHubRelease heyman heynote
     
    return @{
        Version = $LatestRelease.tag_name.TrimStart("v")
        URL32   = $LatestRelease.assets | Where-Object {$_.name -Match 'Heynote_\d+\.\d+\.\d+\.exe$'} | Select-Object -ExpandProperty browser_download_url
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\`$url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(?i)(^\`$checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

update -NoReadme