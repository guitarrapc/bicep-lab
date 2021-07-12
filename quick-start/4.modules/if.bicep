param deployStorage bool = true

module stg './storage.bicep' = if (deployStorage) {
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
