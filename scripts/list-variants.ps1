$ResumeVariants = Get-ChildItem content/doc-resume -Filter *.yaml -ErrorAction SilentlyContinue
$LetterVariants = Get-ChildItem content/doc-letter -Filter *.yaml -ErrorAction SilentlyContinue

if ($ResumeVariants.Count -eq 0) {
    Write-Host "`nNo resume variants found" -ForegroundColor Yellow
}
else {
    Write-Host "`nResume variants ($($ResumeVariants.Count)):" -ForegroundColor Blue
    $ResumeVariants | ForEach-Object {
        Write-Host "  - $($_.BaseName)" -NoNewline
        Write-Host "  ($([math]::Round($_.Length / 1KB, 1)) KB)" -ForegroundColor DarkGray
    }
}

if ($LetterVariants.Count -eq 0) {
    Write-Host "`nNo cover letter variants found" -ForegroundColor Yellow
}
else {
    Write-Host "`nLetter variants ($($LetterVariants.Count)):" -ForegroundColor Blue
    $LetterVariants | ForEach-Object {
        Write-Host "  - $($_.BaseName)" -NoNewline
        Write-Host "  ($([math]::Round($_.Length / 1KB, 1)) KB)" -ForegroundColor DarkGray
    }
}