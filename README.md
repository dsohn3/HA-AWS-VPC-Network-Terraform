# 3-Tier AWS VPC Network Deployment with Terraform

## Overview
This is a Terraform script that fully automates the deployment of an AWS VPC network complete with public and private subnets spread across two AZs to provide better fault tolerance and availability as well as an IGW and route table.

## Notes for Installation
The variable names for the network architecture are already inputted but you will need to modify variables in the `/t3-vpc-tf/terraform-ha-vpc-project` folder:
* `terraform.tfvars` to make adjustments to the region, CIDRs, and project name.
* `main.tf` to adjust `profile`
* `backend.tf` to adjust the S3 bucket to properly store

## Author's Notes
Overall this was a great introduction to IaaC through AWS and Terraform and I definitely want to continue to grow my depth in Terraform as it is so much easier and convenient to deploy network architecture this way instead of running them manually.  I'm planning on adding more features to this project such as adding a load balancer and launching a Wordpress website as I learn more about Terraform.
