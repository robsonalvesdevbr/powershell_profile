Import-Module -Name "$HOME\OneDrive\Documentos\PowerShell\ProfileParts\text-color-functions\text-color-functions.psm1"

function Get-SSHHosts {
    $configPath = Join-Path $HOME ".ssh\config"
    if (Test-Path $configPath) {
        (findstr "^Host " $configPath) |
            ForEach-Object {
                $_ -replace "^Host\s+", ""
            }
    } else {
        Set-TextColor -Text "O arquivo $configPath não foi encontrado." -Color "Red"
        
    }
}
