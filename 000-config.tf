# Global variables

# Availability zone to spaws the infrastructure
variable "availability_zone" {
  description = "Availability zone of the infrastructure"
  default = "eu-west-2b"
}

variable "demo_eip" {
  description = "Public IP reserved"
  default     = "eipalloc-50b4771a"
}

# AMI
# For now: only outscale Centos 7 official AMI
variable "ami_ids" {
  description = "AMI IDs used by the infrastructure"
  type = "map"
  default = {
    demo         = "ami-d4f6551d"
  }
}

# Number of instances
variable "instances_num" {
  default = 3
  description = "Counter for instances"
}

# Account information
# Fill the value in terraform.tfvars
variable "access_key" {
  description = "AK"
}

variable "secret_key" {
  description = "SK"
}

variable "public_ssh_key" {
  description = "SSH public key used to connected to the instances"
}

# Configuration provider : Outscale
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "eu-west-2"

  endpoints {
    ec2 = "https://fcu.eu-west-2.outscale.com"
    iam = "https://fcu.eu-west-2.outscale.com"
    elb = "https://fcu.eu-west-2.outscale.com"
    s3  = "https://osu.eu-west-2.outscale.com"
  }

  # outscale specific
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  insecure                    = true
}
