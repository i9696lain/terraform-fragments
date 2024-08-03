output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = {
    public_1a  = aws_subnet.public_1a.id
    public_1c  = aws_subnet.public_1c.id
  }
}

output "subnet_ids" {
  value = {
    public  = [aws_subnet.public_1a.id, aws_subnet.public_1c.id]
  }
}
