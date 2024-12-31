<!-- BEGIN_TF_DOCS -->
# Default example

Onboard MDC plans for a single subscription.

```hcl
module "mdc_plans_enable" {
  source           = "../.."
  location         = "westeurope"
  mdc_plans_list   = var.mdc_plans_list
  subplans         = var.subplans
  enable_telemetry = var.enable_telemetry
}
```

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.2)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.7.0, < 4.0)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (>= 0.1.8, < 1.0)

## Resources

No resources.

<!-- markdownlint-disable MD013 -->
## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: n/a

Type: `bool`

Default: `false`

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

The following outputs are exported:

### <a name="output_plans_details"></a> [plans\_details](#output\_plans\_details)

Description: All plans details

### <a name="output_subscription_pricing_id"></a> [subscription\_pricing\_id](#output\_subscription\_pricing\_id)

Description: The subscription pricing ID

## Modules

The following Modules are called:

### <a name="module_mdc_plans_enable"></a> [mdc\_plans\_enable](#module\_mdc\_plans\_enable)

Source: ../..

Version:

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->