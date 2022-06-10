# Instance
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



# Database User Info
resource "google_sql_user" "users" {
  name     = var.user_name
  instance = google_sql_database_instance.instance.name
  host     = "kemalkubanov.com"
  password = var.user_password
}

# Database
resource "google_sql_database" "database" {
	name = var.db_name
	instance = google_sql_database_instance.instance.name
}

