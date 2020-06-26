

Get-InstalledModule -Name AzureRM -AllVersions


https://shell.azure.com/bash

Enable-AzureRmAlias -Scope CurrentUser


Connect-AzAccount

$webappname="spdevlabssimplefeedreader"


az group create --location centralus --name AzureTutorial

az appservice plan create --name $webappname --resource-group AzureTutorial --sku S1

## Create App Service Plan

az appservice plan create --name $webappname --resource-group AzureTutorial --sku S1

## Create the web app resource using the App Service plan in the same resource group.
az webapp create --name $webappname --resource-group AzureTutorial --plan $webappname
## e. Set the deployment credentials. These deployment credentials apply to all the web apps in your subscription. Don’t use special characters in the user name.
az webapp deployment user set --user-name REPLACE_WITH_USER_NAME --password REPLACE_WITH_PASSWORD
{
    "id": null,
    "kind": null,
    "name": "web",
    "publishingPassword": null,
    "publishingPasswordHash": null,
    "publishingPasswordHashSalt": null,
    "publishingUserName": "john.hansen@spdevlabs.onmicrosoft.com",
    "scmUri": null,
    "type": "Microsoft.Web/publishingUsers/web"
  }

az webapp deployment user set --user-name "john.hansen@spdevlabs.onmicrosoft.com" --password 1nt0>sp>2o2o

## Configure the web app to accept deployments from local Git and display the Git deployment URL. Note this URL for reference later.
echo Git deployment URL: $(az webapp deployment source config-local-git --name $webappname --resource-group AzureTutorial --query url --output tsv)

URL:
https://john.hansen@spdevlabs.onmicrosoft.com@spdevlabssimplefeedreader.scm.azurewebsites.net/spdevlabssimplefeedreader.git
PS /home/john>

http://spdevlabssimplefeedreader.azurewebsites.net


# Sign in to the Azure Cloud Shell, if not already signed in. https://shell.azure.com/bash
# 2. Create the staging slot.
# a. Create a deployment slot with the name staging.
$webappname="spdevlabssimplefeedreader"
az webapp deployment slot create --name $webappname --resource-group AzureTutorial --slot staging
# b. Configure the staging slot to use deployment from local Git and get the staging deployment URL. Note this URL for reference later.
echo Git deployment URL for staging: $(az webapp deployment source config-local-git --name $webappname --resource-group AzureTutorial --slot staging --query url --output tsv)
# c. Display the staging slot’s URL. Browse to the URL to see the empty staging slot. Note this URL for reference later.
echo Staging web app URL: http://$webappname-staging.azurewebsites.net

https://spdevlabssimplefeedreader-stagingc.azurewebsites.net