<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-avm-ptn-mdc-defender-plans-azure

-> **NOTE:** When running the module, your subscription should not already be onboarded to MDC. If you have already completed the onboarding process, please refer to the [Onboarded Azure Subscription](#onboarded-azure-subscription) section.

~> **NOTE:** Deletion of the resource will reset the pricing tier to `Free`

## Onboarding to Microsoft Defender for Cloud (MDC) plans in Azure

This Terraform module activate Microsoft Defender for Cloud (MDC) plans.

The module supports the following onboarding types:

1. <u>Single Subscription</u>: Onboard MDC plans for a single subscription.
2. <u>Chosen Subscriptions</u>: Onboard MDC plans for a selected list of subscriptions.
3. <u>All Subscriptions</u>: Onboard MDC plans for all subscriptions where your account holds owner permissions.
4. <u>Management Group</u>: Onboard MDC plans for all subscriptions within a designated management group.

### Terraform and terraform-provider-azurerm version restrictions

Terraform core's version is v1.x and terraform-provider-azurerm's version is v3.x.

## Usage

### Enable plans

To enable plans using this module, follow these steps based on the subscription type:

#### Single Subscription

1. Navigate to `examples\default` folder.
2. Execute the `terraform apply` command.
3. Your onboarding will be applied exclusively to the subscription you are currently connected to.

#### Chosen Subscriptions / All Subscriptions / Management Group

1. Enter the relevant folder under `examples` based on your scenario.
2. Execute the `terraform apply` command.
3. After the execution, a new directory named `output` will be generated within the example folder.
4. Access the newly created `output` folder.
5. Modify the `main.tf` file within this folder to align with your specific requirements.
6. Execute the `terraform apply` command again to apply your modifications.

### Disable plans

* To disable all plans execute `terraform destroy` command.
* To disable a specific plan, remove the plan name from mdc\_plans\_list var and execute `terraform apply` command.

### Onboarded Azure Subscription
We recommend managing the entire onboarding process with our module. If you've already onboarded your Azure Subscription to Microsoft Defender for Cloud plans, you have several options:

#### Azure Defender Plans UI Portal
* **Manual Cleanup**: Manually toggle off the status of all MDC plans.

#### Terraform CLI
* **Start Fresh**: You can choose to destroy your current Terraform environment and begin anew.
* **Import Existing Resources**: Utilize [Terraform import](https://developer.hashicorp.com/terraform/cli/import) to seamlessly integrate existing resources into Terraform management.
* **Manage Multiple Terraform States**: Maintain your current state and create a new one for this module, allowing for efficient resource management.

<!-- markdownlint-disable MD033 -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.3)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>= 3.47, < 4.0)

