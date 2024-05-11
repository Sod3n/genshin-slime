extends Quest



func start():
	InventoryInstance.value.create_and_add_item_at("key", Vector2i(0, 0))
	pass

func update():
	objective_completed = true
	QuestSystem.complete_quest(self)

func get_progress() -> String:
	return ""

func complete():
	pass

