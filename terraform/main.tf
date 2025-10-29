terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  # authentication recommended via environment variables or shared credentials file
  # AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY should NOT be hard-coded here.
}

resource "aws_key_pair" "infra_key" {
  key_name   = "devops_assignment_key"
  public_key = file(var.ssh_public_key_path)
}

# Security Group (very permissive for lab; tighten for production)
resource "aws_security_group" "allow_all" {
  name        = "devops-assignment-sg"
  description = "Allow SSH & HTTP for lab"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create 4 EC2 instances: controller, manager, workerA, workerB (placeholders)
resource "aws_instance" "controller" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.infra_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = { Name = "controller" }
}

resource "aws_instance" "manager" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.infra_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = { Name = "swarm-manager" }
}

resource "aws_instance" "worker_a" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.infra_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = { Name = "swarm-worker-a" }
}

resource "aws_instance" "worker_b" {
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = aws_key_pair.infra_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  tags = { Name = "swarm-worker-b" }
}

# Allocate Elastic IPs and associate
resource "aws_eip" "manager_eip" {
  instance = aws_instance.manager.id
}

resource "aws_eip" "worker_a_eip" {
  instance = aws_instance.worker_a.id
}

resource "aws_eip" "worker_b_eip" {
  instance = aws_instance.worker_b.id
}

resource "aws_eip" "controller_eip" {
  instance = aws_instance.controller.id
}

output "controller_public_ip" {
  value = aws_eip.controller_eip.public_ip
}

output "manager_public_ip" {
  value = aws_eip.manager_eip.public_ip
}

output "worker_a_public_ip" {
  value = aws_eip.worker_a_eip.public_ip
}

output "worker_b_public_ip" {
  value = aws_eip.worker_b_eip.public_ip
}
