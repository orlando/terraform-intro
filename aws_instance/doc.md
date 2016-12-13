## Description:

AWS Instance creates a EC2 instance

## Usage:

```hcl
module "myinstance" {
  source = "./aws_instance"

  instance_type = "t2.micro"
}
```


## Inputs

| Name | Description | Default | Required |
|------|-------------|:-----:|:-----:|
| instance_type | EC2 instance type | `t2.nano` | no |

## Outputs

| Name | Description |
|------|-------------|
| ip | IP of the EC2 instance |

