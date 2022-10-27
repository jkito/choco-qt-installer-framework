$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://download.qt.io/official_releases/qt-installer-framework/4.4.2/QtInstallerFramework-windows-x64-4.4.2.exe'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url

  softwareName  = 'Qt Installer Framework'
  checksum      = 'a862d08a13fbd531b7ac3a156a5932376f88a655bd0e5f39d0400143e0611463'
  checksumType  = 'sha256'

  silentArgs    = "in --da -c --al"
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
Install-ChocolateyPath "$($env:SystemDrive)\Qt\QtIFW-$($env:ChocolateyPackageVersion)\bin" -PathType 'User'