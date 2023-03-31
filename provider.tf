terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = ">= 2.14.0"
    }
  }
}

provider "kubernetes" {
  # Configuration options
  config_path    = "/Users/oluwabukunmi/GITREPOS/goproject/.kube/config"
  
}