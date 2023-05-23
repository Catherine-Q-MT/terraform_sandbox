variable "bucket_prefix" {
  description = "bucket name prefix"
  type        = string
  default     = "cq-bucket-"

}

variable "bucket_list" {
  description = "list of bucket names"
  type        = list(any)
  default     = ["bronze", "silver", "gold"]
}