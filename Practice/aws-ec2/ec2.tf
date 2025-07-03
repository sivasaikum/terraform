resource "aws_instance" "main" {
    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
        Name = "ec2-terraform"
        Terraform = true

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