variable "instance_type" {
  description = "Enter the size for the EC2. e.g t2.micro, t2.nano?"
  type        = string
  default     = null
}
variable "ami_info" {
  description = "Enter the information to fetch the AMI. e.g. ubuntu_22, rhel_8"
  type        = string
  default     = "ubuntu_22"
}
variable "key_name" {
  description = "Enter the Key Name, needed to access the EC2"
  default     = "kul"
}
variable "subnet_id" {
  description = "Enter the Subnet ID"
}
variable "security_groups" {
  description = "Enter security groups to be attached with the EC2. [\"default\",\"team_b2\"]"
}
variable "root_volume_size" {
  description = "Enter the size for the root volume. Please enter the value greater than 15."
  default     = null
}
variable "ebs_volume_size" {
  description = "Enter the size the data volume."
  default     = null
}