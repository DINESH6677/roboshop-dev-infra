# module "catalogue" {
#   source = "terraform-aws-modules/security-group/aws"

#   name        = "${local.common_suffix_name}-catalogue"
#   use_name_prefix = false
#   description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
#   vpc_id      = data.aws_ssm_parameter.vpc_id.value
# }

module "sg" {
  count = length(var.sg_name)
  source = "git::https://github.com/DINESH6677/terraform-sg.git?ref=main"
  project_name = var.project_name
  environment = var.environment
  sg_name = var.sg_name[count.index]
  sg_description = "created for ${var.sg_name[count.index]}"
  vpc_id = local.vpc_id

}

# resource "aws_security_group_rule" "frontend_frontend_alb" {
#    type              = "ingress"
#    security_group_id = module.sg[9].sg_id # frontend SG ID
#    source_security_group_id = module.sg[11].sg_id # frontend ALB SG ID
#    from_port         = 80
#    protocol          = "tcp"
#    to_port           = 80
#  }