# Full auto restart và get proxy IP
$proxyApps = @("proxy-1-app", "proxy-2-app", "proxy-3-app", "proxy-4-app", "proxy-5-app", "proxy-6-app", "proxy-7-app", "proxy-8-app", "proxy-9-app", "proxy-10-app")
foreach ($app in $proxyApps) {
    Write-Host "\n➡️ Restart $app"
    try {
        $machines = flyctl machines list --app $app --json | ConvertFrom-Json
        foreach ($machine in $machines) {
            flyctl machines restart $machine.ID --app $app
        }
    } catch {}
}
Start-Sleep -Seconds 10
$proxyList = ""
foreach ($app in $proxyApps) {
    try {
        $ips = flyctl ips list --app $app --json | ConvertFrom-Json
        $v4 = $ips | Where-Object { $_.Type -like '*v4*' } | Select-Object -ExpandProperty Address
        if ($v4) {
            $proxyList += "$v4:8888`n"
        }
    } catch {}
}
Set-Content -Path "proxy_list.txt" -Value $proxyList -Encoding UTF8
Write-Host "✅ Proxy list đã xuất ra proxy_list.txt"