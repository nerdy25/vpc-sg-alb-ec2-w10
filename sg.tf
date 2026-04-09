resource "aws_security_group" "sg1" {
  name        = "webserver-sg"
  description = "Allow http"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description     = "allow http"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.sg2.id] # allow traffic from ALB sg
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    env                  = "Dev"
    created-by-terraform = "yes"
  }
}


resource "aws_security_group" "sg2" {
  name        = "alb-sg"
  description = "Allow http and https"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "allow http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ALB accepts public traffic, no security_groups needed
  }

  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # ALB accepts public traffic, no security_groups needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    env                  = "Dev"
    created-by-terraform = "yes"
  }
}