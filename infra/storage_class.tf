resource "kubernetes_storage_class" "ebs_sc" {
  metadata {
    name = "ebs-sc"
  }

  storage_provisioner = "ebs.csi.aws.com"
  volume_binding_mode = "WaitForFirstConsumer"
  reclaim_policy     = "Retain"

  parameters = {
    type = "gp3"
    encrypted = "true"
  }
}
