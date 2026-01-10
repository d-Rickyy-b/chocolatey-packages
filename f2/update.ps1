Import-Module au

function global:au_GetLatest {
    $response = Invoke-WebRequest "https://api.github.com/repos/ayoisaiah/f2/releases"
    $releases = $response | ConvertFrom-Json
    $latest_release = $releases | Where-Object {$_.prerelease -eq $false} | Select-Object -First 1

    $version = $latest_release.tag_name.TrimStart("v")

    foreach ($asset in $latest_release.assets) {
        $windows_asset_32 = $asset | Where-Object name -Match '_windows_(i?)386.zip'
        $windows_asset_64 = $asset | Where-Object name -Match '_windows_amd64.zip'
        if ($windows_asset_32) {
            $download_url_32 = $windows_asset_32.browser_download_url
        }
        if ($windows_asset_64) {
            $download_url_64 = $windows_asset_64.browser_download_url
        }
        Write-Output $windows_asset_32
        Write-Output $windows_asset_64
    }
    
    return @{
        Version = $version
        URL32   = $download_url_32
        URL64   = $download_url_64
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

update