resource "aws_instance" "main" {
    ami = local.ami_id
    instance_type = local.instance_type
    vpc_security_group_ids = [aws_security_group.sg.id]

    tags = merge (
        var.ec2_tags,
        {
            Name = "expense-dev-backend"
        }
    )
}




resource "aws_security_group" "sg" {
    name = "sg"
    description = "Allowing all the traffic"

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

    tags = var.sg_tags
}