#outputs designate which data to display
output "resource_group_id" {  value = azurerm_resource_group.rg.id}
# this defines an ourpur variable called resource_group_id 
# the name of the variable must conform to Terraform variable namimg conventions if it is to be used as an input to other modules
# value field specifieces value, the id attribute of your resource group