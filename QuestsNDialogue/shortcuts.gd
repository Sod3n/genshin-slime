extends Node

const QUEST_PATH: String = "res://quests/%s.tres"
const ITEM_DEFINITIONS_GRID = preload("res://tests/data/item_definitions_grid.tres")

func get_quest(quest_name: String) -> Quest:
	var quest: Quest = ResourceLoader.load(QUEST_PATH % quest_name, "Quest")
	push_warning(quest, quest_name)
	if not quest:
		quest = ResourceLoader.load(QUEST_PATH % quest_name, "Quest")
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
	
func clear_inventory():
	InventoryInstance.value.clear()

func add_item_to_inventory(item_id : String):
	var item = InventoryItem.new()
	item.protoset = ITEM_DEFINITIONS_GRID
	item.prototype_id = item_id
	var free_space = InventoryInstance.value.find_free_place(item)
	if free_space.success:
		InventoryInstance.value.create_and_add_item_at(item.prototype_id, free_space.position)
		return true
	return false
	
func change_scene(scene : String):
	Shortcuts.fade_in.emit()
	await Signal(Shortcuts.faded_in)
	SceneManagment.switch_scene(scene)

signal set_sound_index(index)

signal start_compfire_sound()


signal fade_in()
signal faded_in()
signal fade_out()
signal faded_out()
