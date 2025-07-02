variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "project" {
    default = "expense"

}

variable "compoonent" {
    default = "backend"
}

variable "environment" {
    default = "dev"
}


/* variable "name" {
    default = "${var.project}-${var.compoonent}-${var.environment}"
} */