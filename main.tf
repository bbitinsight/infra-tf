terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = aws_key_pair.deployer.id
  tags = {
    Name = "terraform demo"
  }
  user_data = "${file("install_apache.sh")}"
}

resource "aws_key_pair" "deployer" {
  key_name   = "abc"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCxjLCChxe9LpR5C2VEr2r7uPK0PgC2peWMdCFPjOznsd6dJshYrISudsW/m+g2BUQ6Rg8o9yH2RburosziL4Wnocdm56Bo527GJ4NWrGR4K3uZv8Y9dsDOvtCuQc3YYpl32/WW5/twl/m1dLZKL73dm8AjjuSWsOGFNEa7WZa9wk8HLF/eMS8s9RzzXYOTcOggbONmyd3JrM5UGZ/5TTa5Omwi7kCouvBbT8x8MvJwcQOUnMbU9kqEZuIF+D2uzGpBJyUGqjO3HHatRN7+tYTpZ4SG9zHcghslSFNTkZDieRztY2cJYJZC9jKacTM5Pw2xisaNGHFukTzoZtjqSTJ0pPP0+JQnWO7eTyuZNdeb6KjxdzDOk4X3wDhNg1JLG6JfZ+hqW7xWoG0rhxP6UZTWrcUM0VA8V+JQYYyLgM/9HvUGnfWAM1Z/YJskk3Z2h4gs1qHuT6k6kUtL6RVkY8rVIvbQRBiGhxt+IdZbCr2TDgtE3vHIZK1qDC7vOQG68a0= ubuntu@ip-172-31-8-44"
}
