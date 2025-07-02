data "aws_security_group" "existing_sg" {
    id = "sg-000de32ed8df5bbca"
}


resource "aws_instance" "demo" {
    ami             = "ami-09c813fb71547fc4f"
    instance_type   = "t3.micro"
    vpc_security_group_ids = [data.aws_security_group.existing_sg.name]
    tags = {
        Name = "terraform-provisioner"
    }


    provisioner "local-exec" {
        command = "echo ${self.private_ip} > inventory.ini" # self is the keyword for local-exec
    }

    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",
        ]
    }

    provisioner "remote-exec" {
        inline = [
            "sudo systemctl stop nginx",
        ]
    }
}


/* resource "aws_security_group" "allow_tls" {
    name            = "allow_tls"
    description     = "Allow TLS all inbound & outbound traffic"

    ingress {
        from_port = 22
        to_port   = 22
        protocol  = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_tls"
    }
} */