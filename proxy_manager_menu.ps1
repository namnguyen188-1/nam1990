Write-Host "===== Fly Proxy Manager ====="
Write-Host "1. Launch lại các app mất"
Write-Host "2. Full Auto Redeploy + Get IP"
Write-Host "3. Get IP proxy hiện tại"
Write-Host "0. Thoát"
$choice = Read-Host "Nhập lựa chọn"

switch ($choice) {
    "1" { ./auto_launch_missing_proxy.ps1 }
    "2" { ./full_auto_redeploy_after_launch.ps1 }
    "3" { ./get_proxy_ip_superfix.ps1 }
    "0" { exit }
    default { Write-Host "Sai lựa chọn!" }
}