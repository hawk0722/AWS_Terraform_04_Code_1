# Terraform Sample
## AWS Resource
This includes of the following resources:
- CodeCommit
- CodePipeline
- S3


## SystemConfiguration
![SystemConfiguration](/img/SystemConfiguration.svg)


## Instructions
Make sure have the [AWS CLI](https://aws.amazon.com/jp/cli/) and [Terraform](https://www.terraform.io/downloads)

1. Update terraform.tfvars with your desired values.

2. Run the following command.

```bash:bash
terraform init
terraform plan
terraform apply
```

## Notes
- The deployment was tested on windows.
