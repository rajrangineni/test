resource "aws_s3_bucket" "remote" {
    bucket = "statefile-store4"
  
}
resource "aws_s3_bucket_versioning" "versioning_example" {
    bucket = aws_s3_bucket.remote.id
    versioning_configuration {
      status = "Enabled"
    }
  
}