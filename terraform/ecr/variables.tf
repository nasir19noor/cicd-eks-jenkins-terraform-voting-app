variable "name" {
  type = string
  default = "cicd-eks-terraform-jenkins-voting-app"
}

variable "app_repo_name" {
  type = string
  default = "cicd-eks-terraform-jenkins-voting-app"
}

variable "image_tag_mutability" {
  type = string
  description = "The ECR image tag mutability."
  default = null
}

variable "tags" {
  type = map(string)
  description = "A map of tags to assign to the ECR repository."
  default = {}
}

variable "encryption_configuration" {
  description = "nested mode: NestingList, min items: 0, max items: 0"
  type = set(object(
    {
      encryption_type = string
      kms_key         = string
    }
  ))
  default = []
}

variable "image_scanning_configuration" {
  description = "nested mode: NestingList, min items: 0, max items: 1"
  type = set(object(
    {
      scan_on_push = bool
    }
  ))
  default = [
    {
      scan_on_push = true
    }
  ]
}

variable "timeouts" {
  description = "nested mode: NestingSingle, min items: 0, max items: 0"
  type = set(object(
    {
      delete = string
    }
  ))
  default = []
}