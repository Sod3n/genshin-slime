extends Area3D

@onready var inventory_item = $"./item"

func action() -> void:
	var item = InventoryInstance.value.get_item_by_id(inventory_item.prototype_id)
	print(inventory_item, InventoryInstance.value.has_item(item))
	if InventoryInstance.value.remove_item(item):
		print("You passed!")
	else:
		print("You shall not pass!")
