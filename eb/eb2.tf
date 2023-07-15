provider "aws" {
  region = "us-east-1"  # Set your desired region
}

resource "aws_elastic_beanstalk_application" "example" {
  name        = "example-app"  # Set your desired application name
  description = "Example Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_environment" "example" {
  name        = "example-env"  # Set your desired environment name
  application = aws_elastic_beanstalk_application.example.name

  # Custom configuration options
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"  # Specify the IAM instance profile to be used
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = "your-ec2-key-pair"  # Specify your EC2 key pair
  }

  # VPC and Subnet selection
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "your-vpc-id"  # Specify your VPC ID
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-1,subnet-2"  # Specify the subnet IDs you want to use
  }

  # Instance settings
  setting {
    namespace = "aws:ec2:instances"
    name      = "InstanceTypes"
    value     = "t3.micro"  # Set your desired instance type(s)
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "AssociatePublicIpAddress"
    value     = "true"  # Enable public IP address for instances
  }

  # Load balancer selection
  setting {
    namespace = "aws:elbv2:loadbalancer"
    name      = "LoadBalancerType"
    value     = "application"  # Use an Application Load Balancer
  }

  # Availability Zone selection
  setting {
    namespace = "aws:ec2:instances"
    name      = "Availability Zones"
    value     = "us-east-1a,us-east-1b"  # Specify the availability zones you want to use
  }

  # Proxy server configuration
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "http_proxy"
    value     = "http://your-proxy-server:port"  # Specify your proxy server details
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "https_proxy"
    value     = "http://your-proxy-server:port"  # Specify your proxy server details
  }

  # Additional manual configuration settings can be added as needed

  tags = {
    Name = "example-env"  # Set your desired tags
  }
}
