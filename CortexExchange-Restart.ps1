# Load IIS module:
Import-Module WebAdministration

# Set a name of the site we want to recycle the pool for:
$site = "CortexExchange"

# Get pool name by the site name:
$pool = (Get-Item "IIS:\Sites\$site"| Select-Object applicationPool).applicationPool

Write-Host $pool
# Will pause to let you see the output
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host "Exiting Script"

# Recycle the application pool:
# Uncomment the line bellow to execute the app restart
#Restart-WebAppPool $pool