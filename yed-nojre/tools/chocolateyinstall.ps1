$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.yworks.com/resources/yed/demo/yEd-3.23.2.zip' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $env:ProgramFiles
  url           = $url
  softwareName  = 'yed-nojre*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '4F96611718DF696DE2F33EEB2CD78BFBBDACCE52390AFEA8D00441B6FB175E20'
  checksumType  = 'sha256'
}


# Test Java runtime present and run install

if ((Get-Command javaw -ErrorAction SilentlyContinue).Name -eq 'javaw.exe') {

	Install-ChocolateyZipPackage @packageArgs

	[string]$javapath = (Get-Command javaw).Path

	Install-ChocolateyShortcut `
	  -ShortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\yEd.lnk" `
	  -TargetPath "$javapath" `
	  -WorkingDirectory "$env:ProgramFiles\yed-3.23.2" `
	  -Arguments '-jar yed.jar' `
	  -IconLocation "$env:ProgramFiles\yed-3.23.2\yed.ico" `
	  -Description 'yEd Graphing Editor'

}
else {

	Write-Error 'No Java runtime found on path on this system. Please amend path or install a version of Java JDK/JRE' -ErrorAction Stop

}
