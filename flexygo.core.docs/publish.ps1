# publish.ps1 — Build MkDocs y publica en rama publish
# Uso: .\publish.ps1

$ErrorActionPreference = "Stop"
$projectDir = $PSScriptRoot
$repoRoot = Split-Path $projectDir -Parent
$worktree = Join-Path $repoRoot "publish-worktree"

Set-Location $projectDir

# 1. Build
Write-Host "Building site..." -ForegroundColor Cyan
mkdocs build
if ($LASTEXITCODE -ne 0) { Write-Error "mkdocs build failed"; exit 1 }

# 2. Worktree temporal para la rama publish (sin cambiar de rama)
if (Test-Path $worktree) {
    git -C $repoRoot worktree remove $worktree --force 2>$null
}
git -C $repoRoot worktree add $worktree publish

# 3. Reemplazar contenido con el nuevo build
Get-ChildItem $worktree | Where-Object { $_.Name -ne ".git" } | Remove-Item -Recurse -Force
Get-ChildItem "$projectDir\site" | Copy-Item -Destination $worktree -Recurse -Force

# 4. Commit y push
Set-Location $worktree
git add -A
$date = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "publish: build $date"
git push origin publish

# 5. Limpiar worktree
Set-Location $projectDir
git -C $repoRoot worktree remove $worktree --force

Write-Host "Done. Rama publish actualizada." -ForegroundColor Green
