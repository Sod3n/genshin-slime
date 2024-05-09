extends Area3D

@export var inventory_item : InventoryItem

func action() -> void:
	var free_space = InventoryInstance.value.find_free_place(inventory_item)
	if free_space.success:
		InventoryInstance.value.create_and_add_item_at(inventory_item.prototype_id, free_space.position)
	else:
		print("Not enougth space")
