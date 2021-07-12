## Getting Started

> detail: https://github.com/Azure/bicep/blob/main/docs/tutorial/03-using-expressions.md

## expression

Bicep supports varous expression.

```shell
az deployment group create -f ./main.bicep -g my-rg
```

To create GRS storage, pass `globalRedundancy=true` on deployment.

```shell
az deployment group create -f ./main.bicep -g my-rg -p globalRedundancy=true
```

## synbolic resource reference

As normal IaC, bicep can reference resource output.


```bicep
resource blob 'Microsoft.Storage/storageAccounts/blobServices/containers@2019-06-01' = {
  name: '${testStorage.name}/default/logs'
}

output endpoint string = testStorage.properties.primaryEndpoints.blob
```
