output "region" {
  value = var.region
}

output "project_name" {
  value = var.project_name
}

output "vpc_id" {
  value = aws_vpc.vpc-1.id
}

output "public_sn_az1_id" {
  value = aws_subnet.public-sn-az1.id
}

output "public_sn_az2_id" {
  value = aws_subnet.public-sn-az2.id
}

output "private_app_sn_az1_id" {
  value = aws_subnet.private-app-sn-az1.id
}

output "private_app_sn_az2_id" {
  value = aws_subnet.private-app-sn-az2.id
}

output "private_data_sn_az1_id" {
  value = aws_subnet.private-data-sn-az1
}

output "private_data_sn_az2_id" {
  value = aws_subnet.private-data-sn-az2
}

output "igw-1" {
  value = aws_internet_gateway.igw-1 
}
