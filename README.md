# terraform-starter-repo
Sample of How to use Terraform managed Cloud Infrastructure as stack code

## How to verify AWS Credentionals and Session

```bash
aws sts get-caller-identity
```

## Create EC2 by Terraform

- Initilze Terraform AWS Provider

```bash
cd compute/ec2 && terraform init
```

- Show out EC2 resource when it want to build

```bash
cd compute/ec2 && terraform plan
```

- Approval to Create AWS EC2

```bash
cd compute/ec2 && terraform apply
```

## Create CodeDeploy with Blue/Green Deploy by Terraform


- Initilze Terraform AWS Provider

```bash
cd developer-tools/codedeploy && terraform init
```

- Show out EC2 resource when it want to build

```bash
cd developer-tools/codedeploy && terraform plan
```

- Approval to Create AWS EC2

```bash
cd developer-tools/codedeploy && terraform apply
```