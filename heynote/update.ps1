Import-Module au

function global:au_GetLatest {
    $response = Invoke-WebRequest "https://api.github.com/repos/heyman/heynote/releases"
    $releases = $response | ConvertFrom-Json
    $latest_release = $releases | Where-Object {$_.prerelease -eq $false} | Select-Object -First 1

    $version = $latest_release.tag_name.TrimStart("v")

    foreach ($asset in $latest_release.assets) {
        $windows_asset = $asset | Where-Object name -Match 'Heynote_\d+\.\d+\.\d+\.exe'
        $download_url = $windows_asset.browser_download_url
    }
    
    return @{
        Version = $version
        URL   = $download_url
    }
}

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\`$url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\`$checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
    }
}

update