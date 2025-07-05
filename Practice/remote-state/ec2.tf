resource "aws_instance" "main" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
        Name = "ec2-terraform"
        Terraform = true

    }
    provisioner "local-exec" {
        command = "echo ${self.public_ip} > inventory.ini"

    }

    connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
    }

    provisioner "remote-exec" {
        when = destroy
        inline = [
            "sudo systemctl stop nginx"
        ]
    }
    
}



resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description= " Allowing all the incoming and outgoing traffic on the instance"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


    tags = {
        Name = " Terraform"
        Terraform = true 
    }
}