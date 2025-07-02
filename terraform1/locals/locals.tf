locals {
    ami_name = data.aws_ami.devops-practice.id
    instance_type = "t3.micro"
    tag_name = "${var.project}-${var.compoonent}-${var.environment}"
}