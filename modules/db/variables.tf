variable "source_sgs" {
  description = "source security groups for use in rds security groups"
  type = string
}

variable "rds_username" {
  description = "default db username"
  type = string
}

variable "rds_password" {
  description = "default db password"
  type = string
}
