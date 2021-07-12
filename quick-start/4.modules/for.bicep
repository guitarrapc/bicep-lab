param deployments array = [
  'foo'
  'bar'
]

module stg './storage.bicep' = [for item in deployments: {
  name: 'storageDeploy'
  params: {
    containerNames: [
      'apple-${item}'
      'banana-${item}'
      'chocolate-${item}'
    ]
  }
}]

output storageName array = [for i in range(0, length(deployments)): stg[i].outputs.containerProps]
