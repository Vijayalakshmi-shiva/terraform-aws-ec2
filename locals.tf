locals {
  ami_info    = split("_", var.ami_info)
  ami_name    = local.ami_info[0]
  ami_version = local.ami_info[1]
  Name        = "${var.Vendor}-${var.Trainer}-${var.Client}"
  common_tags = {
    Client  = var.Client
    Trainer = var.Trainer
    Vendor  = var.Vendor
  }
}