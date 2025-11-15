output "namespace" {
  value       = kubernetes_namespace.myapp.metadata[0].name
  description = "Namespace where the app is deployed"
}

output "backend_service_name" {
  value       = kubernetes_service.myapp_web.metadata[0].name
  description = "Service name for the backend"
}

output "backend_node_port" {
  value       = kubernetes_service.myapp_web.spec[0].port[0].node_port
  description = "NodePort to reach the backend externally"
}