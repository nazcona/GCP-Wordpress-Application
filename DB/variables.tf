
		variable "db_name = "gcp-project"
		variable "db_region = "us-central1"
		variable "db_tier = "db-f1-micro"
		variable "db_deletion_protection = "false"
		variable "db_database_version = "MYSQL_8_0"


variable "user_name" {
  description = "The name of the default user"
  type        = string
  default     = "default"
}

variable "user_host" {
  description = "The host for the default user"
  type        = string
  default     = "%"
}

variable "user_password" {
  description = "The password for the default user. If not set, a random one will be generated and available in the generated_user_password output variable."
  type        = string
  default     = ""
}
