variable "author" {
  default = "author"
}

variable "sample_cidrs_A" {
  default = [
    "172.64.1.1/32",
  ]
}

variable "sample_cidrs_B" {
  default = [
    "172.64.1.2/32",
    "172.64.1.3/32",
  ]
}
