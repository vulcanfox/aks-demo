Feature: No deployments on Fridays
  We do not allow Terraform applies on Fridays! Protect your weekend, friend.

  Scenario: Prevent deployments on Fridays
    Given I have azurerm_* resource
    Then I execute command "date +%u" and the output is not "5"
