resource "aws_db_instance" "main" {
  # Access Settings
  # ---------------
  # Put in a private subnet and not publicly accessible.
  db_name                      = var.name
  identifier                   = "${var.name}-instance"
  username                     = var.username
  password                     = var.password
  publicly_accessible          = false
  db_subnet_group_name         = aws_db_subnet_group.main.name
  network_type                 = "IPV4"
  vpc_security_group_ids       = [aws_security_group.db_access.id]

  # Instance Size
  # -------------
  # Smallest instance class we can set and set to single instance.
  instance_class               = "db.t4g.micro"
  multi_az                     = false

  # Engine
  # ------
  # The small instance size is only supported by postgres and mysql (no aurora).
  engine                       = "postgres"

  # Storage
  # -------
  # Minimum storage we can set on RDS use gp3 so it scales independently of
  # instance size. Also disable storage encryption so we don't need to pay for a
  # KMS key.
  allocated_storage            = 20
  max_allocated_storage        = 20
  storage_type                 = "gp3"
  storage_encrypted            = false

  # Backups
  # -------
  # Disable backups so we don't pay for their storage costs.
  backup_retention_period      = 0
  skip_final_snapshot          = true
  copy_tags_to_snapshot        = true

  # Updates
  # -------
  # Allowing updates does not cost anything and we assume having the latest
  # version means the DB will run as efficiently as possible.
  allow_major_version_upgrade  = true
  auto_minor_version_upgrade   = true
  apply_immediately            = true
  maintenance_window           = "Mon:00:00-Mon:03:00"

  # Monitoring
  # ----------
  # Disable any extra monitoring that may incur extra costs.
  performance_insights_enabled = false
  monitoring_interval          = 0
}