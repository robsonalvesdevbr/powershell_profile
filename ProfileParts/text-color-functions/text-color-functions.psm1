function Set-TextColor {
    param (
        [string]$Text = "Texto",
        [string]$Color = "Green"
    )

    if ($Color -eq "Red") {
        Write-Output "`e[31m$Text`e[0m"
    } elseif ($Color -eq "Green") {
        Write-Output "`e[32m$Text`e[0m"
    } elseif ($Color -eq "Yellow") {
        Write-Output "`e[33m$Text`e[0m"
    } elseif ($Color -eq "Blue") {
        Write-Output "`e[34m$Text`e[0m"
    } elseif ($Color -eq "Magenta") {
        Write-Output "`e[35m$Text`e[0m"
    } elseif ($Color -eq "Cyan") {
        Write-Output "`e[36m$Text`e[0m"
    } elseif ($Color -eq "White") {
        Write-Output "`e[37m$Text`e[0m"
    }
}

function Get-TextColorFunctions {
    Get-Command Set-TextColor
}

Export-ModuleMember -Function Set-TextColor