locals {
  plan_extenstions = {
    AgentlessVmScanning                         = tolist(["VirtualMachines", "CloudPosture", "Containers"])
    ContainerRegistriesVulnerabilityAssessments = tolist(["Containers", "CloudPosture"])
    AgentlessDiscoveryForKubernetes             = tolist(["Containers", "CloudPosture"])
    ContainerSensor                             = tolist(["Containers"])
    OnUploadMalwareScanning                     = tolist(["StorageAccounts"])
    SensitiveDataDiscovery                      = tolist(["CloudPosture", "StorageAccounts"])
    EntraPermissionsManagement                  = tolist(["CloudPosture"])
  }
  plans_without_databases = contains(var.mdc_plans_list, "Databases") ? setsubtract(setunion(var.mdc_plans_list, var.mdc_databases_plans), ["Databases"]) : var.mdc_plans_list
}
