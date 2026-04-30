param(
    [string]$CodexHome = $env:CODEX_HOME
)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoRoot = Split-Path -Parent $ScriptDir
$SourceSkills = Join-Path $RepoRoot "skills"

if (-not (Test-Path -LiteralPath $SourceSkills)) {
    throw "Cannot find skills directory: $SourceSkills"
}

if ([string]::IsNullOrWhiteSpace($CodexHome)) {
    $CodexHome = Join-Path $HOME ".codex"
}

$TargetSkills = Join-Path $CodexHome "skills"
New-Item -ItemType Directory -Path $TargetSkills -Force | Out-Null
$TargetSkillsFull = [System.IO.Path]::GetFullPath($TargetSkills)

Get-ChildItem -LiteralPath $SourceSkills -Directory | Sort-Object Name | ForEach-Object {
    $Target = Join-Path $TargetSkills $_.Name
    $TargetFull = [System.IO.Path]::GetFullPath($Target)
    if (-not $TargetFull.StartsWith($TargetSkillsFull, [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Refusing to install outside target skills directory: $TargetFull"
    }
    if (Test-Path -LiteralPath $Target) {
        Remove-Item -LiteralPath $Target -Recurse -Force
    }
    Copy-Item -LiteralPath $_.FullName -Destination $Target -Recurse
    Write-Host "Installed skill: $($_.Name)"
}

Write-Host "Installed Tungskills into $TargetSkills"
