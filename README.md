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

Database

    Google Cloud SQL is managed database service and it allows us to run MySQL, PosgreSQL on GCloud.

    In Cloud Shell under your repo folder, create a folder DB and add terraform files in it - dbinstance.tf, variables.tf and provider.tf

    In dbinstance.tf add your resources to create your database instance. Use google_sql_database_instance resource for this:

    resource "google_sql_database_instance" "instance" {
	name = var.db_name
	region = var.db_region
	# private_network 	= "CHANGEME"								# Give one of the VPC's Private IPv4	private_network - (Optional) The VPC network from which the Cloud SQL instance is accessible for private IP. For example, projects/myProject/global/networks/default. Specifying a network enables private IP. At least ipv4_enabled must be enabled or a private_network must be configured. This setting can be updated, but it cannot be removed after it is set.
	# zone  			= "ChangeMeIfNecessaryIfItsNotGlobal" 		# (Optional) The preferred compute engine zone.

	database_version = var.db_database_version
	settings {
		tier = var.db_tier
	}
	deletion_protection = var.db_deletion_protection
}

    In dbinstance.tf file add your resource to create your database inside db instance

resource "google_sql_database" "database" {
	name = var.db_name
	instance = google_sql_database_instance.instance.name
}


    In variables.tf add your variables to make your resources more dynamic
    Run terraform init, terraform apply to apply your changes
    Check Gcloud and make sure your resources are created under team3-db-instance
    In Google Console, you will be able to find your db instance's Public IP address and also Connection name
    From SQL service, add a user to your database instance
    You can connect to your db instance from Cloud Shell by using gcloud sql connect team3-db-instance --user=mammadova --quiet command
    Connect to your database instance, use show databases; query and make sure your db is created. this db will be used for wordpress connection
    If you see your db inside your db instance, you should be good. Move on
