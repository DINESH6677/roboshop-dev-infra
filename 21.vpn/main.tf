resource "aws_instance" "open_vpn" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.open_vpn_sg_id]
  subnet_id = local.public_subnet_ids
  user_data = file("vpn.sh")


  tags = merge(
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-open_vpn"
    }
  )
}

resource "aws_route53_record" "open_vpn" {
  zone_id = var.zone_id
  name    = "open_vpn.${var.domain_name}" # openvpn.devopswithdinesh.shop
  type    = "A"
  ttl     = 1
  records = [aws_instance.open_vpn.public_ip]
  allow_overwrite = true
}

