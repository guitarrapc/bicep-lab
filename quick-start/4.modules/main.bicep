module stg './storage.bicep' = {
  name: 'storageDeploy'
  params: {
    containerNames: [
      'apple'
      'banana'
      'chocolate'
    ]
  }
}

output storageName array = stg.outputs.containerProps
