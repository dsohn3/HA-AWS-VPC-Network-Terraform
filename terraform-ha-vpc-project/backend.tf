# Store the Terraform state file in S3
terraform {
  backend "s3" {
    bucket  = "terraform-ha-vpc"
    key     = "terraform-ha-vpc-project.tfstate" #The unique name that Terraform will store our statefile
    region  = "us-east-1"
    profile = "terraform-user"
  }
}