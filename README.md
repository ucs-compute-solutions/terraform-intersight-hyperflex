# terraform-intersight-hyperflex
Installation scripts for Cisco HyperFlex using the Cisco Intersight Terraform provider.

The Cisco Intersight Terraform provider is now available for use direcly from the Terraform Registry at https://registry.terraform.io/providers/CiscoDevNet/intersight/latest.

## Installation

- Terraform 0.13.0 or later must be installed
- Access to the Terraform registry via the internet must be available

Clone or fork the terraform-intersight-hyperflex repository to create a local copy of the scripts to work with.

```
git clone https://github.com/ucs-compute-solutions/terraform-intersight-hyperflex.git
```

## Usage
The example scripts are in three folders:
- create_edge_profile: Contains the scripts to install HyperFlex Edge clusters
- create_profile: Contains the scripts to install standard HyperFlex clusters
- intersight-moids: Contains a module to retrieve the moids of the physical servers from Intersight by their names

### API Access
Authentication with the Intersight API requires the use of API keys that should be generated within the Intersight UI.  See (https://intersight.com/help) or (https://communities.cisco.com/docs/DOC-76947) for more information on generating and using API keys. The values for the API key and the path to the key file must be entered into the terraform.tfvars file:

1. Using a supported web browser, log in to Cisco Intersight at https://www.intersight.com.
2. Click the gear icon in the top-right corner. Then click Settings.
3. Click API Keys in the menu on the left.
4. Click Generate API Key in the top-right corner.
5. Enter a description for the API key, such as Ansible. Then click Generate.
6. Click the icon to copy the API key ID and then paste the key ID in the terraform.tfvars file, in the line beginning with api_key=.
7. Click the icon to save the secret key to a local text file. Note the location of the downloaded file and move the file to a different folder if desired.
8. Enter the path to the downloaded file named SecretKey.txt in the terraform.tfvars file, in the line beginning with api_key_file=.

### Variables
The remainder of the variables in the terraform.tfvars file must be modified with your unique values for the cluster you wish to install.

* Note: The required and optional variables are different for standard and Edge clusters. Please ensure you are using the appropriate example .tfvars file as the reference for your cluster(s).

### Execution
Once all the required variables are entered, from a command line change to the create_profile or create_edge_profile folder as appropriate and run the following commands:
```
terraform init
```
This command will initialize the environment and download the Cisco Intersight Terraform provider to the .terraform folder.
```
terraform plan
```
This command will execute the script without committing any changes and give a list of all the resources that will be created. Examine the output of the plan execution for any warnings or errors.
```
terraform apply
```
This command will execute the plan and commit all the new resources or changes to the environment.

### Validate and Deploy
Once the Terraform script has completed, all the necessary policies and profiles for your Cisco HyperFlex cluster will appear in your Cisco Intersight management UI, shown in the Policies section and the Profiles section. 
View the new HyperFlex profile in Intersight, and use the Intersight UI to begin a Validation or Deployment of the newly created cluster.

[![published](https://static.production.devnetcloud.com/codeexchange/assets/images/devnet-published.svg)](https://developer.cisco.com/codeexchange/github/repo/ucs-compute-solutions/terraform-intersight-hyperflex)
