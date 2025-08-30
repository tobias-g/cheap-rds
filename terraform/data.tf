data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  tags = {
    Tier = "Exposure"
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.example.ids)
  id       = each.value
}