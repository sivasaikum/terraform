variable "instance_name" {
  type        = list
  default     = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z09576191Z5VQH6BJ1P7O"
}

variable "domain_name" {
    default = "jobsearchindia.online"
}

variable "common_tags" {
    type = map
    default = {
        env = "dev"
        project = "expense"
    }
}