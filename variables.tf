variable "db_username" {
  description = "rds db default admin"
  type = string
}

variable "db_password" {
  description = "rds db default password"
  type = string
}

variable "region" {
  description = "region in which to deploy the services"
  type = string
}

