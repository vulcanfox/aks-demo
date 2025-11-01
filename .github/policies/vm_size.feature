Feature: Restrict VM sizes
  Only certain VM sizes should be used!

  Scenario: AKS default node pool must use allowed VM sizes
    Given I have azurerm_kubernetes_cluster defined
    When it has default_node_pool
    Then it must contain vm_size
    And its value must be in ["Standard_B2s", "Standard_D2s_v3"]

