
variable "db_name" {
  description = "The name of the database"
  type = string
}

variable "db_password_secret_id" {
  description = "The secret id of where you're storing the db password"
  type = string
}