for ($i = 1; $i -le 10; $i++) {
    $appName = "proxy-$i-app"
    $folderName = "proxy-$i"

    if (-not (Test-Path $folderName)) {
        Copy-Item -Recurse -Force proxy-template $folderName
    }

    (Get-Content "$folderName\fly.toml") -replace 'app = ".*"', "app = `"$appName`"" | Set-Content "$folderName\fly.toml"

    Set-Location $folderName
    flyctl launch --name $appName --copy-config --remote-only --no-deploy --yes
    flyctl deploy --remote-only
    Set-Location ..
}