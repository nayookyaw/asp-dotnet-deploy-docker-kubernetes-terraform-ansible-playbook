resource "kubernetes_deployment" "mssql" {
  metadata {
    name      = "ms-sql-docker-app"
    namespace = kubernetes_namespace.myapp.metadata[0].name
    labels = {
      app = "ms-sql-docker-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "ms-sql-docker-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "ms-sql-docker-app"
        }
      }

      spec {
        container {
          name  = "ms-sql-docker-app"
          image = "mcr.microsoft.com/mssql/server:2022-latest"

          env {
            name  = "ACCEPT_EULA"
            value = "Y"
          }

          env {
            name  = "MSSQL_SA_PASSWORD"
            value = var.mssql_sa_password
          }

          port {
            container_port = 1433
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mssql" {
  metadata {
    name      = "ms-sql-docker-app"
    namespace = kubernetes_namespace.myapp.metadata[0].name
  }

  spec {
    selector = {
      app = "ms-sql-docker-app"
    }

    port {
      port        = 1433
      target_port = 1433
    }

    type = "ClusterIP"
  }
}