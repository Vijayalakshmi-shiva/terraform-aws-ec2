output "public_ip" {
  value = aws_instance.aws_instance.public_ip
}
output "private_ip" {
  value = aws_instance.aws_instance.private_ip
}
output "instance_id" {
  value = aws_instance.aws_instance.id
}
output "instance_arn" {
  value = aws_instance.aws_instance.arn
}