#Configure AWS Provider
provider "aws" {
  region  = var.region
  profile = "terraform-user"
}

#Create VPC
module "vpc" {
  source                   = "../modules/vpc"
  region                   = var.region
  project_name             = var.project_name
  vpc_cidr                 = var.vpc_cidr
  public-sn-az1-cidr       = var.public-sn-az1-cidr
  public-sn-az2-cidr       = var.public-sn-az2-cidr
  private-app-sn-az1-cidr  = var.private-app-sn-az1-cidr
  private-app-sn-az2-cidr  = var.private-app-sn-az2-cidr
  private-data-sn-az1-cidr = var.private-data-sn-az1-cidr
  private-data-sn-az2-cidr = var.private-data-sn-az2-cidr

}