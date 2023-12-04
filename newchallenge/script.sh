az login
az aks get-credentials --resource-group <resource-group-name> --name <aks-cluster-name>

helmfile -e dev apply
helmfile -e stage apply


