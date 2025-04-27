# SCRIPT GET PROXY IP V3 - CHUẨN HÓA XUẤT FILE proxy_list.txt

# Kiểm tra login
try {
    $authInfo = flyctl auth whoami
    if ($authInfo -match "You are not logged in") {
        Write-Output "❌ Chưa đăng nhập Fly.io. Hãy chạy: flyctl auth login"
        exit
    }
    else {
        Write-Output "✅ Đã login Fly.io rồi, tiếp tục lấy IP..."
    }
}
catch {
    Write-Output "❌ Không kiểm tra được Fly.io. Hãy chắc chắn đã cài flyctl."
    exit
}

# Lấy IP
$proxyList = @()

for ($i = 1; $i -le 10; $i++) {
    $appName = "proxy-$i-app"

    try {
        $appInfo = flyctl ips list -a $appName | Select-String "v4"
        if ($appInfo) {
            $ip = ($appInfo -split '\s+')[1]
            if ($ip) {
                $proxyList += "$ip:8888"
                Write-Output "✅ Lấy IP $appName thành công: $ip:8888"
            }
        }
        else {
            Write-Output "❌ Không tìm thấy IP cho $appName."
        }
    }
    catch {
        Write-Output "❌ Lỗi lấy IP cho $appName!"
    }
}

# Ghi toàn bộ IP vào file proxy_list.txt
$proxyList | Out-File -Encoding utf8 proxy_list.txt

Write-Output "✅ Đã xuất file proxy_list.txt hoàn chỉnh!"