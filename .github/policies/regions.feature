Feature: Restrict allowed Azure regions
  In order to comply with company policy
  Only specific regions should be used!

  Scenario: AKS clusters must be deployed in allowed regions only
  Given I have azurerm_kubernetes_cluster defined
  Then it must contain location
  And its value must match the "(eastus|uksouth|ukwest)" regex
