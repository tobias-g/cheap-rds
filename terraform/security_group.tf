resource "aws_security_group" "db_access" {
  name        = "${var.name}-db-access"
  description = "Allow database access from private subnets"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.name}-db-access"
    Description = "Allow database access from private subnets"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_private_subnet_access" {
  for_each          = data.aws_subnet.private
  security_group_id = aws_security_group.db_access.id
  cidr_ipv4         = each.value.cidr_block
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}
