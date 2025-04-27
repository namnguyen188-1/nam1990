[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

function Show-Menu {
    Clear-Host
    Write-Host "===== MENU QUẢN LÝ PROXY =====" -ForegroundColor Cyan
    Write-Host "1. Deploy 10 Proxy (full_auto_10_proxy.ps1)"
    Write-Host "2. Restart & Get IP (restart_and_get_ip.ps1)"
    Write-Host "3. Get Proxy IP (get_proxy_ip_v2.ps1)"
    Write-Host "4. Check Proxy Status (check_proxy_status.ps1)"
    Write-Host "0. Thoát"
    Write-Host "=============================="
}

do {
    Show-Menu
    $choice = Read-Host "Nhập lựa chọn của bạn"

    switch ($choice) {
        "1" {
            Write-Host "➡ Đang chạy Deploy 10 Proxy..." -ForegroundColor Yellow
            .\full_auto_10_proxy.ps1
            Pause
        }
        "2" {
            Write-Host "➡ Đang chạy Restart và Get IP..." -ForegroundColor Yellow
            .\restart_and_get_ip.ps1
            Pause
        }
        "3" {
            Write-Host "➡ Đang chạy Get Proxy IP..." -ForegroundColor Yellow
            .\get_proxy_ip_v2.ps1
            Pause
        }
        "4" {
            Write-Host "➡ Đang chạy Check Proxy Status..." -ForegroundColor Yellow
            .\check_proxy_status.ps1
            Pause
        }
        "0" {
            Write-Host "✅ Thoát chương trình. Hẹn gặp lại!" -ForegroundColor Green
        }
        Default {
            Write-Host "❌ Lựa chọn không hợp lệ, thử lại!" -ForegroundColor Red
            Pause
        }
    }
} while ($choice -ne "0")