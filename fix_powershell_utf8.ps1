# SCRIPT TỰ ĐỘNG FIX POWERSELL UTF-8 (HIỆN ĐÚNG TIẾNG VIỆT)

# Set UTF-8 cho phiên PowerShell hiện tại
$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

Write-Output "Đã thiết lập PowerShell sử dụng UTF-8 thành công!"

# Hỏi có muốn set UTF-8 vĩnh viễn không
$setPermanent = Read-Host "Bạn có muốn thiết lập UTF-8 vĩnh viễn cho PowerShell? (y/N)"

if ($setPermanent -eq "y" -or $setPermanent -eq "Y") {
    $profilePath = $PROFILE
    if (-not (Test-Path $profilePath)) {
        New-Item -ItemType File -Path $profilePath -Force
    }
    Add-Content -Path $profilePath -Value '$PSDefaultParameterValues["Out-File:Encoding"] = "utf8"'
    Add-Content -Path $profilePath -Value '[Console]::OutputEncoding = [System.Text.Encoding]::UTF8'
    Write-Output "Đã thiết lập UTF-8 vĩnh viễn! (Cần mở PowerShell mới để áp dụng)"
} else {
    Write-Output "Đã thiết lập tạm thời cho phiên này."
}
