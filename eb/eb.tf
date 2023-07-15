provider "aws" {
  region = "ap-south-1"  # Set your desired region
}

resource "aws_elastic_beanstalk_application" "tftest" {
  name        = "tftest-app"  # Set your desired application name
  description = "tftest-app Elastic Beanstalk Application"
}

resource "aws_elastic_beanstalk_environment" "example" {
  name                = "example-env"  # Set your desired environment name
  application         = aws_elastic_beanstalk_application.example.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.3 running PHP 8.1"  # Set the desired solution stack for PHP 8.1
  # Alternatively, you can use `platform_arn` instead of `solution_stack_name` for more control over platform version.

  # Custom configuration
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "Custom configuration"  # Use Single Instance environment type
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "KeyName"
    value     = "rajmumbai"  # Set the name of your EC2 key pair
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-0e71241ea27b82753"  # Set the ID of your desired VPC
  }

  # Instance settings
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "t2.micro"  # Set the desired instance type
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "EnableDedicatedTenancy"
    value     = "false"  # Set to true if you require dedicated tenancy
  }

  setting {
    namespace = "aws:ec2:instances"
    name      = "ProxyServer"
    value     = "Apache"  # Set the proxy server details
  }

  # Load balancer settings
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"  # Use an Application Load Balancer
  }

  # Availability Zone selection
  setting {
    namespace = "aws:autoscaling:asg"
    name      = "Availability Zones"
    value     = "ap-south-1a, ap-south-1b"  # Set the desired availability zones
  }

  # Additional manual configuration settings can be added as needed

  tags = {
    Name = "example-env"  # Set your desired tags
  }
}
