## Getting Started

> detail: https://github.com/Azure/bicep/blob/main/docs/tutorial/05-loops-conditions-existing.md

## Existing

Bicep support reference existing resource.

```shell
az deployment group create -f ./existing.bicep -p storageAccountName=demobqlmoxx3nmr2g -g my-rg
```

## Conditions

Bicep support conditions, like following syntax.

```bicep
resource foo 'my.provider/type@2021-03-01' = if(<BOOLEAN>) {...}
```

```shell
az deployment group create -f ./conditions.bicep -p currentYear=2020 -g my-rg --mode Complete
```

## loops

```bicep
resource foo 'my.provider/type@2021-03-01' = [for <ITERATOR_NAME> in <ARRAY> = {...}]
```

```shell
az deployment group create -f ./loops.bicep -g my-rg --mode Complete
```
