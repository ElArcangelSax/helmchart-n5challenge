

export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"


terraform init -upgrade

terraform plan -out main.tfplan

terraform apply main.tfplan


echo "Verifying the results........"

resource_group_name=$(terraform output -raw resource_group_name)
echo $resource_group_name

# via Azure CLI...
# az aks list --resource-group $resource_group_name --query "[].{\"K8s cluster name\":name}" --output table


echo "$(terraform output kube_config)" > ./azurek8s
cat ./azurek8s

export KUBECONFIG=./azurek8s


## Finally.....get nodes

kubectl get nodes
