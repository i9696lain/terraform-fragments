module "network" {
  source = "../../modules/vpc_only_public"

  author     = var.author
  cidr_block = "172.64.0.0/16"
  subnet_cidrs = {
    public_1a = "172.64.1.0/24"
    public_1c = "172.64.2.0/24"
  }
}
