# podman-on-aks

kubectl create namespace YOUR_NAMESPACE

kubectl create secret docker-registry acr-secret \
    --namespace=YOUR_NAMESPACE \
    --docker-server=YOUR_ACR_SERVER.azurecr.io \
    --docker-username=YOUR_ACR_USERNAME \
    --docker-password=YOUR_ACR_PASSWORD

