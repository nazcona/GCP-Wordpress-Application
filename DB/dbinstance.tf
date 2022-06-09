resource "google_sql_database" "database" {
	name = var.db_name
	instance = google_sql_database_instance.instance.name
}

resource "google_sql_database_instance" "instance" {
	name = var.db_name
	region = var.db_region
	database_version = var.db_database_version
	settings {
		tier = var.db_tier
	}
	deletion_protection = var.db_deletion_protection
}

resource "google_sql_user" "users" {
  name     = var.user_name
  instance = google_sql_database_instance.instance.name
  host     = var.user_host
  password = var.user_password
}

# database_version
# tier
# settings.database_flags 
	#	name
	#	value
# settings.active_directory_config
	#	domain
# settings.ip_configuration.authorized_networks[]
	#	value
# clone
	#	source_instance_name
# restore_backup_context
	#	backup_run_id

