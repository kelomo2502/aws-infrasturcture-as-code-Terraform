variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "MyDeploymentServer"
}

variable "ami" {
  description = "This is the amazom machine image"
  type        = string
  default     = "ami-04b4f1a9cf54c11d0"
}
