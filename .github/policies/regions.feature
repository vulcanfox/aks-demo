Feature: Restrict allowed Azure regions
  In order to comply with company policy
  Only specific regions should be used!

  Scenario: Generic VMs must be deployed in allowed regions only
  Given I have azurerm_virtual_machine defined
  Then it must contain location
  And its value must match the "(uksouth|ukwest)" regex
