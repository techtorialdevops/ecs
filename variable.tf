variable "region" {
  default = "us-east-1"
}

variable "db_name" {
  default = "wordpress"
}

variable "db_user" {
  default = "admin"
}

variable "db_password" {
  default = "password"
}

variable "db_allocated_storage" {
  default = 20
}

variable "db_instance_class" {
  default = "db.t2.micro"
}

variable "db_engine" {
  default = "mysql"
}

variable "db_engine_version" {
  default = "5.7"
}
