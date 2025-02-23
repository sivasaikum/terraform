resource "aws_instance" "demo" {
    ami             = local.ami_name
    instance_type   = local.instance_type
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    tags = {
        Name = local.tag_name
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