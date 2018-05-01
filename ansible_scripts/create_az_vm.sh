az group deployment create --resource-group ansibleteam2 --name ansibleteam2deployment --template-file azuredeploy.json --parameters azuredeploy.parameters.json
#az group deployment show -g ansibleteam2 -n ansibleteam2deployment --query properties.outputs.PublicIPAddress.value
#az group deployment show -g ansibleteam2 -n ansibleteam2deployment --query properties.outputs.hostname.value
#az group deployment show -g ansibleteam2 -n ansibleteam2deployment --query properties.outputs.sshCommand.value
