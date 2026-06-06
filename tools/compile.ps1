param(
  [switch]$CleanAux,
  [switch]$KeepPdf
)

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
Push-Location $Root
try {
  if ($CleanAux) {
    Get-ChildItem -Path . -File -Include *.aux,*.bbl,*.blg,*.log,*.out,*.toc,*.fdb_latexmk,*.fls,*.synctex.gz,*.xdv -Recurse |
      Remove-Item -Force
  }

  xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex
  bibtex main
  xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex
  xelatex -synctex=1 -interaction=nonstopmode -file-line-error main.tex
  if ($KeepPdf -and (Test-Path "main.pdf")) {
    Copy-Item -LiteralPath "main.pdf" -Destination "example.pdf" -Force
  }
}
finally {
  Pop-Location
}
