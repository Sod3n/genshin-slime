extends Node

signal change_scene(data)

var maps = {
	"test" : "res://maps/test_room.tscn",
	"map_1" : "res://maps/Bereg_lvl1.tscn",
	"mon" : "res://maps/monolog.tscn",
	"end" : "res://Menu/EndMenu.tscn"
}

@onready var current_map = get_tree().current_scene.name

func switch_scene(name_scene):
	get_tree().change_scene_to_file(maps[name_scene])
