# Assumes PowerShell 7
$profile_dir = "$HOME\Documents\PowerShell"
if (-Not (Test-Path ($profile_dir))) {
    New-Item -ItemType "directory" -Path $profile_dir | Out-Null
}

Push-Location $profile_dir
try {
    New-Item -ItemType SymbolicLink -Name Microsoft.PowerShell_profile.ps1 -Target $HOME/dotfiles/powershell/Microsoft.PowerShell_profile.ps1 -ea Stop
    echo 'Linked Microsoft.PowerShell_profile.ps1'
} catch [Exception] {
    Write-Host 'Failed to link Microsoft.PowerShell_profile.ps1: ' -NoNewLine
    Write-Host $_.Exception.Message
}
Pop-Location

