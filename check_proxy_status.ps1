$proxies = Get-Content "./proxy_list.txt"
$results = @()

foreach ($proxy in $proxies) {
    try {
        $split = $proxy -split ":"
        $ip = $split[0]
        $port = $split[1]

        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $asyncResult = $tcpClient.BeginConnect($ip, [int]$port, $null, $null)
        $waitHandle = $asyncResult.AsyncWaitHandle
        if ($waitHandle.WaitOne(3000, $false)) {
            $tcpClient.EndConnect($asyncResult)
            $tcpClient.Close()
            $results += "$proxy ONLINE ✅"
        } else {
            $results += "$proxy OFFLINE ❌"
        }
    } catch {
        $results += "$proxy OFFLINE ❌"
    }
}

$results | Out-File -Encoding utf8 proxy_status.txt
Write-Output "✅ Đã check xong proxy, xem file proxy_status.txt"