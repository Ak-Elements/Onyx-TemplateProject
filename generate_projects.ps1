# Define variables
$sourceDir = $PSScriptRoot  # The directory where the script is located (assuming it's the source root)
$buildDir = Join-Path $sourceDir "build"  # The output directory for the VS solution
$generator = "Visual Studio 17 2022"  # Generator name for VS2022

if (-not (Get-Command cmake -ErrorAction SilentlyContinue))
{
    Write-Host "Error: CMake is not installed or not in the system PATH." -ForegroundColor Red
    exit 1
}

# Ensure build directory exists
if (!(Test-Path $buildDir)) {
    New-Item -ItemType Directory -Path $buildDir | Out-Null
}

# Run CMake
Write-Host "Running CMake to generate Visual Studio 2022 solution..."
cmake -S "`"$sourceDir`"" -B "`"$buildDir`"" -G "`"$generator`"" -D "ONYX_BUILD_EDITOR=ON"

# Check if CMake succeeded
if ($LASTEXITCODE -eq 0) {
    Write-Host "CMake completed successfully. Solution is in '$buildDir'."
} else {
    Write-Host "CMake encountered an error!" -ForegroundColor Red
    exit $LASTEXITCODE
}