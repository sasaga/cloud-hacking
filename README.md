# cloud-hacking
Sometimes it is difficult to practice pentesting when we do not have an environment at hand or our hardware resources are not enough, with **cloud hacking** you can make use of **AWS** and **Terraform** to use your favorite pentesting distributions and best of all, from a **web browser** .

# Currently active images
- kali-base-xfce
> Kali linux base image without tools for enthusiasts who want to install the tools at will.
- kali-top10-xfce
> Image of kali linux with the top 10 tools
```
aircrack-ng
burpsuite
crackmapexec
hydra
john
metasploit-framework
nmap
responder
sqlmap
wireshark
```
- kali-full-xfce
> This image contains all the official tools of kali linux 2021.

## Requirements
For the correct execution of cloud hacking, it is essential to have the following requirements.

- Have [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) Installed on your workstation.
- Have an Amazon Web Services account and an IAM account with [Access keys ](https://aws.amazon.com/es/premiumsupport/knowledge-center/create-access-key/)

## Terraform project setup
Follow these steps to configure Terraform and deploy your cloud hacking on AWS
- Once the project is downloaded, each folder is a project configured to be displayed in terraform, so within this folder you will find 5 files like the following.
> app-instance.tf
> key-pairs.tf
> output.tf
> security-group.tf
> variables.tf

The directory and file tree will look like the following, assuming my-project in the project folder to run:
```
.
└── my-project
    ├── app-instance.tf
    ├── key-pairs.tf
    ├── keys
    │   ├── my-project
    │   └── my-project.pub
    ├── output.tf
    ├── security-group.tf
    └── variables.tf
```

Modify the **variables.tf** file, with the access credentials provided by amazon, it will have a nomenclature similar to the following:
```
variable  "access_key" {
	default =  "aws_access_key" 
}
variable  "secret_key" {
	default =  "aws_secret_key" 
}
variable  "region" {
	default =  "aws_region" 
}
```
## Create SSH keys
Follow these steps to create the SSH keys for access to the project you want to deploy, it is necessary to implement them since with them you will provision your EC2 instance with docker from Terraform.

> **Note:** Keep in mind that to avoid problems when deploying the name of the SSH keys must correspond exactly with those of the project folder to be deployed, if the folder where it is found is **myproject-base** that is how the keys should be called.

Generate the keys with the following command and copy them to the keys directory
> ssh-keygen -f myproject-base -t rsa -N '' -q

## Running Terraform
Finally run Terraform and deploy your project, essentially the main terraform commands according to their life cycle are the following:
- terraform init
> Start terraform
- terraform apply
> Apply the configured changes to the files
- terraform destroy
> Destroy changes generator by terraform apply

At the end of the execution terraform will give you the public IP address of the instance to connect along with the access credentials.
Now you can enjoy your hacking infrastructure in the AWS cloud
