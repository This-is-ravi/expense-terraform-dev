variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags"{
    default = {
        project = "expense"
        environment = "dev"
        terraform = "true"
    }
}

variable "db_sg_description" {
  default = "SG for DB MySQL Instances"
}
