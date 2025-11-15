resource "kubernetes_deployment" "myapp_web" {
  metadata {
    name      = "myapp-web"
    namespace = kubernetes_namespace.myapp.metadata[0].name
    labels = {
      app = "myapp-web"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "myapp-web"
      }
    }

    template {
      metadata {
        labels = {
          app = "myapp-web"
        }
      }

      spec {
        container {
          name  = "myapp-web"
          image = var.image_name

          port {
            container_port = 5151
          }

          env {
            name  = "ConnectionStrings__DefaultConnection"
            value = "Server=ms-sql-docker-app,1433;Database=YourDbName;User Id=sa;Password=${var.mssql_sa_password};TrustServerCertificate=True;"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "myapp_web" {
  metadata {
    name      = "myapp-web"
    namespace = kubernetes_namespace.myapp.metadata[0].name
  }

  spec {
    selector = {
      app = "myapp-web"
    }

    port {
      port        = 80
      target_port = 5151
      node_port   = 30080
    }

    type = "NodePort"
  }
}