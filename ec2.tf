provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "tf_demo" {
  key_name   = "tf_demo"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4BAkUy0w+DfjAG+t15HqmIHUqjQqtmyItaN9yI85uG0TGfLUt7HNBvFgVRvWZc07sLb3P3KK4TOBvyNXcDfIxU7RWkWGsDqYUj5IgTx4aofFrPTiJYXgY131Isln3ZRUr0aTzL7kmzALkxJTB9CQ4OEQi610dVnpGuajQlHp3vszragl4tV54rWmqZWuqiZAKJ6Hj2QYH9Td/cetOupMx+KYzPbO6RFEH5x4j1IMydZKZQsD9bLecLuQqAdK4ygHU+5dr4uU9ZuqTtde+cvrbDe1v3m7U486ju3nSjypnwz24A/qC8o7cztKhJyoBut6ZpxrF/JvkDSsu1ZuX/9hGexIlG6AQ2JQ6SQqsWt1aIA1ElPefU32uTeKFBYdoXRwbTPImg8t6RL+QiFlV5SXJl6CjHbvGsQ+gUbwCQZ1uz6br/Y3kwDZbJrCjXrcvKMevGQT7duXjpCETR3ZrXyGfNA3Ko1pafRWKsSGZ4ULQmGbdB/vidi+kmYQbjKnXeK8= root@DESKTOP-SUMONLT"

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
