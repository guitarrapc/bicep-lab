## README

https://github.com/Azure/bicep

## Concept

> Bicep is a domain-specific language (DSL) that uses declarative syntax to deploy Azure resources.
> ref: https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview

> You can use Bicep instead of JSON to develop your Azure Resource Manager templates (ARM templates).
> During deployment, Bicep CLI transpiles a Bicep file into ARM template JSON.

## Setup Bicep Environment

> https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/install

* Install Bicep tools
    * VS Code
    * Bicep extention for VS Code
* bicep cli or docker
    * install with az or direct.
    * if run on alpne, use `bicep-linux-musl-x64`

## Get started

Azure Authentication for az.


## Docs

* [Official Doc](https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/overview)

## TIPS

### Use az bicep

If you want use bicep through az, `az bicep` will fit your usage.
Following two are same result.

```shell
az bicep build -f file.bicep
bicep decompile -f file.bicep
```

### Decompile

ARM Template to bicep.

```shell
bicep decompile -f template.json
```