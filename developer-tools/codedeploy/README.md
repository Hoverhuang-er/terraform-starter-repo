<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_attachment.sample_asg_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_attachment.sample_asg_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_attachment) | resource |
| [aws_autoscaling_group.deploy_blue_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_group.deploy_green_asg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_launch_configuration.deployment_lc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_lb.sample_lb_bdg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.sample_lb_lst](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.sample_lb_tg_blue](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group.sample_lb_tg_green](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_security_group.sample_security_groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet_ids.sample_deployment_subnet_list](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet_ids) | data source |
| [aws_vpc.sample_deployment_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_amzn-linux"></a> [amzn-linux](#input\_amzn-linux) | Amazon Linux AMI | `string` | `"ami-0bd6906508e74f692"` | no |
| <a name="input_app_name"></a> [app\_name](#input\_app\_name) | Application name | `string` | `"ready_to_deploy"` | no |
| <a name="input_blue_deployment_group"></a> [blue\_deployment\_group](#input\_blue\_deployment\_group) | Blue deployment group | `string` | `"blue_group"` | no |
| <a name="input_bluegreen_elb_name"></a> [bluegreen\_elb\_name](#input\_bluegreen\_elb\_name) | Bluegreen ELB name | `string` | `"bluegreen-elb"` | no |
| <a name="input_deploy_group_blue"></a> [deploy\_group\_blue](#input\_deploy\_group\_blue) | Deployment group for blue | `string` | `"blue"` | no |
| <a name="input_deploy_group_green"></a> [deploy\_group\_green](#input\_deploy\_group\_green) | Deployment group for green | `string` | `"green"` | no |
| <a name="input_green_deployment_group"></a> [green\_deployment\_group](#input\_green\_deployment\_group) | Green deployment group | `string` | `"green_group"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->