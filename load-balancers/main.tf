# Configure the AWS provider
provider "aws" {
  region = "eu-north-1"
}


# Create a Security Group for an ALB listening on banking.app.com
resource "aws_security_group" "app_alb" {
  name = "application-alb"
  description = "Security group for external application load balancer"
  vpc_id      = var.vpc_id
  tags = {
    Source = "terraform"
  }
  ingress {
    from_port	  = 443
	  to_port		  = 443
	  protocol	  = "tcp"
	  cidr_blocks	= ["0.0.0.0/0"]
  }

  egress {
    from_port	  = 0
	  to_port		  = 0
	  protocol	  = "-1"
	  cidr_blocks	= ["0.0.0.0/0"]
  }
}

import {
  id = "sg-04b57b44811cc4258"
  to = aws_security_group.app_alb
}



# Create a Security Group for an ALB listening on grafana-aws.app.com
resource "aws_security_group" "grafana_alb" {
  name = "grafana-alb"
  description = "Security group for internal grafana load balancer"
  vpc_id      = var.vpc_id
  tags = {
    Source = "terraform"
  }
  ingress {
    from_port	  = 443
    to_port		  = 443
    protocol	  = "tcp"
    cidr_blocks	= ["10.81.64.0/24"]
  }

  egress {
    from_port	  = 0
    to_port		  = 0
    protocol	  = "-1"
    cidr_blocks	= ["0.0.0.0/0"]
  }
}

import {
  id = "sg-07d2863f7ce2a771f"
  to = aws_security_group.grafana_alb
}
