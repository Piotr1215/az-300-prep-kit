if ([string]::IsNullOrEmpty($(Get-AzContext).Account)) {Connect-AzAccount}

$subscriptions = Get-AzSubscription

for ($i = 0; $i -lt $subscriptions.Length; $i++) {
    Write-Host $i $subscriptions[$i].Name, $subscriptions[$i].Id
}
    $selectedSubscription = Read-Host -Prompt 'Enter number of subscription to use'

    if ($selectedSubscription -gt $subscriptions.Length) {
        Write-Error "Subscription out of scope" -ErrorAction Stop
}
Select-AzSubscription -Subscription $subscriptions[$selectedSubscription].Id


$location = "WestEurope"
$rgName = "mygroupforkey-vault-test-123"

Write-Host "Creating resource group"

New-AzResourceGroup -Name $rgName -Location $location

Write-Host "Creating Azure key vault"

$vaultName = -join ((48..57) + (97..122) | Get-Random -Count 20 | % {[char]$_})
New-AzKeyVault -Name $vaultName -ResourceGroupName $rgName -Location $location