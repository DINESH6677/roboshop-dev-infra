locals {
    ami_id = data.aws_ami.instance.id

    common_tags = {
        Project = var.project_name
        Environment = var.environment
        Terraform = "true"
    }
    common_name_suffix = "${var.project_name}-${var.environment}"
}