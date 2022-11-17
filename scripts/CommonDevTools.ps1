
# tools we expect devs across many scenarios will want
choco install -y git --package-parameters="'/GitAndUnixToolsOnPath /WindowsTerminal'"
choco install -y poshgit
choco install -y oh-my-posh
choco install -y sysinternals

Install-Module -Force oh-my-posh
