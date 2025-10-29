variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-0c94855ba95c71c99" # Ubuntu 20.04 LTS (example) - replace with your region's AMI
}

variable "ssh_public_key_path" {
  description = "Path to your SSH public key to create the AWS keypair (local file)"
  type = string
  default = "~/.ssh/id_rsa.pub"
}
