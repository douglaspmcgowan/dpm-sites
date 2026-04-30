#requires -Version 5.1
<#
.SYNOPSIS
Refreshes data/project-status.json with the latest GitHub pushed_at timestamps for tracked repos, then commits and pushes the update when the JSON changed.

.SCHEDULE
Example Task Scheduler registration:
  $scriptPath = "C:\Users\dougl\My Drive (douglaspmcgowan@gmail.com)\UC Berkeley\Research\Claude Research Folder\dpm-sites\scripts\update-project-status.ps1"
  $action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""
  $trigger = New-ScheduledTaskTrigger -Daily -At 8:00AM
  Register-ScheduledTask -TaskName "DPM Project Status Refresh" -Action $action -Trigger $trigger -Description "Refresh dpm-sites project status and push changes"
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = (Resolve-Path (Join-Path $scriptDir "..")).Path
$dataPath = Join-Path $repoRoot "data\project-status.json"
$relativeDataPath = "data/project-status.json"
$headers = @{
  "User-Agent" = "dpm-sites-project-status-updater"
  "Accept" = "application/vnd.github+json"
}

if (-not (Test-Path -LiteralPath $dataPath)) {
  throw "Missing project status file at $dataPath"
}

$rawJson = Get-Content -LiteralPath $dataPath -Raw -Encoding UTF8
$projectStatus = $rawJson | ConvertFrom-Json
$today = Get-Date -Format "yyyy-MM-dd"
$changed = $false

foreach ($project in $projectStatus.projects) {
  if ([string]::IsNullOrWhiteSpace($project.githubRepo)) {
    continue
  }

  $uri = "https://api.github.com/repos/douglaspmcgowan/$($project.githubRepo)"
  Write-Host "Fetching $uri"
  $response = Invoke-RestMethod -Uri $uri -Headers $headers -Method Get
  $pushedAt = $response.pushed_at

  if (-not [string]::IsNullOrWhiteSpace($pushedAt) -and $project.lastCommit -ne $pushedAt) {
    $project.lastCommit = $pushedAt
    $changed = $true
  }
}

if ($projectStatus.generated -ne $today) {
  $projectStatus.generated = $today
  $changed = $true
}

if (-not $changed) {
  Write-Host "No project-status changes detected; skipping commit and push."
  exit 0
}

$jsonOut = $projectStatus | ConvertTo-Json -Depth 6
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($dataPath, $jsonOut + [Environment]::NewLine, $utf8NoBom)

& git -C $repoRoot add -- $relativeDataPath
$status = & git -C $repoRoot status --porcelain -- $relativeDataPath
if ([string]::IsNullOrWhiteSpace(($status -join ""))) {
  Write-Host "No staged diff after write; skipping commit and push."
  exit 0
}

$commitMessage = "Update project status $today [skip ci]"
& git -C $repoRoot commit -m $commitMessage
& git -C $repoRoot push
