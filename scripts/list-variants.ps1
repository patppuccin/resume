$Variants = Get-ChildItem content -Filter *.yaml 

if ($Variants.Count -eq 0) {
    Write-Host "No variants found" -ForegroundColor Yellow
    Exit 1
}

Write-Host "Found $($Variants.Count) variants:" -ForegroundColor Blue
$Variants | ForEach-Object {
    Write-Host "  - $($_.BaseName)" -NoNewline
    Write-Host "  ($([math]::Round($_.Length / 1KB, 1)) KB)" -ForegroundColor DarkGray
}