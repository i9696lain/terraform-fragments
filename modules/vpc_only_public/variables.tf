variable "author" {
  type = string
}

variable "cidr_block" {
  type = string
}

variable "subnet_cidrs" {
  type = map(string)
}
