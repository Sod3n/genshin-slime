extends Node

signal change_scene(data)

var maps = {
	"test" : "res://maps/test_room.tscn" 
}

@onready var current_map = get_tree().current_scene.name

func switch_scene(name_scene):
	await change_scene
	get_tree().change_scene_to_file(name_scene)
