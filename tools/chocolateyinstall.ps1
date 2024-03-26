$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.qt.io/official_releases/qt-installer-framework/4.7.0/QtInstallerFramework-windows-x64-4.7.0.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Qt Installer Framework'
  checksum      = '9fcbad5c2d29aee4e9a1f8f2516e067e6476b37e2602b399418dbc6ce1b0b8b9'
  checksumType  = 'sha256'

  silentArgs    = "in --da -c --al"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "$($env:SystemDrive)\Qt\QtIFW-$($env:ChocolateyPackageVersion)\bin" -PathType 'User'