- <a name="requirement_modtm"></a> [modtm](#requirement\_modtm) (~> 0.3)

- <a name="requirement_random"></a> [random](#requirement\_random) (~> 3.5)

## Resources

The following resources are used by this module:

- [azurerm_role_assignment.va_auto_provisioning_containers_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_role_assignment.va_auto_provisioning_la_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_role_assignment.va_auto_provisioning_vm_role](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) (resource)
- [azurerm_security_center_setting.setting_mcas](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_setting) (resource)
- [azurerm_security_center_subscription_pricing.asc_plans](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/security_center_subscription_pricing) (resource)
- [azurerm_subscription_policy_assignment.container](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_policy_assignment) (resource)
- [azurerm_subscription_policy_assignment.sql](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_policy_assignment) (resource)
- [azurerm_subscription_policy_assignment.vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription_policy_assignment) (resource)
- [modtm_telemetry.telemetry](https://registry.terraform.io/providers/Azure/modtm/latest/docs/resources/telemetry) (resource)
- [random_uuid.telemetry](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) (resource)
- [azurerm_client_config.telemetry](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) (data source)
- [azurerm_policy_definition.container_policies](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/policy_definition) (data source)
- [azurerm_policy_definition.la_policies](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/policy_definition) (data source)
- [azurerm_policy_definition.vm_policies](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/policy_definition) (data source)
- [azurerm_role_definition.container_roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) (data source)
- [azurerm_role_definition.la_roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) (data source)
- [azurerm_role_definition.vm_roles](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/role_definition) (data source)
- [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) (data source)
- [modtm_module_source.telemetry](https://registry.terraform.io/providers/Azure/modtm/latest/docs/data-sources/module_source) (data source)

<!-- markdownlint-disable MD013 -->
## Required Inputs

The following input variables are required:

### <a name="input_location"></a> [location](#input\_location)

Description: The location/region where the policy should exist.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_default_subplan"></a> [default\_subplan](#input\_default\_subplan)

Description: (Optional) Resource type pricing default subplan. Contact your MSFT representative for possible values

Type: `string`

Default: `null`

### <a name="input_default_tier"></a> [default\_tier](#input\_default\_tier)

Description: (Optional) The pricing tier to use. Possible values are `Free` and `Standard`

Type: `string`

Default: `"Standard"`

### <a name="input_enable_telemetry"></a> [enable\_telemetry](#input\_enable\_telemetry)

Description: This variable controls whether or not telemetry is enabled for the module.  
For more information see <https://aka.ms/avm/telemetryinfo>.  
If it is set to false, then no telemetry will be collected.

Type: `bool`

Default: `true`

### <a name="input_mdc_databases_plans"></a> [mdc\_databases\_plans](#input\_mdc\_databases\_plans)

Description: (Optional) Set of all MDC databases plans

Type: `set(string)`

Default:

```json
[
  "OpenSourceRelationalDatabases",
  "SqlServers",
  "SqlServerVirtualMachines",
  "CosmosDbs"
]
```

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

### <a name="input_storage_accounts_malware_scan_cap_gb_per_month"></a> [storage\_accounts\_malware\_scan\_cap\_gb\_per\_month](#input\_storage\_accounts\_malware\_scan\_cap\_gb\_per\_month)

Description: (Optional) Sets the maximum GB limit for malware scanning on uploaded files per storage account per month

Type: `string`

Default: `"5000"`

### <a name="input_subplans"></a> [subplans](#input\_subplans)

Description: (Optional) A map of resource type pricing subplan, the key is resource type. This variable takes precedence over `var.default_subplan`. Contact your MSFT representative for possible values

Type: `map(string)`

Default: `{}`

### <a name="input_tracing_tags_enabled"></a> [tracing\_tags\_enabled](#input\_tracing\_tags\_enabled)

Description: Whether enable tracing tags that generated by BridgeCrew Yor.

Type: `bool`

Default: `false`

### <a name="input_tracing_tags_prefix"></a> [tracing\_tags\_prefix](#input\_tracing\_tags\_prefix)

Description: Default prefix for generated tracing tags

Type: `string`

Default: `"avm_"`

## Outputs

The following outputs are exported:

### <a name="output_plans_details"></a> [plans\_details](#output\_plans\_details)

Description: All plans details

### <a name="output_subscription_pricing_id"></a> [subscription\_pricing\_id](#output\_subscription\_pricing\_id)

Description: The subscription pricing ID

## Modules

No modules.

<!-- markdownlint-disable-next-line MD041 -->
## Data Collection

The software may collect information about you and your use of the software and send it to Microsoft. Microsoft may use this information to provide services and improve our products and services. You may turn off the telemetry as described in the repository. There are also some features in the software that may enable you and Microsoft to collect data from users of your applications. If you use these features, you must comply with applicable law, including providing appropriate notices to users of your applications together with a copy of Microsoft’s privacy statement. Our privacy statement is located at <https://go.microsoft.com/fwlink/?LinkID=824704>. You can learn more about data collection and use in the help documentation and our privacy statement. Your use of the software operates as your consent to these practices.
<!-- END_TF_DOCS -->