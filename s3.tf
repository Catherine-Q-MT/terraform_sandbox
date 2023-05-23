

resource "aws_s3_bucket" "dataBuckets" {
  count = length(var.bucket_list)
  bucket = "${var.bucket_prefix}${var.bucket_list[count.index]}"
}

resource "aws_s3_bucket_ownership_controls" "dataBuckets" {
  count = length(var.bucket_list)
  bucket = aws_s3_bucket.dataBuckets[count.index].bucket
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "dataBuckets" {
  count = length(var.bucket_list)
  depends_on = [aws_s3_bucket_ownership_controls.dataBuckets]

  bucket = aws_s3_bucket.dataBuckets[count.index].bucket
  acl    = "private"
}
