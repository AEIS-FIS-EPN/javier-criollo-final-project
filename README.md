# Infrastructure for the final project of AWS course

The main objective of this repository is to establish a foundation for the future infrastructure of my project on AWS. The .terraform file will serve as the starting point for defining resources by code.
## Prerequisites

- Terraform
## Deployment

Once you configured your AWS credentials and moved to the same directory as main.tf, use the next commands in order:


```bash
terraform init
```
This command initializes the working directory and downloads the Terraform providers specified in the configuration file.

```bash
terraform validate
```
This command checks the syntax of the Terraform code in the working directory and checks for errors.

```bash
terraform plan
```
This command creates an execution plan that shows the changes Terraform will make to the infrastructure.

```bash
terraform apply
```
This command applies the changes defined in the execution plan and creates or modifies infrastructure resources as needed.

```bash
terraform destroy
```
This command destroys what was created.
## License

[MIT](https://choosealicense.com/licenses/mit/)


## Authors

- [@Xaviercv1](https://github.com/Xaviercv1)