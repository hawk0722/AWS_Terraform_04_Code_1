module "web" {
  source = "../../modules/web"

  region  = var.region
  project = var.project
  env     = var.env
}
