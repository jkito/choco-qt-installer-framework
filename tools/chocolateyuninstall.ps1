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

# Remove QtIFW location from PATH
# https://gitlab.com/DarwinJS/ChocoPackages/-/blob/master/ec2clitools/tools/chocolateyuninstall.ps1
# see https://github.com/chocolatey/choco/issues/310

$PathToRemove = "$($env:SystemDrive)\Qt\QtIFW-$($env:ChocolateyPackageVersion)\bin"
foreach ($path in [Environment]::GetEnvironmentVariable("PATH","User").split(';'))
{
  If ($Path)
  {
    If (($path -ine "$PathToRemove") -AND ($path -ine "$PathToRemove\"))
    {
      [string[]]$Newpath += "$path"
    }
  }
}
$AssembledNewPath = ($newpath -join(';')).trimend(';')
[Environment]::SetEnvironmentVariable("PATH",$AssembledNewPath,"User")