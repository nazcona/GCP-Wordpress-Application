# GCP-Wordpress-Application

### VPC module

>    In this project, we used regional VPC, because it provided us managed in specific virtual network of our Gcloud resources through subnets.

Steps:

1.    Create `vpc.tf` file in folder with `.gitignore` and `README.md` files
2.    Use `google_compute_network` resource to create the vpc
```
resource "google_compute_network" "vpc_network" {
   name = "vpc-network"
   auto_create_subnetworks = "true"
   routing_mode = "Regional"
}
```
3.    Open integrated terminal for this folder

4.    DO NOT FORGET to set the project first, otherwise your resources won't be created under your project in GCP

5.    Command for setting the project: `gcloud config set project [PROJECT_ID]`

6.  Run `terraform init` command to initialize it

7.  Run `terraform plan` and see if you have any syntax error

8.   Run `terraform apply` to apply your changes

9.    Go to Google Console and check if your VPC is created under the name of ``vpc-network``

Note: there is also Default VPC in GCP. Please find your newly created VPC

### Database

>    Google Cloud SQL is managed database service and it allows us to run MySQL, PosgreSQL on GCloud.

1.  In Cloud Shell under your repo folder, create a folder `DB` and add terraform files in it - `dbinstance.tf`, `variables.tf` and `provider.tf`

2.  In `dbinstance.tf` add your resources to create your database instance. Use `google_sql_database_instance` resource for this:

```
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
```

3.    In `variables.tf` add your variables to make your resources more dynamic
4.    Run `terraform init`, `terraform apply` to apply your changes
5.    Check Gcloud and make sure your resources are created under ``instance``
6.    In Google Console, you will be able to find your db instance's Public IP address and also Connection name
7.    From SQL service, add a user to your database instance
8.    You can connect to your db instance from Cloud Shell by using gcloud sql connect 
'mysql -h instance --user=team3 --quiet command'
9.    Connect to your database instance, use show databases; query and make sure your db is created. this db will be used for wordpress connection
10.    If you see your db inside your db instance, you should be good. Move on

### Autoscaling

>    For handling increasings in traffic dynamically we used Autoscaling. It's adding/reducing capacity.

1.  Create `asg.tf` file and add `google_compute_autoscaler` resource inside the file. Use gcloud compute images list command to list of available images in GCloud. For ex: we used centos-cloud/centos-7


    2.  Add `google_compute_instance_template` resource in `asg.tf` file. No matter how many instances are in your instance group, they will be created from this template. Use gcloud compute machine-types list command to list all available machine types in GCloud.

    3.  Also add your `google_compute_instance_group_manager`, `google_compute_target_pool`, resource in `asg.tf` file and targets groups.

    4.  Add `variables.tf` file inside your ASG folder. Variables file will allow you to have your scripts more dynamic. Instead of hardcoding the data inside your resources, `variables.tf` file will give you opportunity to keep your data inside it and fetch from another file as long as the files share same root.
    
    5.  Add ``startup.sh`` file for bootstrapping. It means whatever command like you in this file, it will be launching during the instance provisioning. Please see `metadata_startup_script = file("startup.sh")` line under `google_compute_instance_template`