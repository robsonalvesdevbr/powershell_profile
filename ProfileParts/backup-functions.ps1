Import-Module -Name "$HOME\OneDrive\Documentos\PowerShell\ProfileParts\text-color-functions"

function Start-BackupFunctions {
    # $backupFolder = "$backupPath\$date"
    # if (-not (Test-Path $backupFolder)) {
    #     New-Item -ItemType Directory -Path $backupFolder
    # }
    param (
        [string]$Type = "default"
    )
 
    if (Get-Command rclone -ErrorAction SilentlyContinue) {
        if ($Type.ToLower() -eq "books") {
            Start-BackupLivrosFunctions
        } elseif ($Type.ToLower() -eq "all") {
            Start-BackupGeralFunctions
        } else {
            Start-BackupLivrosFunctions
            Start-BackupGeralFunctions
        }
        # Write-Output "Backup finalizado" -NoNewline -ForegroundColor White -BackgroundColor DarkGreen
    } else {
        Set-TextColor -Text "Rclone não encontrado. Instale antes de continuar." -Color "red"
    }
}

function Start-BackupLivrosFunctions {    
    Set-TextColor -Text ">>> Backup Bisync Livros" -Color "Blue"
    rclone bisync origem_local:C:\ gdrive_robsonalves:/robson/backup/ `
    --filters-file C:\Apps\rclone\filter-files-bisync-gdrive.txt `
    --log-file C:\Apps\rclone\logs\filter-files-bisync-gdrive.log `
    --log-level INFO `
    --workdir C:\Apps\rclone\dados-bisync `
    --check-first `
    --checksum `
    --conflict-resolve path1 `
    --force `
#  --resync
#  --dry-run

    $date = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    Set-TextColor -Text ">>> Backup Bisync Livros finalizado - $date" -Color "Green"
}

function Start-BackupGeralFunctions {
    Set-TextColor -Text "`n>>> Backup Sync Geral" -Color "Blue"
    rclone sync `
    --filter-from C:\Apps\rclone\filter-files-gdrive.txt `
    origem_local:C:\ `
    gdrive_robsonalves:/robson/backup/ `
    --check-first `
    --checksum `
    --delete-after `
    --fix-case `
    --delete-excluded `
    --transfers=10 `
    --progress `
    --log-file=C:\Apps\rclone\logs\logfile-filter-gdrive_robsonalves.log `
    --log-level=INFO `
    --stats=30s `
    --use-server-modtime `
    --fast-list `
#  --dry-run

    $date = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    Set-TextColor -Text ">>> Backup Sync Geral finalizado - $date" -Color "Green"
}