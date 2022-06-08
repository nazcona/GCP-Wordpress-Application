variable "config" {
	type = map(any)
	default = {
		name = "team3-db-instance"
		region = "us-central1"
		tier = "db-f1-micro"
		deletion_protection = "false"
		database_version = "MYSQL_8_0"
	}
}