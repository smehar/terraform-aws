variable "size_storage" {
  type        = number
  description = "set ebs storage size"
  default     = 1
}

variable "a_zone" {
  type        = string
  description = "set availiability zone"
  default     = "us-east-1a"
}