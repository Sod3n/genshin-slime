extends Area3D

const Balloon = preload("res://QuestsNDialogue/dialogue/balloon.tscn")
const MainDialogue = preload("res://QuestsNDialogue/dialogue/main.dialogue")
@onready var test_item = $".."
@onready var inventory_item = $"./item"
@onready var collision_shape_3d = $"./CollisionShape3D"

@export var update_quest : Quest
@export var is_destroy_on_pick_up : bool


func action() -> void:
	if update_quest != null and not QuestSystem.is_quest_active(update_quest):
		return
	print(inventory_item)
	var free_space = InventoryInstance.value.find_free_place(inventory_item)
	
	if free_space.success:
		InventoryInstance.value.create_and_add_item_at(inventory_item.prototype_id, free_space.position)
		if update_quest != null:
			update_quest.update()
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(MainDialogue, "collect_item")
		if is_destroy_on_pick_up:
			disable()
	else:
		var balloon: Node = Balloon.instantiate()
		get_tree().current_scene.add_child(balloon)
		balloon.start(MainDialogue, "not_enough_space")

func disable():
	collision_shape_3d.disabled = true
	hide()

func enable():
	collision_shape_3d.disabled = false
	show()
