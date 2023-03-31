resource "kubernetes_service" "kionapp-Service" {
  metadata {
    name = "kionapp-service"
  }
  spec {
    selector = {
      app    = "kionapp"
    }
    port {
      port        = 8080
      target_port = 80
    }
    type = "LoadBalancer"
  }
}