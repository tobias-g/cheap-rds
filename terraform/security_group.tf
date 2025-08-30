resource "aws_security_group" "db_access" {
  name        = "${var.name}-db-access"
  description = "Allow database access from private subnets"
  vpc_id      = var.vpc_id

  tags = {
    Name        = "${var.name}-db-access"
    Description = "Allow database access from private subnets"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  for_each          = toset(data.aws_subnet.private.cidr_block)
  security_group_id = aws_security_group.db_access.id
  cidr_ipv4         = each.value
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}
