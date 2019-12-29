# How to use powershell on Linux/WSL

In order to deploy resources to Azure from powershell on Linux:

1. [Install powershell core](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6#ubuntu-1804)

2. [Install latest version of Azure Powershell Module](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-3.2.0)

3. Execute script `create.ps1` by running `pwsh create.ps1`, this script will:

- log you in to Azure if you are not already logged in
- list all your Azure subscriptions
- allow you to select one subscription by selecting number corresponding to then subscription row
- deploy azure key vault to selected subscription (by default "westeurope" zone)

4. Execute script `destroy.ps1` by running `pwsh destroy.ps1` to remove resource group and key vault
