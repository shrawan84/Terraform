provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "tf_demo" {
  key_name   = "tf_demo"
  public_key = "${file("tf-demo.pub")}"

}

resource "aws_instance" "my-instance" {
  ami           = lookup(var.ami, var.aws_region)
  instance_type = var.instance_type
  key_name      = aws_key_pair.tf_demo.key_name
  user_data     = file("install_httpd.sh")

  tags = {
    Name  = "Terraform"
    Batch = "7Am"

  }
}
