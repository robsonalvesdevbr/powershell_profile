# Importa o posh-git, se disponível
Import-Module -Name "$HOME\OneDrive\Documentos\PowerShell\ProfileParts\text-color-functions\text-color-functions.psm1"

if (Get-Module -ListAvailable posh-git) {
    Import-Module posh-git
} else {
    Set-TextColor -Text "Módulo posh-git não encontrado." -Color "Green"
}
