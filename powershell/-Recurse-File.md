This line retrieves all `.txt` files from the `labels` folder and all its subfolders:

```powershell
$labelFiles = Get-ChildItem -Path "labels" -Filter "*.txt" -Recurse -File
```

**Breaking it down:**

1. **`Get-ChildItem`** - PowerShell cmdlet to list files and folders
   - Like `ls` in Linux or `dir` in Command Prompt

2. **`-Path "labels"`** - Specifies which directory to search in
   - Looks in the `labels` folder

3. **`-Filter "*.txt"`** - Pattern to match files
   - `*` is a wildcard (matches anything)
   - Only gets files ending with `.txt`

4. **`-Recurse`** - Search **recursively** through all subdirectories
   - Without this, it only searches the top-level `labels` folder
   - With this, it searches `labels\`, `labels\subfolder1\`, `labels\subfolder2\`, etc.

5. **`-File`** - Only return files (exclude folders)

6. **`$labelFiles =`** - Store the results in a variable

**What it finds:**
```
labels/
  ├─ file1.txt        ✓ Found
  ├─ file2.doc        ✗ Skipped (not .txt)
  └─ subfolder/
      ├─ file3.txt    ✓ Found (because of -Recurse)
      └─ file4.txt    ✓ Found
```

**Result:** `$labelFiles` contains all `.txt` files from the `labels` directory tree.


Good question! `-Recurse` and `-File` serve **different purposes**:

**`-Recurse`** controls **WHERE** to search:
- **Without it:** Only searches the top-level `labels` folder
- **With it:** Searches `labels` and all its subfolders

**`-File`** controls **WHAT** to return:
- **Without it:** Returns both files AND folders
- **With it:** Returns only files (excludes folders)

**Why you need both:**

Without `-File`, you'd get folders too:

```powershell
$labelFiles = Get-ChildItem -Path "labels" -Filter "*.txt" -Recurse
```

**Result might include:**
```
labels\file1.txt              ← file ✓
labels\subfolder              ← folder ✗ (you probably don't want this)
labels\subfolder\file2.txt    ← file ✓
labels\another_folder         ← folder ✗
```

With `-File`, you only get files:

```powershell
$labelFiles = Get-ChildItem -Path "labels" -Filter "*.txt" -Recurse -File
```

**Result:**
```
labels\file1.txt              ← file ✓
labels\subfolder\file2.txt    ← file ✓
```

**Summary:**
- **`-Recurse`** = "Look in subfolders too"
- **`-File`** = "Only give me files, not folders"

They work together to give you exactly what you want: all `.txt` files from all levels of the directory tree, but no folder objects.