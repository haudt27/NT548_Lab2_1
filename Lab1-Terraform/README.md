

## Requirements

No requirements.


## Architecture

The architecture consists of the following components:
- **VPC**: A custom VPC with public and private subnets.
  - **Public Subnet**: Connected to the Internet Gateway for public access.
  - **Private Subnet**: Connected to the NAT Gateway for secure outbound internet access.
- **Internet Gateway**: Allows public subnet access to the internet.
- **NAT Gateway**: Allows resources in the private subnet to securely access the internet.
- **Route Tables**:
  - **Public Route Table**: Routes traffic to the internet through the Internet Gateway.
  - **Private Route Table**: Routes traffic through the NAT Gateway.
- **EC2 Instances**:
  - **Public EC2 Instance**: Accessible from the internet over SSH.
  - **Private EC2 Instance**: Only accessible from the public EC2 instance.
- **Security Groups**:
  - **Public EC2 Security Group**: Allows SSH access from a specific IP.
  - **Private EC2 Security Group**: Allows SSH access from the public EC2 instance only.


## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |



## Resources

| Name | Type |
|------|------|
| [aws_key_pair.my-keypair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amis"></a> [amis](#input\_amis) | n/a | `map(any)` | <pre>{<br/>  "ap-northeast-1": "ami-0dfa284c9d7b2adad",<br/>  "ap-southeast-1": "ami-0e4b5d31e60aa0acd"<br/>}</pre> | no |
| <a name="input_availability_zone_1"></a> [availability\_zone\_1](#input\_availability\_zone\_1) | parameters for networking module | `string` | n/a | yes |
| <a name="input_availability_zone_2"></a> [availability\_zone\_2](#input\_availability\_zone\_2) | n/a | `string` | n/a | yes |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | Type of EC2 instance to launch. Example: t2.micro | `string` | `"t2.micro"` | no |
| <a name="input_keypair_path"></a> [keypair\_path](#input\_keypair\_path) | n/a | `string` | `"./keypair/my-key.pub"` | no |
| <a name="input_private_subnet_ips"></a> [private\_subnet\_ips](#input\_private\_subnet\_ips) | n/a | `list(string)` | n/a | yes |
| <a name="input_public_subnet_ips"></a> [public\_subnet\_ips](#input\_public\_subnet\_ips) | n/a | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"ap-southeast-1"` | no |
| <a name="input_user_ip"></a> [user\_ip](#input\_user\_ip) | IP of user | `string` | n/a | yes |


## Deployment Instructions

### Prerequisites

- **Terraform** is installed.
- **AWS CLI** is installed and configured with proper credentials.
- An SSH key pair exists in your AWS account for access to EC2 instances.
- You know your public IP address to limit SSH access to the public EC2 instance.

### Deployment

1. **Initialize the Terraform environment**: Run this command to initialize the working directory containing the Terraform configuration files.

    ```bash
    terraform init
    ```

2. **Validate the configuration** (optional): Ensure your Terraform files are properly configured.

    ```bash
    terraform validate
    ```

3. **Plan the infrastructure**: Review the actions Terraform will take to build your infrastructure.

    ```bash
    terraform plan --var-file "terraform.tfvars"
    ```

4. **Deploy the infrastructure**: Apply the Terraform plan to create the resources on AWS.

    ```bash
    terraform apply --var-file "terraform.tfvars"
    ```

5. **View outputs**: After the deployment, you can retrieve the outputs such as the public IP of the EC2 instances using:

    ```bash
    terraform output
    ```
  6.  **Destroying Resources**: To tear down the entire infrastructure and clean up resources, run the following command:
	  ```
	  terraform destroy --var-file "terraform.tfvars"
## Outputs

No outputs.

