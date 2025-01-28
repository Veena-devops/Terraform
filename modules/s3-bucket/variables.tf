variable "region" {
  description = "region where bucket will be created"
  type        = string
}
variable "bucket" {
  description = "bucket name"
  type        = string
}
variable "tags" {
  description = "tags for the bucket"
  type        = map(string)
}
