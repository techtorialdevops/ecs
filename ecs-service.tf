resource "aws_ecs_service" "wordpress" {
  name            = "wordpress-service"
  cluster         = aws_ecs_cluster.wordpress_cluster.id
  task_definition = aws_ecs_task_definition.wordpress.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  network_configuration {
    subnets          = module.vpc.public_subnets
    security_groups  = [module.alb.alb_sg_id]
    assign_public_ip = true
  }
  load_balancer {
    target_group_arn = module.alb.target_group_arn
    container_name   = "wordpress"
    container_port   = 80
  }
  depends_on = [aws_lb_listener.http]
}
