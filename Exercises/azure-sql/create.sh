read "projectName?Enter a project name that is used for generating resource names: "
read "adminUser?Enter the SQL server administrator username: "
read "adminPassword?Enter the SQl server administrator password: "

#$resourceGroupName="${projectName}rg"

#echo $resourceGroupName

echo "${projectName}rg"

az group create --location westeurope --name "${projectName}rg"

az group deployment create -g $resourceGroupName --template-uri "template.json" `
    --parameters 'projectName=' + $projectName \
                 'adminUser=' + $adminUser \
                 'adminPassword=' + $adminPassword

read "Press [ENTER] to continue ..."