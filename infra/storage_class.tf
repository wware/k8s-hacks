# Custom Storage Class for EBS volumes
# Defines how Kubernetes should provision persistent volumes
resource "kubernetes_storage_class" "ebs_sc" {
  metadata {
    name = "ebs-sc"
  }

  # Use AWS EBS CSI driver for volume provisioning
  storage_provisioner = "ebs.csi.aws.com"
  
  # WaitForFirstConsumer delays volume binding until pod is scheduled
  # This ensures volumes are created in the same AZ as the pod
  volume_binding_mode = "WaitForFirstConsumer"
  
  # Retain volumes when PVCs are deleted
  # Prevents accidental data loss; requires manual cleanup
  reclaim_policy     = "Retain"

  # Volume configuration parameters
  parameters = {
    # Use GP3 volume type for better performance and cost efficiency
    type = "gp3"
    # Enable EBS encryption for data at rest
    encrypted = "true"
  }
}
