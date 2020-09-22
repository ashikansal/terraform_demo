## Terrform for Azure

PreRequisite:

1. Create Service Principal for authenticating with Azure
2. Grant SP required access to create resources in Subscription

Export below Env variables for terraform to authenticate with azure:

```
export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
export ARM_CLIENT_SECRET="00000000-0000-0000-0000-000000000000"
export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
```

#### As part of this demo, we are doing below task:
1. Creating resource group
2. Creating Virtual Machine with Vnet/Subnet and MSI
    2.1 Fetching VM password from Keyvault, which is not managed by current tf code
3. Creating Storage Account
4. Assigning Virtual Machine Identity access to Storage Account


#### For initializing backend and plugins run:
```
terraform init
```

#### For creating execution plan and to see what all resources will be created run:
```
terraform plan -var-file <vars_file_path> -out <plan_file_path>
terraform plan -var-file tfvars/vars.tf -out tfplan
```

#### For applying execution plan created in plan step:
```
terraform apply <plan_file_path>
terraform apply tfplan
```

* First Deploy with local state file
* Then See issues and migrate to remote state file
* Then See back from local state file (and use of import command and its usecases)


#### Plugins
For terraform Third party plugins: Download plugin and put in Users plugin directory
curl https://raw.githubusercontent.com/databrickslabs/databricks-terraform/master/godownloader-databricks-provider.sh | bash -s -- -b $HOME/.terraform.d/plugins

