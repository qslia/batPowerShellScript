$files = Get-ChildItem -Path . -File | Sort-Object Name

if ($files.Count -eq 0) {
	Write-Host "No files found to rename." -ForegroundColor Yellow
	exit
}

Write-Host "Found $($files.Count) files to rename:" -ForegroundColor Green
$files | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Cyan}

$confirmation = Read-Host "`nDo you want to proceed with renaming? (y/N)"
if ($confirmation -ne 'y' -and $confirmation -ne 'Y') {
	Write-Host "Operation cancelled." -ForegroundColor Yellow
	exit
}
$counter = 1
foreach ($file in $files) {
	$extension = $file.Extension
	$newName = "$counter$extension"

	if ((Test-Path $newName) -and ($newName -ne $file.Name)) {
		Write-Host "Warning: $newName already exists, skipping $($file.Name)" - ForegroundColor Yellow
		continue
	}
	try {
		Rename-Item -Path $file.FullName -NewName $newName
		Write-Host "Renamed: $($file.Name) -> $newName" -ForegroundColor Green
		$counter++
	
	} catch {
		Write-Host "Error renaming $($file.Name): $($_.Exception.Message)" -ForegroundColor Red
	}
	
}
Write-Host "`nRenaming completed!" -ForegroundColor Green
Write-Host "Total files renamed: $($counter - 1)" -ForegroundColor Cyan

