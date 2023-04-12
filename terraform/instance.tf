resource "aws_instance" "myec2" {
    ami           = var.Ami_id
    instance_type = var.instance_type
    root_block_device {
    volume_size           = var.root_block_size
    volume_type           = var.root_block_type
    encrypted             = true
    delete_on_termination = true

  }
    ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.ebs_block_size
    volume_type           = var.ebs_block_type
    encrypted             = "true"
    delete_on_termination = true
  }
}

