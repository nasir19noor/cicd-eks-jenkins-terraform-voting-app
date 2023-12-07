
module "required_tags" {
  source        = "../../modules/terraform-tags"
  automation    = "terraform"
  business_unit = "voting"
  application   = "voting-app"
  repo_url      = "https://github.com/nasir19noor/cicd-eks-jenkins-terraform-voting-app"
  repo_path     = "prod/ap-southeast-1/containers/ecr"
}


module "aws_ecr_repo_app" {
  source = "../../modules/ecr"

  image_tag_mutability         = var.image_tag_mutability
  name                         = var.app_repo_name
  encryption_configuration     = var.encryption_configuration
  image_scanning_configuration = var.image_scanning_configuration
  timeouts                     = var.timeouts
  tags = merge(
    { Name : var.app_repo_name },
    module.required_tags.tags
  )
}
