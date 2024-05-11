extends Node

const PATH_MAPS = "res://maps/"

var save_scene = null

var data_events = {} # для квестов, ивентов и пр.



func save():
	save_scene = get_tree().current_scene.duplicate()
	print(save_scene)
	
func load():
	get_tree().unload_current_scene()
