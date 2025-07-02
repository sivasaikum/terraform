resource "aws_instance" "demo" {
    ami             = data.aws_ami.devops-practice.id
    instance_type   = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
        Name = "terraform-demo1"
    }
}


resource "aws_security_group" "allow_tls" {
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
}