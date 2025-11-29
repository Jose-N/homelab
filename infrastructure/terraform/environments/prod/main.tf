module "infra_main" {
  source          = "../../modules/vm"
  vmid            = 100
  name            = "Infra Main"
  target_node     = var.target_node
  cores           = 1
  memory          = 1024
}
