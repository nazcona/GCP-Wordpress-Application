
output endpoint {
	value = google_sql_database_instance.instance.public_ip_address
}
output user_name {
	value = google_sql_user.users.name
}


output db_name {
	value = google_sql_database.database.name
}

output host_name {
	value = google_sql_user.users.host
}

