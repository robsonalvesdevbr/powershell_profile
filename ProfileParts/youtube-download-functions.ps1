function Start-DownloadYoutubeFunctions {
    param (
        [string]$Uri = ""
    )

    Set-TextColor -Text ">>> Download Youtube" -Color "Blue"
    # youtube-dl -f bestvideo+bestaudio --merge-output-format mp4 --write-thumbnail --embed-thumbnail --add-metadata --write-info-json --write-description --write-annotations --write-sub --all-subs --sub-format srt --convert-subs srt --embed-subs --download-archive C:\Apps\youtube-dl\archive.txt --output "C:\Apps\youtube-dl\%(title)s.%(ext)s" --batch-file C:\Apps\youtube-dl\download.txt
    yt-dlp -f "bestvideo[height<=1080]+bestaudio/best" $Uri
    $date = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    Set-TextColor -Text ">>> Download Youtube finalizado - $date" -Color "Green"
}