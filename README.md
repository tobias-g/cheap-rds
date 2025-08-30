# Cheap RDS

Amazons Relational Database Service (RDS) can get pretty expensive pretty quick.

This repo is the Terraform code needed to spin up and RDS instance (PostgreSQL)
as cheaply as possible. Only intended to be used as a dev or sandbox instance as
we sacrifice scalability, reliability, monitoring and speed.

## Overview of Configuration

- `db.t4g.micro` instance used as its the cheapest available
- Use PostgreSQL but not the Aurora version so we can use the tiny instance
- Single instance only sacrificing durability & availability
- No performance insights enabled sacrificing extra monitoring
- Self managed credentials so we don't pay extra for secrets manager
- General purpose SSD 20GB storage