extends Node3D


const Balloon = preload("res://QuestsNDialogue/dialogue/balloon.tscn")


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

const SCENE_1_QUEST_1 = preload("res://QuestsNDialogue/dialogue/scene_1_quest_1.dialogue")

func _ready():
	var balloon: Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	
	balloon.start(SCENE_1_QUEST_1, "monolog")
	balloon.on_end.connect(switch_scene)
	
func switch_scene():
	SceneManagment.switch_scene("map_1")
