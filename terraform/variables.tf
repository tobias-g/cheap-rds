variable "name" {
  type        = string
  description = "Name to use for the database instance"
  default     = "database"
}

variable "vpc_id" {
  type        = string
  description = "VPC to deploy the DB instances to"
}

variable "username" {
  type = string
  description = "Database username"
  default = "master"
}

variable "password" {
  type = string
  description = "Database password"
  sensitive = true
}