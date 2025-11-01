Feature: Restrict VM sizes
  Only certain VM sizes should be used!

  Scenario: Ensure Azure VMs use allowed sizes
    Given I have resource that supports vm_size
    When its vm_size is not in ["Standard_B2s", "Standard_D2s_v3"]
    Then fail
