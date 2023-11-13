resource "random_password" "user" {
  for_each = local.users

  length = 48
}

resource "google_sql_user" "user" {
  for_each = local.users

  instance = google_sql_database_instance.instance.name
  name     = each.value.name
  host     = each.value.host
  password = random_password.user[each.key].result
}
