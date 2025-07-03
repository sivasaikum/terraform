variable "environment" {
    default = "dev"
}

variable "names" {
    default = ["mysql","backend","frontend"]
}

variable "domain_name" {
    default = "jobsearchindia.online"
}

variable "common_tags" {
    default = {
        environment = "dev"
        project = "expense"
    }
}