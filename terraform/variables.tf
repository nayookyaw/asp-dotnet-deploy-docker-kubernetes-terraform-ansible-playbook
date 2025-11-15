variable "namespace_name" {
  type        = string
  default     = "myapp"
  description = "Kubernetes namespace for the app"
}

variable "image_name" {
  type        = string
  description = "Docker image name for ASP.NET Core app (tag included)"
}

variable "mssql_sa_password" {
  type        = string
  default     = "Your_password123!"
  description = "SA password for SQL Server (demo only – change for real use)"
}