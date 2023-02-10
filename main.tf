data "aws_ami" "aws_ami" {
  owner       = ["554660509057"]
  most_recent = true
  filter {
    name   = "tag:Name"
    values = [local.ami_name]
  }
  filter {
    name   = "tag:Version"
    values = [local.ami_version]
  }
}
resource "aws_instance" "aws_instance" {
  ami             = data.aws_ami.aws_ami.id
  instance_type   = var.instance_type != null ? var.instance_type : "t2.micro"
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  tags = merge(
    local.common_tags,
    {
      Name = local.Name
    }
  )
  root_block_device {
    delete_on_termination = true
    volume_type           = "gp2"
    volume_size           = var.root_volume_size == null ? 15 : var.root_volume_size
    tags = merge(
      local.common_tags,
      {
        Name = local.Name
      }
    )
  }
}
resource "aws_ebs_volume" "aws_ebs_volume" {
  availability_zone = aws_instance.aws_instance.availability_zone
  size              = var.ebs_volume_size == null ? 5 : var.ebs_volume_size
  tags = merge(
    local.common_tags,
    {
      Name = local.Name
    }
  )
}
resource "aws_volume_attachment" "aws_volume_attachment" {
  device_name  = "/dev/sdf"
  volume_id    = aws_ebs_volume.aws_ebs_volume.id
  instance_id  = aws_instance.aws_instance.id
  skip_destroy = true
  force_detach = true
}
