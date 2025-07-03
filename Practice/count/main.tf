resource "aws_instance" "expense" {
    count = 3
    ami = "ami-09c813fb71547fc4f"
    instance_type = var.environment == "prod" ? "t3.large" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.expense.id]

    tags = merge(
        var.common_tags,
        {
            Name = var.names[count.index]
        }
    )
}

resource "aws_security_group" "expense" {
    name = "expense"
    
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
        Name = "Count-sg"
    }
}

# output "aws_info" {
#   value       = aws_instance.expense
# }
