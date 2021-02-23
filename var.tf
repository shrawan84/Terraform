

variable "ami" {
  type = map(string)

  default = {
    ap-south-1     = "ami-0a9d27a9f4f5c0efc"
    ap-northeast-2 = "ami-07270d166cdf39adc"
  }
}
variable "instance_type" {
  default = "t2.micro"
}
variable "aws_region" {
  default = "ap-northeast-2"
}
