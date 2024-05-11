extends Node

const QUEST_PATH: String = "res://quests/%s.tres"

func get_quest(quest_name: String) -> Quest:
	var quest: Quest = ResourceLoader.load(QUEST_PATH % quest_name, "Quest")
	return quest

func start_quest(quest_name: String) -> void:
	var quest: Quest = get_quest(quest_name)
	if quest == null: return
	QuestSystem.start_quest(quest)

func complete_quest(quest_name: String) -> void:
	var quest: Quest = get_quest(quest_name)
	if quest == null: return
	QuestSystem.complete_quest(quest)

func update_quest(quest_name: String) -> void:
	var quest: Quest = get_quest(quest_name)
	if quest == null: return
	quest.update()

func is_quest_completed(quest_name: String) -> bool:
	var quest: Quest = get_quest(quest_name)
	if quest == null: return false
	return QuestSystem.is_quest_completed(quest)

func is_quest_active(quest_name: String) -> bool:
	var quest: Quest = get_quest(quest_name)
	if quest == null: return false
	return QuestSystem.is_quest_active(quest)
	
func remove_items(prototype_id : String) -> int:
	var items = InventoryInstance.value.get_items_by_id(prototype_id)
	var removed = 0
	for I in items:
		if InventoryInstance.value.remove_item(I):
			removed += 1
	return removed
