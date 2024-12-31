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
* To disable a specific plan, remove the plan name from mdc_plans_list var and execute `terraform apply` command.

### Onboarded Azure Subscription
We recommend managing the entire onboarding process with our module. If you've already onboarded your Azure Subscription to Microsoft Defender for Cloud plans, you have several options:

#### Azure Defender Plans UI Portal
* **Manual Cleanup**: Manually toggle off the status of all MDC plans.

#### Terraform CLI
* **Start Fresh**: You can choose to destroy your current Terraform environment and begin anew.
* **Import Existing Resources**: Utilize [Terraform import](https://developer.hashicorp.com/terraform/cli/import) to seamlessly integrate existing resources into Terraform management.
* **Manage Multiple Terraform States**: Maintain your current state and create a new one for this module, allowing for efficient resource management.
