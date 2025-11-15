resource "kubernetes_namespace" "myapp" {
  metadata {
    name = var.namespace_name
  }
}