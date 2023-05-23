
resource "aws_s3_bucket" "bronzeBucket" {
  bucket = "cq-bucket-bronze"
}

resource "aws_s3_bucket_ownership_controls" "bronzeBucket" {
  bucket = aws_s3_bucket.bronzeBucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "bronzeBucket" {
  depends_on = [aws_s3_bucket_ownership_controls.bronzeBucket]

  bucket = aws_s3_bucket.bronzeBucket.id
  acl    = "private"
}
