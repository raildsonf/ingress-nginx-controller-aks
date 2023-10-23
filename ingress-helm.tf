resource "helm_release" "ingress_nginx_controller" {
  chart            = "ingress-nginx"
  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  version          = "4.8.2"
  create_namespace = true
  repository       = "https://kubernetes.github.io/ingress-nginx/"
  set {
    name  = "controller.image.allowPrivilegeEscalation"
    value = "false"
  }
  set {
    name  = "controller.image.runAsUser"
    value = "101"
  }
  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io\\/azure-load-balancer-health-probe-request-path"
    value = "/healthz"
  }
  force_update = true
}