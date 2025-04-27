# Auto Launch Proxy 5-10 nếu mất
$proxyApps = @("proxy-5-app", "proxy-6-app", "proxy-7-app", "proxy-8-app", "proxy-9-app", "proxy-10-app")
foreach ($app in $proxyApps) {
    Write-Host "\n➡️ Launch $app" -ForegroundColor Cyan
    try {
        $exists = flyctl apps list --json | ConvertFrom-Json | Where-Object { $_.Name -eq $app }
        if (-not $exists) {
            flyctl launch --name $app --region hkg --org personal --now --copy-config --detach
        } else {
            Write-Host "✅ $app đã tồn tại, bỏ qua." -ForegroundColor Green
        }
    } catch { Write-Host "❌ Lỗi tạo $app" }
}
Write-Host "\n🎯 Xong auto launch!" -ForegroundColor Green