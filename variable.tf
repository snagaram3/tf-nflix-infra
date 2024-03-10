variable "name" {
    type = string
    default = ""
}

variable "vpc_id" {}

variable "bastion_ingress_cidr" {
    description = "IP cidr that allowed to access bastion ec2 instance"
    default     = ["0.0.0.0/0"] # Note: Please restrict your ingress to only necessary IPs. Opening to 0.0.0.0/0 can lead to security vulnerabilities.
}

variable "enable_http_to_workers" {
  
}

variable "worker_security_group_id" {
    type        = string
    default     = ""
}

variable "bastion_instance_type" {
    type = string
    default = ""
}

variable "key_name" {
  type = string
}

variable "public_subnets" {
    type = list(string)
    default = [ "" ]
}