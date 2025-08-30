resource "aws_db_subnet_group" "main" {
  name        = "${var.name}-subnet-group"
  subnet_ids  = toset(data.aws_subnets.private.ids)
  description = "Subnet group for ${var.name} RDS instances"

  tags = {
    Name        = "${var.name}-subnet-group"
    Description = "Subnet group for ${var.name} RDS instances"
  }
}