extends Node

signal game_saving(data)
signal game_loading(data)

var data = {
	
}

func add_data(name, value):
	data[name] = value

func save_data():
	game_saving.emit()
	data["name_map"] = get_tree().current_scene.name
	print(data)


func load_data():
	game_loading.emit()
