
# Deploy AWS Infrastructure Using Terraform and GitHub Actions

This guide provides step-by-step instructions to deploy AWS infrastructure using **Terraform** and automate the process with **GitHub Actions**.

---

## Project Structure

The project is organized as follows:

```
├── .github/
│   └── workflows/
│       ├── deployment.yml          # GitHub Actions workflow for deployment
│       └── destroy.yml             # GitHub Actions workflow for resource cleanup
├── Lab1-Terraform/
│   ├── keypair/
│   │   ├── my-key                  # Private key for SSH access
│   │   └── my-key.pub              # Public key for SSH access
│   ├── modules/                    # Terraform modules (if any are used)
│   ├── main.tf                     # Main Terraform configuration
│   ├── output.tf                   # Outputs from Terraform
│   ├── terraform.tfvars            # Terraform variable values
│   ├── variable.tf                 # Variable definitions
│   ├── command_run_code.txt        # List of Terraform CLI commands for reference
│   └── README.md                   # Documentation for the Terraform project
```

---

## Prerequisites

1. **AWS Account**:
   - Ensure you have an AWS account with sufficient permissions to create the resources defined in `main.tf`.

2. **GitHub Repository**:
   - A GitHub repository containing the project files.

3. **GitHub Secrets**:
   - Configure the following secrets in your GitHub repository:
     - `AWS_ACCESS_KEY_ID`: Your AWS access key ID.
     - `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
     - `AWS_REGION`: The AWS region where resources will be deployed.

4. **Terraform CLI**:
   - Install Terraform CLI locally to test configurations.
     - [Download Terraform CLI](https://www.terraform.io/downloads)

---

## Steps to Deploy

### 1. Prepare Terraform Configuration

1. Define your infrastructure in `main.tf`. 

2. Update `terraform.tfvars` with your specific variable values.

3. Ensure your `keypair/` directory contains the SSH keys (`my-key` and `my-key.pub`).

---

### 2. Configure GitHub Actions Workflows

1. **Deployment Workflow (`deployment.yml`)**:

   This workflow automatically deploys resources when changes are pushed to the `main` branch.


2. **Destroy Workflow (`destroy.yml`)**:

   This workflow allows manual cleanup of resources.
---

### 3. Add SSH Keys to AWS

Ensure the SSH key pair in `keypair/` is uploaded to AWS or referenced in your Terraform configuration (`key_name`).


---

### 4. Test Locally

Before pushing to GitHub, test your Terraform configuration locally:

```bash
cd Lab1-Terraform/
terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -auto-approve -var-file=terraform.tfvars
```

---

### 5. Push Changes to GitHub

Commit your files and push to the `main` branch to trigger the GitHub Actions workflow:

```bash
git add .
git commit -m "Initial commit for Terraform deployment"
git push origin main
```

---

## Notes

- **State Management**: If deploying to production, configure a remote backend (e.g., S3) to store the Terraform state securely.
- **IAM Roles**: Ensure proper IAM roles and permissions for AWS resources.
- **Security**: Always store sensitive information in GitHub Secrets.
