terraform {
  required_providers {
    btp = {
      source  = "SAP/btp"
      version = "1.19.0"
    }
  }
}

provider "btp" {
  globalaccount = var.globalaccount
}