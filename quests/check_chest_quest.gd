extends Quest



func start():
	var item = InventoryInstance.value.create_and_add_item_at("key", Vector2i(0, 0))
	print("key")
	print(item)
	pass

func update():
	objective_completed = true
	QuestSystem.complete_quest(self)

func get_progress() -> String:
	return ""

func complete():
	pass

