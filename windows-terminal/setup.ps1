Push-Location $env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
try {
    New-Item -ItemType HardLink -Name settings.json -Target $HOME/dotfiles/windows-terminal/settings.json -ea Stop
    echo 'Linked settings.json (Windows Terminal)'
} catch [Exception] {
    Write-Host 'Failed to link settings.json (Windows Terminal): ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location
