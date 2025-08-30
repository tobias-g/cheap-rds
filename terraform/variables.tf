variable "name" {
  type        = string
  description = "Name to use for the database instance"
  default     = "database"
}

variable "subnets" {
  type        = list(string)
  description = "List of subnets to deploy the DB instances to"
}

variable "vpc_id" {
  type        = string
  description = "VPC to deploy the DB instances to"
}