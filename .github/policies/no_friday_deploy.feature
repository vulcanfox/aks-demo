Feature: No deployments on Fridays
  We do not allow Terraform applies on Fridays! Protect your weekend, friend.

  Scenario: Prevent deployments on Fridays
    Given I have resource that supports name
    Then I execute command "date +%u" and the output is not "5"
