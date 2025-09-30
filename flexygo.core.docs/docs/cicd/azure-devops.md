# Azure DevOps (Azure Pipelines)

Azure Pipelines soporta dos modos:  
- **YAML** en el repositorio (`azure-pipelines.yml`) — recomendado.  
- **Clásico (UI)** — legado.

---

## Ejemplo mínimo (`azure-pipelines.yml`)

```yaml
trigger:
  branches:
    include: [ main ]

pool:
  vmImage: 'ubuntu-latest'

stages:
- stage: Build
  displayName: Build & Test
  jobs:
  - job: Build_Test
    steps:
    - checkout: self
    - task: UseDotNet@2
      inputs:
        packageType: sdk
        version: '9.0.x'
    - script: dotnet restore
      displayName: Restore
    - script: dotnet build --configuration Release --no-restore
      displayName: Build
    - script: dotnet test --configuration Release --no-build
      displayName: Test
    - script: dotnet publish src/Backend/Backend.csproj -c Release -o out
      displayName: Publish
    - task: PublishBuildArtifacts@1
      inputs:
        pathToPublish: 'out'
        artifactName: 'backend-drop'
- stage: Deploy
  dependsOn: Build
  jobs:
  - deployment: to_dev
    environment: 'dev'
    strategy:
      runOnce:
        deploy:
          steps:
          - download: current
            artifact: backend-drop
          - script: |
              echo "Desplegar aquí (IIS, K8s, Azure Web App, etc.)"
```