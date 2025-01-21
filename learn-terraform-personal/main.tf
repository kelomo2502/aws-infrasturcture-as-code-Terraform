provider "aws" {
  region = "us-east-1"
}

# Key Pair
resource "aws_key_pair" "frontend_key" {
  key_name   = "jenkins_server"
  public_key = file("~/.ssh/jenkins_server.pub") # Ensure this path points to your public key file
}

# EC2 Instance
resource "aws_instance" "frontend_instance" {
  ami                    = "ami-04b4f1a9cf54c11d0" # Amazon Linux 2 AMI
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.frontend_key.key_name
  subnet_id              = "subnet-0cd198b82cb0148a5"
  associate_public_ip_address = true

  # If no security group is specified, the default security group for the VPC is used.

  tags = {
    Name = "frontendApplicationServer"
  }
}

# Output the instance public IP
output "instance_public_ip" {
  value       = aws_instance.frontend_instance.public_ip
  description = "Public IP of the EC2 instance"
}

# Output the instance ID
output "instance_id" {
  value       = aws_instance.frontend_instance.id
  description = "Instance ID of the EC2 instance"
}
