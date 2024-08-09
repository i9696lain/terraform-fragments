module "network" {
  source = "../../modules/vpc_with_nat"

  author     = var.author
  cidr_block = "172.64.0.0/16"
  subnet_cidrs = {
    public_1a  = "172.64.1.0/24"
    public_1c  = "172.64.2.0/24"
    private_1a = "172.64.3.0/24"
    private_1c = "172.64.4.0/24"
  }
}
