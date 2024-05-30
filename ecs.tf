resource "aws_ecs_cluster" "tuncay" {
  name = "tuncay"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode([
    {
      name      = "first"
      image     = "techtorialdevops/stackdemo"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
        }
      ]
    }
  ])

  volume {
    name      = "service-storage"
    host_path = "/ecs/service-storage"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "attribute:ecs.availability-zone in [us-east-2a, us-east-2b]"
  }
}

resource "aws_s3_bucket" "tuncay-ecs" {
  bucket = "tuncay-ecs-bucket"

  tags = {
    Name        = "tuncay-ecs"
    Environment = "Dev"
  }
}