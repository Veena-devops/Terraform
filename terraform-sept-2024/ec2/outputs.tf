# output "public-ip" {
#  #value = <resource_type>.<resource_name>.<identifiers>
#  value = aws_instance.ec2-instance.public_ip
# }

# output "instance-id" {
#  #value = <resource_type>.<resource_name>.<identifiers>
#  value = aws_instance.ec2-instance.id
# }

output "public-ip" {
 #value = <resource_type>.<resource_name>.<count_index>.<identifiers>
 value = aws_instance.ec2-instance.public_ip
}