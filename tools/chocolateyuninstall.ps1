$ErrorActionPreference = 'Stop';
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  softwareName  = 'Qt Installer Framework'
  file          = "$($env:SystemDrive)\Qt\QtIFW-$($env:ChocolateyPackageVersion)\Uninstaller.exe"
  fileType      = 'exe'
  silentArgs    = "pr -c"
  validExitCodes= @(0, 3010, 1605, 1614, 1641)
}

Uninstall-ChocolateyPackage @packageArgs