# LED Control Project Installation Script

# Load the configuration variables from the config file
$configPath = Join-Path -Path $PSScriptRoot -ChildPath "config\projectConfig.cfg"
$config = Get-Content -Path $configPath | ConvertFrom-StringData

# Set the installation variables from the config
$pythonVersion = $config.PythonVersion

# Check if Chocolatey is installed
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Chocolatey is not installed. Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install Python using Chocolatey
Write-Host "Installing Python $pythonVersion..."
choco install python --version $pythonVersion -y

# Install Node.js using Chocolatey
Write-Host "Installing Node.js..."
choco install nodejs -y

# Install RPi.GPIO Python library
Write-Host "Installing RPi.GPIO Python library..."
pip install RPi.GPIO

Write-Host "Installation completed!"
