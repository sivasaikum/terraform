variable "sg_tags" {
    type = map
    default = {
        Name = "expense-dev"
        component = "backend"
    }
}


variable "ec2_tags" {
    type = map
    default = {
        environment = "dev"
        component = "backend"
        terraform =  true
    }
}
