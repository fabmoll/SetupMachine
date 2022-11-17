# Description: Boxstarter Script  
# Author: Laurent Kempé
# Dev settings for my app development

Disable-UAC

# Get the base URI path from the ScriptToCall value
$bstrappackage = "-bootstrapPackage"
$helperUri = $Boxstarter['ScriptToCall']
$strpos = $helperUri.IndexOf($bstrappackage)
$helperUri = $helperUri.Substring($strpos + $bstrappackage.Length)
$helperUri = $helperUri.TrimStart("'", " ")
$helperUri = $helperUri.TrimEnd("'", " ")
$helperUri = $helperUri.Substring(0, $helperUri.LastIndexOf("/"))
$helperUri += "/scripts"
write-host "helper script base URI is $helperUri"

function executeScript {
    Param ([string]$script)
    write-host "executing $helperUri/$script ..."
    iex ((new-object net.webclient).DownloadString("$helperUri/$script"))
}

#--- Setting up Windows ---
#executeScript "SystemConfiguration.ps1";

#executeScript "FileExplorerSettings.ps1";
#executeScript "RemoveDefaultApps.ps1";

#executeScript "CommonDevTools.ps1"; todo pour les petites apps
#--- executeScript "Browsers.ps1";
#executeScript "WindowsTools.ps1";todo pour les petites apps


#--- Visual Studio ---
choco install visualstudio2019enterprise -y
#-y --package-parameters "--add Microsoft.VisualStudio.Component.Git" 
Update-SessionEnvironment #refreshing env due to Git install

choco install -y visualstudio2019-workload-manageddesktop
choco install -y visualstudio2019-workload-office

#--- Visual Studio extensions ---
#choco install -y gitdiffmargin
#choco install -y resharper-ultimate-all --package-parameters="'/NoCpp'"

Enable-UAC
Enable-MicrosoftUpdate
#Install-WindowsUpdate -acceptEula
