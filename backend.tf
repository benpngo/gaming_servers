terraform {
  cloud {
    organization = "Corvius"

    workspaces {
      name = "networking"
    }
  }
}
