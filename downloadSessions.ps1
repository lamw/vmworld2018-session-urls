$sessionsToDownloadFile = "us.txt"

$lines = Get-Content -Path $sessionsToDownloadFile | Where-Object { $_.Trim() -ne '' }

$headers = @{"referer" = "http://www.vmware.com"}

foreach ($line in $lines) {
    ($title,$url) = $line -split "#"
    $title = $title.replace("`:",'')
    $title = $title.replace("`'",'')
    $title = $title.trim()
    $title = $title + ".mp4"
    Write-Host "Downloading $title ..."
    Invoke-WebRequest -Uri $url -Headers $headers -Outfile $url
}


