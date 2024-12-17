Import-Module -Name "$HOME\OneDrive\Documentos\PowerShell\ProfileParts\text-color-functions\text-color-functions.psm1"

# Definição do tema do Starship
$ENV:STARSHIP_CONFIG = "$HOME\.config\gruvbox-rainbow.toml"

function Invoke-Starship-TransientFunction {
    &starship module character
}

# Inicializa o Starship, se instalado
if (Get-Command starship -ErrorAction SilentlyContinue) {
    Invoke-Expression (&starship init powershell)
} else {
    Set-TextColor -Text "Starship não encontrado. Instale antes de continuar." -Color "Red"
}

# Habilita prompt transitório, se disponível
if (Get-Command Enable-TransientPrompt -ErrorAction SilentlyContinue) {
    Enable-TransientPrompt
} else {
    Set-TextColor -Text "Transient Prompt não está disponível." -Color "Red"
}