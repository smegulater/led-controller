# LED Control Project Deployment Script

# Load the configuration variables from the config file
$configPath = Join-Path -Path $PSScriptRoot -ChildPath "config\projectConfig.cfg"
$config = Get-Content -Path $configPath | ConvertFrom-StringData

# Set the deployment variables from the config
$piHost = $config.PiHost
$piUsername = $config.PiUsername
$piPath = $config.PiPath

# Build your project (if needed)
Write-Host "Building the project..."
# Add the commands to build your project here

# Deploy to the Raspberry Pi
Write-Host "Deploying to the Raspberry Pi..."
Copy-Item -Path $PSScriptRoot\* -Destination "\\$piHost\$piPath" -Recurse -Force

# Restart services on the Raspberry Pi (e.g., LED Python service and web server)
Write-Host "Restarting services on the Raspberry Pi..."
ssh $piUsername@$piHost "sudo systemctl restart led_service && sudo systemctl restart led_web_server"

Write-Host "Deployment completed!"
