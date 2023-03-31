resource "kubernetes_deployment" "kion-helloword" {
  metadata {
    name = "kion-helloworld"
    labels = {
      name = "kion-helloworld"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        name = "kionapp"
      }
    }

    template {
      metadata {
        labels = {
          name = "kionapp"
        }
      }

      spec {
        container {
          image = "{https://hub.docker.com/_/hello_worldgolang/golang:latest}"
          name  = "kion-golang"
          port {
            container_port = 8080
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}