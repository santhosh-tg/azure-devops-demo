
# YAML Pipeline Workshop - README

## Prerequisites

### 1. Azure DevOps
- Azure DevOps account
- Organization and project created

### 2. GitHub
- GitHub account
- Repository with:
  - Sample Java project
  - `Dockerfile` in root directory
  - YAML pipeline file
- GitHub App installed and authorized for Azure DevOps

https://github.com/apps/azure-pipelines

### 3. Docker Hub
- Docker Hub account
- Personal access token

### 4. Azure DevOps Variable Group
- Navigate to **Pipelines > Library**
- Create a **Variable Group** (e.g., `ContainerRegistrySecrets`)
- Add the following variables:
  - `REGISTRY_USERNAME` → Docker Hub username
  - `REGISTRY_PASSWORD` → Docker Hub token/password (**mark as secret**)

Reference this group in your YAML:

```yaml
variables:
  - group: ContainerRegistrySecrets
```


## Demo Summary
This demo showcases how to:
- Configure a CI pipeline using YAML in Azure DevOps
- Build and push a Docker image from a Java app to Docker Hub
- Use best practices like variable groups for secrets and pipeline modularity
