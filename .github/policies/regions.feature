Feature: Restrict allowed Azure regions
  In order to comply with company policy
  Only specific regions should be used!

  Scenario: Ensure resources are deployed only in approved regions
    Given I have resource that supports location
    When its location is not in ["eastus", "westeurope"]
    Then fail
