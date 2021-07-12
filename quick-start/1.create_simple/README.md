## Getting Started

> detail: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/quickstart-create-bicep-use-visual-studio-code?tabs=CLI

1. Create main.bicep
1. See what will happen on deploy via `what-if`.

```shell
az deployment group what-if -f ./main.bicep -g my-rg -p storageAccountName=uniquelogstorage001 --mode Complete
```

1. Deploy bicep defined resource to azure via `create`.

```shell
az deployment group create -f ./main.bicep -g my-rg
```

1. You can pass parameter on deploy.

```shell
az deployment group create -f ./main.bicep -g my-rg -p storageAccountName=uniquelogstorage001
```

> NOTE: You'll find both uniquestorage0011111001 and uniquelogstorage001 is exists.

1. To synchronize Resource, use `--module Complete`. Otherwise old resource will not been deleted.

```shell
az deployment group create -f ./main.bicep -g my-rg --mode Complete
```

1. Delete deployment.

create empty bicep and deploy.

```shell
$null > null.bicep
az deployment group create -f ./null.bicep -g my-rg --mode Complete
```

```shell
# DO NOT use Delete resource, it will remain resources but delete deployemnt. This is not desired behaviour.
az deployment group delete -g my-rg -n main
```

# TIPS

## Which Mode `Increment` or `Complete` should I use

From Terraform or Other idempotent operation IaC View, Complete is synchronise code and resource.
This is what normal IaC do.

However ARM Template has some limitation of deletion on Complete.

> ref: https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deployment-complete-mode-deletion

As it desctibe, `Complete mode deletetion` not support all resources.
This indicate ARM Template is not intended to use as full idempotent IaC.
It is stateless, it affect to target scope at all.

From this perspective, there are 2 choice.

1. Choice 1. Use Increment mode.
    * Deploy with `Increment Mode` only, so Code and Deployment always match.
    * pros. Icrement bring Deployment always match to Resource.
    * pros(?). Non code managed resource doesn't take effect.
    * cons. However Code and Resource will getting different.
    * cons. You must delete old resource via CLI or Console.
1. Choice 2. Use Complete mode.
    * Deploy with `Complete Mode` only, so Code, Deployement and Resources always match.
    * pros. Code and resource are always synchronize via deployement. You don't need handle old resource deletion.
    * cons. Deployment effect to target scope. Not limit to written in Code. You cannot control target scope with your code.
    * cons. Non code managed resource will be deleted in target scope.

If you only control resource via bicep, design ResourceGroup to use `Complete` mode if possible.
