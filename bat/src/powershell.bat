@echo off
:: Initialize conda
echo Initializing conda...
CALL "%USERPROFILE%\anaconda3\Scripts\activate.bat"
if errorlevel 1 (
    echo ERROR: Failed to initialize conda
    pause
    exit /b 1
)

:: Activate environment
echo Activating detectron2 environment...
call conda activate detectron2
if errorlevel 1 (
    echo ERROR: Failed to activate detectron2 environment
    echo Make sure the environment exists. You can check with: conda env list
    pause
    exit /b 1
)

:: Check if target directory exists
echo Checking target directory...
if not exist "C:\Users\qslia\Desktop\" (
    echo ERROR: Directory C:\Users\qslia\Desktop\ does not exist
    pause
    exit /b 1
)

:: Change directory
cd /d "C:\Users\qslia\Desktop\"
if errorlevel 1 (
    echo ERROR: Failed to change directory
    pause
    exit /b 1
)

echo Starting interactive session...
echo Type 'exit' to close this window when you're done.
cmd /k
