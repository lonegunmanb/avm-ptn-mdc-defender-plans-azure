<!-- BEGIN_TF_DOCS -->
# All subscriptions

Onboard MDC plans for all subscriptions where your account holds owner permissions.

```hcl
data "azurerm_subscriptions" "available" {}

locals {
  list_of_subscriptions = data.azurerm_subscriptions.available.subscriptions[*].subscription_id
}

resource "local_file" "generate_main_terraform_file" {
  filename = "${path.module}/output/main.tf"
  content = templatefile("resolv.conf.tftpl", {
    list_of_subscriptions = local.list_of_subscriptions
    mdc_plans_list        = jsonencode(var.mdc_plans_list)
    subplans              = jsonencode(var.subplans)
  })
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.2)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.7.0, < 4.0)

- <a name="requirement_local"></a> [local](#requirement\_local) (2.3.0)

## Resources

The following resources are used by this module:

- [local_file.generate_main_terraform_file](https://registry.terraform.io/providers/hashicorp/local/2.3.0/docs/resources/file) (resource)
- [azurerm_subscriptions.available](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscriptions) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_mdc_plans_list"></a> [mdc\_plans\_list](#input\_mdc\_plans\_list)

Description: (Optional) Set of all MDC plans

Type: `set(string)`

Default:

```json
[
  "AppServices",
  "Arm",
  "CloudPosture",
  "Containers",
  "KeyVaults",
  "OpenSourceRelationalDatabases",
  "SqlServers",
  "SqlServerVirtualMachines",
  "CosmosDbs",
  "StorageAccounts",
  "VirtualMachines",
  "Api"
]
```

### <a name="input_subplans"></a> [subplans](#input\_subplans)

Description: (Optional) A map of resource type pricing subplan, the key is resource type. This variable takes precedence over `var.default_subplan`. Contact your MSFT representative for possible values

Type: `map(string)`

Default:

```json
{
  "Api": "P1",
  "Arm": "PerSubscription",
  "KeyVaults": "PerKeyVault",
  "VirtualMachines": "P2"
}
```

## Outputs

No outputs.

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->