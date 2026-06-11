terraform {
  backend "s3" {
    bucket = "qlee-eks" 
    key    = "eks/state"
    region = "eu-central-1"
  }
}