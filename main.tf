
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

resource "aws_s3_bucket" "bronzeBucket" {
    bucket = "cq-bucket-bronze" 
}

resource "aws_s3_bucket_ownership_controls" "bronzeBucket" {
  bucket = aws_s3_bucket.bronzeBucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [aws_s3_bucket_ownership_controls.bronzeBucket]

  bucket = aws_s3_bucket.bronzeBucket.id
  acl    = "private"
}