resource "aws_db_instance" "example" {
  identifier_prefix = var.db_name
  engine = "mysql"
  allocated_storage = 10
  instance_class = "db.t2.micro"
  name = var.db_name
  username = "admin"
  # How should we set the password? password = "???"
  password = lookup(jsondecode(data.aws_secretsmanager_secret_version.db_password_map.secret_string), "password", "{}{\"}")
  skip_final_snapshot = true
}

data "aws_secretsmanager_secret_version" "db_password_map" {
  secret_id = var.db_password_secret_id
}