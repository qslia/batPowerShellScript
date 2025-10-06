The difference is in how PowerShell **expands variables** inside strings:

```powershell
# Line 5 - WON'T work correctly
$files | ForEach-Object { Write-Host "  - $_.Name" -ForegroundColor Cyan}

# Line 6 - WILL work correctly  
$files | ForEach-Object { Write-Host "  - $($_.Name)" -ForegroundColor Cyan}
```

**The Issue:**

**Line 5:** `"$_.Name"` 
- PowerShell sees `$_` followed by `.Name`
- It interprets this as a variable literally named `$_.Name` (which doesn't exist)
- **Output:** `  - .Name` (just prints the text ".Name")

**Line 6:** `"$($_.Name)"`
- The `$()` is a **subexpression** that tells PowerShell to evaluate what's inside
- It correctly accesses the `.Name` property of the `$_` object
- **Output:** `  - file.txt` (prints the actual filename)

**The Rule:**
When you need to access **properties** or **methods** of a variable inside a string, or perform any expression/calculation, wrap it in `$(...)`:

```powershell
# Properties/Methods - NEED $()
"File: $($file.Name)"
"Length: $($file.Length)"
"Date: $($file.LastWriteTime.ToString())"

# Simple variables - DON'T need $()
"Counter: $counter"
"Path: $path"
```

**Bottom line:** Line 6 is the correct version. Line 5 won't display the filenames properly.