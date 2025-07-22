variable "user_names" {
    description = "List of user names"
    type        = list(string)
    default = ["user1","user2","user3" ]
}

#foreach
resource "aws_iam_user" "name" {
  count = length(var.user_names)
  name = var.user_names[count.index]
}

resource "aws_s3_bucket" "name" {
    count = length(var.user_names)
    bucket = "my-tf-test-bucketsss-${var.user_names[count.index]}" # Ensure the bucket name is globally unique
    tags = {
      bucket_name = var.user_names[count.index]
      Environment = "Dev"
    }
  
}   