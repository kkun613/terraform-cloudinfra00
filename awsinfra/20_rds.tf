data "aws_rds_orderable_db_instance" "ysjang-rds" {
  engine         = "mysql"
  engine_version = "8.0.40"
  license_model  = "general-public-license"
  storage_type   = "gp2"
  instance_class = "db.t3.micro"
}
resource "aws_db_subnet_group" "ysjang-db-subnet" {
  name       = "ysjang-db-subnet"
  subnet_ids = [aws_subnet.ysjang-pria.id, aws_subnet.ysjang-pric.id, aws_subnet.ysjang-puba.id, aws_subnet.ysjang-pubc.id, aws_subnet.ysjang-dba.id, aws_subnet.ysjang-dbc.id]
  tags = {
    Name = "ysjang-db-subnet"
  }
}
resource "aws_db_instance" "ysjang-db" {
  identifier                   = "ysjang-db"
  db_name                      = "wordpress"
  allocated_storage            = 20
  storage_type                 = data.aws_rds_orderable_db_instance.ysjang-rds.storage_type
  engine                       = data.aws_rds_orderable_db_instance.ysjang-rds.engine
  engine_version               = data.aws_rds_orderable_db_instance.ysjang-rds.engine_version
  license_model                = data.aws_rds_orderable_db_instance.ysjang-rds.license_model
  instance_class               = data.aws_rds_orderable_db_instance.ysjang-rds.instance_class
  username                     = "root"
  password                     = "It12345!"
  parameter_group_name         = "default.mysql8.0"
  availability_zone            = "ap-northeast-2a"
  multi_az                     = false
  publicly_accessible          = true
  skip_final_snapshot          = true
  vpc_security_group_ids       = [aws_security_group.ysjang-sg.id]
  db_subnet_group_name         = aws_db_subnet_group.ysjang-db-subnet.name
  performance_insights_enabled = false
  storage_encrypted            = false
  auto_minor_version_upgrade   = false
  monitoring_interval          = 0
  backup_retention_period      = 0
  tags = {
    Name = "ysjang-db"
  }
}

