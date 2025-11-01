Feature: Restrict VM sizes
  Only certain VM sizes should be used!

  Scenario: Ensure generic Azure VMs use allowed sizes
    Given I have azurerm_virtual_machine defined
    Then it must contain size
    And its value must be in ["Standard_B2s", "Standard_D2s_v3"]
