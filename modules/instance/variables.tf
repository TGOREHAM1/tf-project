variable "instance_key_pair" {
    description = "existing EC2 Key Pair"
    type = string
}

variable "instance_name" {
    description = "name of EC2 instance"
    type = string  
}

variable "instance_profile" {
    description = "instance profile attached to the instance"
    type = string  
}

variable "security_groups" {
    description = "security groups to assign to the instance"
    type = string
}


