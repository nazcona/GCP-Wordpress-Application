# GCP-Wordpress-Application

VPC module

    In this project, we used regional VPC, because it provided us managed in specific virtual network of our Gcloud resources through subnets.

Steps:

    Create vpc.tf file in folder with .gitignore and README.md files
    Use google_compute_network resource to create the vpc

resource "google_compute_network" "vpc_network" {
   name = "vpc-network"
   auto_create_subnetworks = "true"
   routing_mode = "Regional"
}

    Open integrated terminal for this folder

    DO NOT FORGET to set the project first, otherwise your resources won't be created under your project in GCP

    Command for setting the project: gcloud config set project [PROJECT_ID]

    Run terraform init command to initialize it

    Run terraform plan and see if you have any syntax error

    Run terraform apply to apply your changes

    Go to Google Console and check if your VPC is created under the name of vpc-network

Note: there is also Default VPC in GCP. Please find your newly created VPC
