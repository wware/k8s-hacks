## When I do this

```
terraform play -out=Plan >& ZZ
sed -r "s/\x1B\[[0-9;]*[mG]//g" < ZZ > YY
# YY was used to generate this file
```
## I get this

```
module.eks.module.eks_managed_node_group["general"].data.aws_caller_identity.current: Reading...
module.eks.module.kms.data.aws_caller_identity.current[0]: Reading...
module.eks.module.kms.data.aws_partition.current[0]: Reading...
module.eks.module.eks_managed_node_group["general"].data.aws_partition.current: Reading...
module.eks.data.aws_partition.current: Reading...
module.eks.data.aws_caller_identity.current: Reading...
module.eks.module.kms.data.aws_partition.current[0]: Read complete after 0s [id=aws]
module.eks.module.eks_managed_node_group["general"].data.aws_partition.current: Read complete after 0s [id=aws]
module.eks.data.aws_partition.current: Read complete after 0s [id=aws]
module.eks.module.eks_managed_node_group["general"].data.aws_iam_policy_document.assume_role_policy[0]: Reading...
module.eks.module.eks_managed_node_group["general"].data.aws_iam_policy_document.assume_role_policy[0]: Read complete after 0s [id=2560088296]
module.eks.data.aws_iam_policy_document.assume_role_policy[0]: Reading...
module.eks.data.aws_iam_policy_document.assume_role_policy[0]: Read complete after 0s [id=2764486067]
module.eks.data.aws_caller_identity.current: Read complete after 0s [id=222634358787]
module.eks.data.aws_iam_session_context.current: Reading...
module.eks.data.aws_iam_session_context.current: Read complete after 0s [id=arn:aws:iam::222634358787:root]
module.eks.module.kms.data.aws_caller_identity.current[0]: Read complete after 0s [id=222634358787]
module.eks.module.eks_managed_node_group["general"].data.aws_caller_identity.current: Read complete after 0s [id=222634358787]

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create
 <= read (data resources)

Terraform will perform the following actions:

  # aws_db_instance.bookreview will be created
  + resource "aws_db_instance" "bookreview" {
      + address                               = (known after apply)
      + allocated_storage                     = 20
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = 7
      + backup_target                         = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = "bookreview"
      + db_subnet_group_name                  = "bookreview-db-subnet"
      + dedicated_log_volume                  = false
      + delete_automated_backups              = true
      + domain_fqdn                           = (known after apply)
      + endpoint                              = (known after apply)
      + engine                                = "postgres"
      + engine_lifecycle_support              = (known after apply)
      + engine_version                        = "14"
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "bookreview-db"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t3.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + listener_endpoint                     = (known after apply)
      + maintenance_window                    = (known after apply)
      + master_user_secret                    = (known after apply)
      + master_user_secret_kms_key_id         = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = false
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = (known after apply)
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = "gp3"
      + tags                                  = {
          + "Environment" = "production"
        }
      + tags_all                              = {
          + "Environment" = "production"
        }
      + timezone                              = (known after apply)
      + username                              = "admin"
      + vpc_security_group_ids                = (known after apply)
    }

  # aws_db_subnet_group.bookreview will be created
  + resource "aws_db_subnet_group" "bookreview" {
      + arn                     = (known after apply)
      + description             = "Managed by Terraform"
      + id                      = (known after apply)
      + name                    = "bookreview-db-subnet"
      + name_prefix             = (known after apply)
      + subnet_ids              = (known after apply)
      + supported_network_types = (known after apply)
      + tags                    = {
          + "Name" = "BookReview DB subnet group"
        }
      + tags_all                = {
          + "Name" = "BookReview DB subnet group"
        }
      + vpc_id                  = (known after apply)
    }

  # aws_eks_addon.ebs_csi_driver will be created
  + resource "aws_eks_addon" "ebs_csi_driver" {
      + addon_name               = "aws-ebs-csi-driver"
      + addon_version            = "v1.25.0-eksbuild.1"
      + arn                      = (known after apply)
      + cluster_name             = "bookreview-cluster"
      + configuration_values     = (known after apply)
      + created_at               = (known after apply)
      + id                       = (known after apply)
      + modified_at              = (known after apply)
      + preserve                 = true
      + service_account_role_arn = (known after apply)
      + tags_all                 = (known after apply)
    }

  # aws_iam_policy.load_balancer_controller will be created
  + resource "aws_iam_policy" "load_balancer_controller" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + id               = (known after apply)
      + name             = "AWSLoadBalancerControllerIAMPolicy"
      + name_prefix      = (known after apply)
      + path             = "/"
      + policy           = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = [
                          + "iam:CreateServiceLinkedRole",
                        ]
                      + Condition = {
                          + StringEquals = {
                              + "iam:AWSServiceName" = "elasticloadbalancing.amazonaws.com"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = "*"
                    },
                  + {
                      + Action   = [
                          + "ec2:DescribeAccountAttributes",
                          + "ec2:DescribeAddresses",
                          + "ec2:DescribeAvailabilityZones",
                          + "ec2:DescribeInternetGateways",
                          + "ec2:DescribeVpcs",
                          + "ec2:DescribeSubnets",
                          + "ec2:DescribeSecurityGroups",
                          + "ec2:DescribeInstances",
                          + "ec2:DescribeNetworkInterfaces",
                          + "ec2:DescribeTags",
                          + "ec2:GetCoipPoolUsage",
                          + "ec2:DescribeCoipPools",
                          + "elasticloadbalancing:DescribeLoadBalancers",
                          + "elasticloadbalancing:DescribeLoadBalancerAttributes",
                          + "elasticloadbalancing:DescribeListeners",
                          + "elasticloadbalancing:DescribeListenerCertificates",
                          + "elasticloadbalancing:DescribeSSLPolicies",
                          + "elasticloadbalancing:DescribeRules",
                          + "elasticloadbalancing:DescribeTargetGroups",
                          + "elasticloadbalancing:DescribeTargetGroupAttributes",
                          + "elasticloadbalancing:DescribeTargetHealth",
                          + "elasticloadbalancing:DescribeTags",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = [
                          + "cognito-idp:DescribeUserPoolClient",
                          + "acm:ListCertificates",
                          + "acm:DescribeCertificate",
                          + "iam:ListServerCertificates",
                          + "iam:GetServerCertificate",
                          + "waf-regional:GetWebACL",
                          + "waf-regional:GetWebACLForResource",
                          + "waf-regional:AssociateWebACL",
                          + "waf-regional:DisassociateWebACL",
                          + "wafv2:GetWebACL",
                          + "wafv2:GetWebACLForResource",
                          + "wafv2:AssociateWebACL",
                          + "wafv2:DisassociateWebACL",
                          + "shield:GetSubscriptionState",
                          + "shield:DescribeProtection",
                          + "shield:CreateProtection",
                          + "shield:DeleteProtection",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = [
                          + "ec2:AuthorizeSecurityGroupIngress",
                          + "ec2:RevokeSecurityGroupIngress",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action   = [
                          + "ec2:CreateSecurityGroup",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action    = [
                          + "ec2:CreateTags",
                        ]
                      + Condition = {
                          + Null         = {
                              + "aws:RequestTag/elbv2.k8s.aws/cluster" = "false"
                            }
                          + StringEquals = {
                              + "ec2:CreateAction" = "CreateSecurityGroup"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = "arn:aws:ec2:*:*:security-group/*"
                    },
                  + {
                      + Action    = [
                          + "ec2:CreateTags",
                          + "ec2:DeleteTags",
                        ]
                      + Condition = {
                          + Null = {
                              + "aws:RequestTag/elbv2.k8s.aws/cluster"  = "true"
                              + "aws:ResourceTag/elbv2.k8s.aws/cluster" = "false"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = "arn:aws:ec2:*:*:security-group/*"
                    },
                  + {
                      + Action    = [
                          + "ec2:AuthorizeSecurityGroupIngress",
                          + "ec2:RevokeSecurityGroupIngress",
                          + "ec2:DeleteSecurityGroup",
                        ]
                      + Condition = {
                          + Null = {
                              + "aws:ResourceTag/elbv2.k8s.aws/cluster" = "false"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = "*"
                    },
                  + {
                      + Action    = [
                          + "elasticloadbalancing:CreateLoadBalancer",
                          + "elasticloadbalancing:CreateTargetGroup",
                        ]
                      + Condition = {
                          + Null = {
                              + "aws:RequestTag/elbv2.k8s.aws/cluster" = "false"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = "*"
                    },
                  + {
                      + Action   = [
                          + "elasticloadbalancing:CreateListener",
                          + "elasticloadbalancing:DeleteListener",
                          + "elasticloadbalancing:CreateRule",
                          + "elasticloadbalancing:DeleteRule",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                  + {
                      + Action    = [
                          + "elasticloadbalancing:AddTags",
                          + "elasticloadbalancing:RemoveTags",
                        ]
                      + Condition = {
                          + Null = {
                              + "aws:RequestTag/elbv2.k8s.aws/cluster"  = "true"
                              + "aws:ResourceTag/elbv2.k8s.aws/cluster" = "false"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = [
                          + "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*",
                          + "arn:aws:elasticloadbalancing:*:*:loadbalancer/net/*/*",
                          + "arn:aws:elasticloadbalancing:*:*:loadbalancer/app/*/*",
                        ]
                    },
                  + {
                      + Action   = [
                          + "elasticloadbalancing:AddTags",
                          + "elasticloadbalancing:RemoveTags",
                        ]
                      + Effect   = "Allow"
                      + Resource = [
                          + "arn:aws:elasticloadbalancing:*:*:listener/net/*/*/*",
                          + "arn:aws:elasticloadbalancing:*:*:listener/app/*/*/*",
                          + "arn:aws:elasticloadbalancing:*:*:listener-rule/net/*/*/*",
                          + "arn:aws:elasticloadbalancing:*:*:listener-rule/app/*/*/*",
                        ]
                    },
                  + {
                      + Action    = [
                          + "elasticloadbalancing:ModifyLoadBalancerAttributes",
                          + "elasticloadbalancing:SetIpAddressType",
                          + "elasticloadbalancing:SetSecurityGroups",
                          + "elasticloadbalancing:SetSubnets",
                          + "elasticloadbalancing:DeleteLoadBalancer",
                          + "elasticloadbalancing:ModifyTargetGroup",
                          + "elasticloadbalancing:ModifyTargetGroupAttributes",
                          + "elasticloadbalancing:DeleteTargetGroup",
                        ]
                      + Condition = {
                          + Null = {
                              + "aws:ResourceTag/elbv2.k8s.aws/cluster" = "false"
                            }
                        }
                      + Effect    = "Allow"
                      + Resource  = "*"
                    },
                  + {
                      + Action   = [
                          + "elasticloadbalancing:RegisterTargets",
                          + "elasticloadbalancing:DeregisterTargets",
                        ]
                      + Effect   = "Allow"
                      + Resource = "arn:aws:elasticloadbalancing:*:*:targetgroup/*/*"
                    },
                  + {
                      + Action   = [
                          + "elasticloadbalancing:SetWebAcl",
                          + "elasticloadbalancing:ModifyListener",
                          + "elasticloadbalancing:AddListenerCertificates",
                          + "elasticloadbalancing:RemoveListenerCertificates",
                          + "elasticloadbalancing:ModifyRule",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + policy_id        = (known after apply)
      + tags_all         = (known after apply)
    }

  # aws_iam_role.app_role will be created
  + resource "aws_iam_role" "app_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = (known after apply)
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "bookreview-app-role"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role.ebs_csi will be created
  + resource "aws_iam_role" "ebs_csi" {
      + arn                   = (known after apply)
      + assume_role_policy    = (known after apply)
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-ebs-csi-driver"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role.load_balancer_controller will be created
  + resource "aws_iam_role" "load_balancer_controller" {
      + arn                   = (known after apply)
      + assume_role_policy    = (known after apply)
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = "eks-alb-ingress-controller"
      + name_prefix           = (known after apply)
      + path                  = "/"
      + tags_all              = (known after apply)
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # aws_iam_role_policy_attachment.ebs_csi will be created
  + resource "aws_iam_role_policy_attachment" "ebs_csi" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
      + role       = "eks-ebs-csi-driver"
    }

  # aws_iam_role_policy_attachment.load_balancer_controller will be created
  + resource "aws_iam_role_policy_attachment" "load_balancer_controller" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = "eks-alb-ingress-controller"
    }

  # aws_security_group.rds will be created
  + resource "aws_security_group" "rds" {
      + arn                    = (known after apply)
      + description            = "Security group for RDS"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + from_port        = 5432
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 5432
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = "bookreview-rds-sg"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # kubernetes_service_account.load_balancer_controller will be created
  + resource "kubernetes_service_account" "load_balancer_controller" {
      + automount_service_account_token = true
      + default_secret_name             = (known after apply)
      + id                              = (known after apply)

      + metadata {
          + annotations      = (known after apply)
          + generation       = (known after apply)
          + name             = "aws-load-balancer-controller"
          + namespace        = "kube-system"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

  # kubernetes_storage_class.ebs_sc will be created
  + resource "kubernetes_storage_class" "ebs_sc" {
      + allow_volume_expansion = true
      + id                     = (known after apply)
      + parameters             = {
          + "encrypted" = "true"
          + "type"      = "gp3"
        }
      + reclaim_policy         = "Retain"
      + storage_provisioner    = "ebs.csi.aws.com"
      + volume_binding_mode    = "WaitForFirstConsumer"

      + metadata {
          + generation       = (known after apply)
          + name             = "ebs-sc"
          + resource_version = (known after apply)
          + uid              = (known after apply)
        }
    }

  # module.eks.data.tls_certificate.this[0] will be read during apply
  # (config refers to values not yet known)
 <= data "tls_certificate" "this" {
      + certificates = (known after apply)
      + id           = (known after apply)
      + url          = (known after apply)
    }

  # module.eks.aws_cloudwatch_log_group.this[0] will be created
  + resource "aws_cloudwatch_log_group" "this" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + log_group_class   = (known after apply)
      + name              = "/aws/eks/bookreview-cluster/cluster"
      + name_prefix       = (known after apply)
      + retention_in_days = 90
      + skip_destroy      = false
      + tags              = {
          + "Environment" = "production"
          + "Name"        = "/aws/eks/bookreview-cluster/cluster"
          + "Terraform"   = "true"
        }
      + tags_all          = {
          + "Environment" = "production"
          + "Name"        = "/aws/eks/bookreview-cluster/cluster"
          + "Terraform"   = "true"
        }
    }

  # module.eks.aws_ec2_tag.cluster_primary_security_group["Environment"] will be created
  + resource "aws_ec2_tag" "cluster_primary_security_group" {
      + id          = (known after apply)
      + key         = "Environment"
      + resource_id = (known after apply)
      + value       = "production"
    }

  # module.eks.aws_ec2_tag.cluster_primary_security_group["Terraform"] will be created
  + resource "aws_ec2_tag" "cluster_primary_security_group" {
      + id          = (known after apply)
      + key         = "Terraform"
      + resource_id = (known after apply)
      + value       = "true"
    }

  # module.eks.aws_eks_cluster.this[0] will be created
  + resource "aws_eks_cluster" "this" {
      + arn                           = (known after apply)
      + bootstrap_self_managed_addons = true
      + certificate_authority         = (known after apply)
      + cluster_id                    = (known after apply)
      + created_at                    = (known after apply)
      + enabled_cluster_log_types     = [
          + "api",
          + "audit",
          + "authenticator",
        ]
      + endpoint                      = (known after apply)
      + id                            = (known after apply)
      + identity                      = (known after apply)
      + name                          = "bookreview-cluster"
      + platform_version              = (known after apply)
      + role_arn                      = (known after apply)
      + status                        = (known after apply)
      + tags                          = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + tags_all                      = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + version                       = "1.27"

      + access_config (known after apply)

      + encryption_config {
          + resources = [
              + "secrets",
            ]

          + provider {
              + key_arn = (known after apply)
            }
        }

      + kubernetes_network_config {
          + ip_family         = (known after apply)
          + service_ipv4_cidr = (known after apply)
          + service_ipv6_cidr = (known after apply)

          + elastic_load_balancing (known after apply)
        }

      + timeouts {}

      + upgrade_policy (known after apply)

      + vpc_config {
          + cluster_security_group_id = (known after apply)
          + endpoint_private_access   = true
          + endpoint_public_access    = true
          + public_access_cidrs       = [
              + "0.0.0.0/0",
            ]
          + security_group_ids        = (known after apply)
          + subnet_ids                = (known after apply)
          + vpc_id                    = (known after apply)
        }
    }

  # module.eks.aws_iam_openid_connect_provider.oidc_provider[0] will be created
  + resource "aws_iam_openid_connect_provider" "oidc_provider" {
      + arn             = (known after apply)
      + client_id_list  = [
          + "sts.amazonaws.com",
        ]
      + id              = (known after apply)
      + tags            = {
          + "Environment" = "production"
          + "Name"        = "bookreview-cluster-eks-irsa"
          + "Terraform"   = "true"
        }
      + tags_all        = {
          + "Environment" = "production"
          + "Name"        = "bookreview-cluster-eks-irsa"
          + "Terraform"   = "true"
        }
      + thumbprint_list = (known after apply)
      + url             = (known after apply)
    }

  # module.eks.aws_iam_policy.cluster_encryption[0] will be created
  + resource "aws_iam_policy" "cluster_encryption" {
      + arn              = (known after apply)
      + attachment_count = (known after apply)
      + description      = "Cluster encryption policy to allow cluster role to utilize CMK provided"
      + id               = (known after apply)
      + name             = (known after apply)
      + name_prefix      = "bookreview-cluster-cluster-ClusterEncryption"
      + path             = "/"
      + policy           = (known after apply)
      + policy_id        = (known after apply)
      + tags             = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + tags_all         = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
    }

  # module.eks.aws_iam_role.this[0] will be created
  + resource "aws_iam_role" "this" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "eks.amazonaws.com"
                        }
                      + Sid       = "EKSClusterAssumeRole"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = true
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "bookreview-cluster-cluster-"
      + path                  = "/"
      + tags                  = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + tags_all              = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + unique_id             = (known after apply)

      + inline_policy {
          + name   = "bookreview-cluster-cluster"
          + policy = jsonencode(
                {
                  + Statement = [
                      + {
                          + Action   = [
                              + "logs:CreateLogGroup",
                            ]
                          + Effect   = "Deny"
                          + Resource = "*"
                        },
                    ]
                  + Version   = "2012-10-17"
                }
            )
        }
    }

  # module.eks.aws_iam_role_policy_attachment.cluster_encryption[0] will be created
  + resource "aws_iam_role_policy_attachment" "cluster_encryption" {
      + id         = (known after apply)
      + policy_arn = (known after apply)
      + role       = (known after apply)
    }

  # module.eks.aws_iam_role_policy_attachment.this["AmazonEKSClusterPolicy"] will be created
  + resource "aws_iam_role_policy_attachment" "this" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
      + role       = (known after apply)
    }

  # module.eks.aws_iam_role_policy_attachment.this["AmazonEKSVPCResourceController"] will be created
  + resource "aws_iam_role_policy_attachment" "this" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
      + role       = (known after apply)
    }

  # module.eks.aws_security_group.cluster[0] will be created
  + resource "aws_security_group" "cluster" {
      + arn                    = (known after apply)
      + description            = "EKS cluster security group"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "bookreview-cluster-cluster-"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment" = "production"
          + "Name"        = "bookreview-cluster-cluster"
          + "Terraform"   = "true"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "Name"        = "bookreview-cluster-cluster"
          + "Terraform"   = "true"
        }
      + vpc_id                 = (known after apply)
    }

  # module.eks.aws_security_group.node[0] will be created
  + resource "aws_security_group" "node" {
      + arn                    = (known after apply)
      + description            = "EKS node shared security group"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "bookreview-cluster-node-"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Environment"                              = "production"
          + "Name"                                     = "bookreview-cluster-node"
          + "Terraform"                                = "true"
          + "kubernetes.io/cluster/bookreview-cluster" = "owned"
        }
      + tags_all               = {
          + "Environment"                              = "production"
          + "Name"                                     = "bookreview-cluster-node"
          + "Terraform"                                = "true"
          + "kubernetes.io/cluster/bookreview-cluster" = "owned"
        }
      + vpc_id                 = (known after apply)
    }

  # module.eks.aws_security_group_rule.cluster["ingress_nodes_443"] will be created
  + resource "aws_security_group_rule" "cluster" {
      + description              = "Node groups to cluster API"
      + from_port                = 443
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 443
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["egress_all"] will be created
  + resource "aws_security_group_rule" "node" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + description              = "Allow all egress"
      + from_port                = 0
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.eks.aws_security_group_rule.node["ingress_cluster_443"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Cluster API to node groups"
      + from_port                = 443
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 443
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_cluster_4443_webhook"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Cluster API to node 4443/tcp webhook"
      + from_port                = 4443
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 4443
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_cluster_6443_webhook"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Cluster API to node 6443/tcp webhook"
      + from_port                = 6443
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 6443
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_cluster_8443_webhook"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Cluster API to node 8443/tcp webhook"
      + from_port                = 8443
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8443
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_cluster_9443_webhook"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Cluster API to node 9443/tcp webhook"
      + from_port                = 9443
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 9443
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_cluster_kubelet"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Cluster API to node kubelets"
      + from_port                = 10250
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 10250
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_nodes_ephemeral"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Node to node ingress on ephemeral ports"
      + from_port                = 1025
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 65535
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_self_coredns_tcp"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Node to node CoreDNS"
      + from_port                = 53
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 53
      + type                     = "ingress"
    }

  # module.eks.aws_security_group_rule.node["ingress_self_coredns_udp"] will be created
  + resource "aws_security_group_rule" "node" {
      + description              = "Node to node CoreDNS UDP"
      + from_port                = 53
      + id                       = (known after apply)
      + prefix_list_ids          = []
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + security_group_rule_id   = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 53
      + type                     = "ingress"
    }

  # module.eks.time_sleep.this[0] will be created
  + resource "time_sleep" "this" {
      + create_duration = "30s"
      + id              = (known after apply)
      + triggers        = {
          + "cluster_certificate_authority_data" = (known after apply)
          + "cluster_endpoint"                   = (known after apply)
          + "cluster_name"                       = "bookreview-cluster"
          + "cluster_version"                    = "1.27"
        }
    }

  # module.vpc.aws_default_network_acl.this[0] will be created
  + resource "aws_default_network_acl" "this" {
      + arn                    = (known after apply)
      + default_network_acl_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + tags                   = {
          + "Name"                                     = "eks-vpc-default"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all               = {
          + "Name"                                     = "eks-vpc-default"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc_id                 = (known after apply)

      + egress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }
      + egress {
          + action          = "allow"
          + cidr_block      = "0.0.0.0/0"
          + from_port       = 0
          + protocol        = "-1"
          + rule_no         = 100
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }

      + ingress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }
      + ingress {
          + action          = "allow"
          + cidr_block      = "0.0.0.0/0"
          + from_port       = 0
          + protocol        = "-1"
          + rule_no         = 100
          + to_port         = 0
            # (1 unchanged attribute hidden)
        }
    }

  # module.vpc.aws_default_route_table.default[0] will be created
  + resource "aws_default_route_table" "default" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = (known after apply)
      + tags                   = {
          + "Name"                                     = "eks-vpc-default"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all               = {
          + "Name"                                     = "eks-vpc-default"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc_id                 = (known after apply)

      + timeouts {
          + create = "5m"
          + update = "5m"
        }
    }

  # module.vpc.aws_default_security_group.this[0] will be created
  + resource "aws_default_security_group" "this" {
      + arn                    = (known after apply)
      + description            = (known after apply)
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name"                                     = "eks-vpc-default"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all               = {
          + "Name"                                     = "eks-vpc-default"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.nat[0] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name"                                     = "eks-vpc-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all             = {
          + "Name"                                     = "eks-vpc-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc                  = (known after apply)
    }

  # module.vpc.aws_internet_gateway.this[0] will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name"                                     = "eks-vpc"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all = {
          + "Name"                                     = "eks-vpc"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.this[0] will be created
  + resource "aws_nat_gateway" "this" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Name"                                     = "eks-vpc-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all                           = {
          + "Name"                                     = "eks-vpc-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
    }

  # module.vpc.aws_route.private_nat_gateway[0] will be created
  + resource "aws_route" "private_nat_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route.public_internet_gateway[0] will be created
  + resource "aws_route" "public_internet_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route_table.private[0] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name"                                     = "eks-vpc-private"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all         = {
          + "Name"                                     = "eks-vpc-private"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public[0] will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name"                                     = "eks-vpc-public"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all         = {
          + "Name"                                     = "eks-vpc-public"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[0] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[1] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                                     = "eks-vpc-private-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/internal-elb"          = "1"
        }
      + tags_all                                       = {
          + "Name"                                     = "eks-vpc-private-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/internal-elb"          = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                                     = "eks-vpc-private-us-east-1b"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/internal-elb"          = "1"
        }
      + tags_all                                       = {
          + "Name"                                     = "eks-vpc-private-us-east-1b"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/internal-elb"          = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.101.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                                     = "eks-vpc-public-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/elb"                   = "1"
        }
      + tags_all                                       = {
          + "Name"                                     = "eks-vpc-public-us-east-1a"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/elb"                   = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.102.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name"                                     = "eks-vpc-public-us-east-1b"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/elb"                   = "1"
        }
      + tags_all                                       = {
          + "Name"                                     = "eks-vpc-public-us-east-1b"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
          + "kubernetes.io/role/elb"                   = "1"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.this[0] will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name"                                     = "eks-vpc"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
      + tags_all                             = {
          + "Name"                                     = "eks-vpc"
          + "kubernetes.io/cluster/bookreview-cluster" = "shared"
        }
    }

  # module.eks.module.eks_managed_node_group["general"].aws_eks_node_group.this[0] will be created
  + resource "aws_eks_node_group" "this" {
      + ami_type               = (known after apply)
      + arn                    = (known after apply)
      + capacity_type          = "ON_DEMAND"
      + cluster_name           = "bookreview-cluster"
      + disk_size              = (known after apply)
      + id                     = (known after apply)
      + instance_types         = [
          + "t3.medium",
        ]
      + node_group_name        = (known after apply)
      + node_group_name_prefix = "general-"
      + node_role_arn          = (known after apply)
      + release_version        = (known after apply)
      + resources              = (known after apply)
      + status                 = (known after apply)
      + subnet_ids             = (known after apply)
      + tags                   = {
          + "Environment" = "production"
          + "Name"        = "general"
          + "Terraform"   = "true"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "Name"        = "general"
          + "Terraform"   = "true"
        }
      + version                = "1.27"

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = (known after apply)
        }

      + node_repair_config (known after apply)

      + scaling_config {
          + desired_size = 2
          + max_size     = 3
          + min_size     = 1
        }

      + timeouts {}

      + update_config {
          + max_unavailable_percentage = 33
        }
    }

  # module.eks.module.eks_managed_node_group["general"].aws_iam_role.this[0] will be created
  + resource "aws_iam_role" "this" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = "EKSNodeAssumeRole"
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + description           = "EKS managed node group IAM role"
      + force_detach_policies = true
      + id                    = (known after apply)
      + managed_policy_arns   = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "general-eks-node-group-"
      + path                  = "/"
      + tags                  = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + tags_all              = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + unique_id             = (known after apply)

      + inline_policy (known after apply)
    }

  # module.eks.module.eks_managed_node_group["general"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"] will be created
  + resource "aws_iam_role_policy_attachment" "this" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
      + role       = (known after apply)
    }

  # module.eks.module.eks_managed_node_group["general"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"] will be created
  + resource "aws_iam_role_policy_attachment" "this" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
      + role       = (known after apply)
    }

  # module.eks.module.eks_managed_node_group["general"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"] will be created
  + resource "aws_iam_role_policy_attachment" "this" {
      + id         = (known after apply)
      + policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
      + role       = (known after apply)
    }

  # module.eks.module.eks_managed_node_group["general"].aws_launch_template.this[0] will be created
  + resource "aws_launch_template" "this" {
      + arn                    = (known after apply)
      + default_version        = (known after apply)
      + description            = "Custom launch template for general EKS managed node group"
      + id                     = (known after apply)
      + latest_version         = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "general-"
      + tags                   = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + tags_all               = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + update_default_version = true
      + vpc_security_group_ids = (known after apply)
        # (2 unchanged attributes hidden)

      + metadata_options {
          + http_endpoint               = "enabled"
          + http_protocol_ipv6          = (known after apply)
          + http_put_response_hop_limit = 2
          + http_tokens                 = "required"
          + instance_metadata_tags      = (known after apply)
        }

      + monitoring {
          + enabled = true
        }

      + tag_specifications {
          + resource_type = "instance"
          + tags          = {
              + "Environment" = "production"
              + "Name"        = "general"
              + "Terraform"   = "true"
            }
        }
      + tag_specifications {
          + resource_type = "network-interface"
          + tags          = {
              + "Environment" = "production"
              + "Name"        = "general"
              + "Terraform"   = "true"
            }
        }
      + tag_specifications {
          + resource_type = "volume"
          + tags          = {
              + "Environment" = "production"
              + "Name"        = "general"
              + "Terraform"   = "true"
            }
        }
    }

  # module.eks.module.kms.data.aws_iam_policy_document.this[0] will be read during apply
  # (config refers to values not yet known)
 <= data "aws_iam_policy_document" "this" {
      + id                        = (known after apply)
      + json                      = (known after apply)
      + minified_json             = (known after apply)
      + override_policy_documents = []
      + source_policy_documents   = []

      + statement {
          + actions   = [
              + "kms:CancelKeyDeletion",
              + "kms:Create*",
              + "kms:Delete*",
              + "kms:Describe*",
              + "kms:Disable*",
              + "kms:Enable*",
              + "kms:Get*",
              + "kms:ImportKeyMaterial",
              + "kms:List*",
              + "kms:Put*",
              + "kms:ReplicateKey",
              + "kms:Revoke*",
              + "kms:ScheduleKeyDeletion",
              + "kms:TagResource",
              + "kms:UntagResource",
              + "kms:Update*",
            ]
          + resources = [
              + "*",
            ]
          + sid       = "KeyAdministration"

          + principals {
              + identifiers = [
                  + "arn:aws:iam::222634358787:root",
                ]
              + type        = "AWS"
            }
        }
      + statement {
          + actions   = [
              + "kms:Decrypt",
              + "kms:DescribeKey",
              + "kms:Encrypt",
              + "kms:GenerateDataKey*",
              + "kms:ReEncrypt*",
            ]
          + resources = [
              + "*",
            ]
          + sid       = "KeyUsage"

          + principals {
              + identifiers = [
                  + (known after apply),
                ]
              + type        = "AWS"
            }
        }
    }

  # module.eks.module.kms.aws_kms_alias.this["cluster"] will be created
  + resource "aws_kms_alias" "this" {
      + arn            = (known after apply)
      + id             = (known after apply)
      + name           = "alias/eks/bookreview-cluster"
      + name_prefix    = (known after apply)
      + target_key_arn = (known after apply)
      + target_key_id  = (known after apply)
    }

  # module.eks.module.kms.aws_kms_key.this[0] will be created
  + resource "aws_kms_key" "this" {
      + arn                                = (known after apply)
      + bypass_policy_lockout_safety_check = false
      + customer_master_key_spec           = "SYMMETRIC_DEFAULT"
      + description                        = "bookreview-cluster cluster encryption key"
      + enable_key_rotation                = true
      + id                                 = (known after apply)
      + is_enabled                         = true
      + key_id                             = (known after apply)
      + key_usage                          = "ENCRYPT_DECRYPT"
      + multi_region                       = false
      + policy                             = (known after apply)
      + rotation_period_in_days            = (known after apply)
      + tags                               = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
      + tags_all                           = {
          + "Environment" = "production"
          + "Terraform"   = "true"
        }
    }

Plan: 63 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + load_balancer_role_arn = (known after apply)
  + rds_endpoint           = (known after apply)
  + storage_class_name     = "ebs-sc"
╷
│ Warning: Argument is deprecated
│ 
│   with module.eks.aws_iam_role.this[0],
│   on .terraform/modules/eks/main.tf line 293, in resource "aws_iam_role" "this":
│  293: resource "aws_iam_role" "this" {
│ 
│ The inline_policy argument is deprecated. Use the aws_iam_role_policy
│ resource instead. If Terraform should exclusively manage all inline policy
│ associations (the current behavior of this argument), use the
│ aws_iam_role_policies_exclusive resource as well.
╵

─────────────────────────────────────────────────────────────────────────────

Saved the plan to: Plan

To perform exactly these actions, run the following command to apply:
    terraform apply "Plan"
```
