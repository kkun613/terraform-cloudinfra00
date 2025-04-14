resource "azurerm_monitor_autoscale_setting" "ysjang_as" {
  name                = "ysjang-as"
  resource_group_name = azurerm_resource_group.ysjang_rg.name
  location            = azurerm_resource_group.ysjang_rg.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.ysjang_vmss.id
  enabled = true
  profile {
    name = "ysjang-as-profile"
    capacity {
      default = 1
      minimum = 1
      maximum = 6
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.ysjang_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 70
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.ysjang_vmss.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 20
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT5M"
      }
    }
  }
}
