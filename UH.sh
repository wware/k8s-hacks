#!/bin/bash -xe

ALB_ARN=$(aws elbv2 describe-load-balancers --names k8s-default-bookrevi-f4e6cd3fa3 --query 'LoadBalancers[0].LoadBalancerArn' --output text)
TG_ARN=$(aws elbv2 describe-target-groups --load-balancer-arn $ALB_ARN --query 'TargetGroups[0].TargetGroupArn' --output text)
aws elbv2 describe-target-health --target-group-arn $TG_ARN
