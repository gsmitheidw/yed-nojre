$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://www.yworks.com/resources/yed/demo/yEd-3.23.2.zip' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'yed-nojre*' #part or all of the Display Name as you see it in Programs and Features. It should be enough to be unique
  checksum      = '4F96611718DF696DE2F33EEB2CD78BFBBDACCE52390AFEA8D00441B6FB175E20'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 


