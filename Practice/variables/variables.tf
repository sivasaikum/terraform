variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
   default = "t3.micro"
}

variable "tags" {
  default = {
    Name = "Terraform -ec2"
  }
}

variable "sg_tags" {
  default = {
    Name = "Terraform_sg"
  }
}

