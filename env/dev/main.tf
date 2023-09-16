module "web" {
  source = "../../modules/web"

  region  = var.region
  project = var.project
  env     = var.env
}

module "pipeline" {
  source = "../../modules/pipeline"

  region  = var.region
  project = var.project
  env     = var.env
}
