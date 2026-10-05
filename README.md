# TASK 3 - Infrastructure as Code (IaC) with Terraform

## Objective
Provision a local Docker container using Terraform.

## Tools
- Terraform
- Docker
- Git / GitHub

## What this project creates
Terraform uses the `kreuzwerker/docker` provider to:
1. Pull the `nginx:alpine` Docker image.
2. Create a Docker container named `terraform-nginx-container`.
3. Map Docker port 80 to local port 8085.
4. Output the container name, ID and URL.

## Project files
- `main.tf` - Terraform configuration.
- `execution_logs.md` - Commands and a place to record the actual execution output.
- `.gitignore` - Prevents Terraform local state/provider files from being committed.
- `README.md` - Project documentation.

## Prerequisites
Install and verify:
```powershell
terraform -version
docker --version
docker info
```

Docker Desktop must be running before Terraform commands are executed.

## Step-by-step execution

Open PowerShell in this project folder.

### 1. Initialize Terraform
```powershell
terraform init
```

### 2. Validate the configuration
```powershell
terraform validate
```

Expected:
```text
Success! The configuration is valid.
```

### 3. Review the execution plan
```powershell
terraform plan
```

Terraform should show resources to be created, including:
- `docker_image.nginx`
- `docker_container.nginx`

### 4. Apply the infrastructure
```powershell
terraform apply
```

When prompted:
```text
Enter a value:
```
type:
```text
yes
```

Or use:
```powershell
terraform apply -auto-approve
```

### 5. Check the Terraform state
```powershell
terraform state list
```

You should see resources similar to:
```text
docker_container.nginx
docker_image.nginx
```

### 6. Verify the Docker container
```powershell
docker ps
```

You should see:
```text
terraform-nginx-container
```

Open this in a browser:
```text
http://localhost:8085
```

You should see the Nginx welcome page.

### 7. Check Terraform outputs
```powershell
terraform output
```

### 8. Destroy the infrastructure
After taking the required screenshots/logs:
```powershell
terraform destroy
```

Type:
```text
yes
```

Or:
```powershell
terraform destroy -auto-approve
```

Then verify:
```powershell
docker ps -a
terraform state list
```

The Terraform-managed container should no longer exist, and the Terraform state should be empty.

## Important
Do NOT manually run `docker run` for this task. Terraform is supposed to provision the container.

Do NOT commit:
- `.terraform/`
- `terraform.tfstate`
- `terraform.tfstate.backup`
- `crash.log`

These are excluded by `.gitignore`.

## GitHub submission

Create a new GitHub repository, for example:
`devops-task-3-terraform-docker`

Then from PowerShell:

```powershell
git init
git add .
git commit -m "Complete Task 3 Terraform Docker IaC"
git branch -M main
git remote add origin https://github.com/YOUR-USERNAME/devops-task-3-terraform-docker.git
git push -u origin main
```

Replace `YOUR-USERNAME` with your GitHub username.

Before pushing, check:
```powershell
git status
```

Your GitHub repository should contain the Terraform code, README and execution-log document.

## Task mapping
This project follows the internship task requirements:
- Docker provider: `main.tf`
- Create a container: `docker_container.nginx`
- `terraform init`: documented above
- `terraform plan`: documented above
- `terraform apply`: documented above
- `terraform destroy`: documented above
- `terraform state`: documented above
- Execution logs: `execution_logs.md`
