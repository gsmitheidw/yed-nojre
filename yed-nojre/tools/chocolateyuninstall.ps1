$ErrorActionPreference = 'Stop';

Uninstall-ChocolateyZipPackage `
  -PackageName yed-nojre `
  -ZipFileName yEd-3.23.2.zip `

# Clean up Start Menu Shortcut:
Remove-Item -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\yEd.lnk" -Confirm:$false
