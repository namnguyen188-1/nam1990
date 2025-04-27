$proxyList = @()

for ($i = 1; $i -le 10; $i++) {
    $appName = "proxy-$i-app"
    try {
        flyctl apps restart $appName
        Write-Output "✅ Restart $appName thành công!"
        Start-Sleep -Seconds 5

        $appInfo = flyctl ips list -a $appName | Select-String "v4"
        if ($appInfo) {
            $ip = ($appInfo -split '\s+')[1]
            if ($ip) {
                $proxyList += "$ip:8888"
            }
        }
    } catch {
        Write-Output "❌ Lỗi khi restart hoặc lấy IP $appName!"
    }
}

$proxyList | Out-File -Encoding utf8 proxy_list.txt
Write-Output "✅ Đã xuất file proxy_list.txt mới hoàn chỉnh!"