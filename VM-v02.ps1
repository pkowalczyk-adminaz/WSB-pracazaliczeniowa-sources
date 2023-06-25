<#-------------wypełnij------------------#>
$tenantID= Read-Host -Prompt "Wprowadz ID tenanta"
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"
$location = Read-Host -Prompt "Enter the location (i.e. northeurope)"
$adminUsername = Read-Host -Prompt "Enter the administrator username"
$adminPassword = Read-Host -Prompt "Enter the administrator password" -AsSecureString
$networkname = Read-Host -Prompt "Podaj nazwe sieci"
$dnsLabelPrefix = Read-Host -Prompt "Enter an unique DNS name for the public IP" 


#Connect-AzAccount -Tenant $tenantID
New-AzResourceGroup -Name $resourceGroupName -Location "$location" 
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.compute/vm-simple-windows/azuredeploy.json" `
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix

 (Get-AzVm -ResourceGroupName $resourceGroupName).name