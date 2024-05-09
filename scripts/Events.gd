extends Node

var data = {}

func add_data(data_name, value):
	data[data_name] = value

func has_data(data_name):
	return data.has(data_name)

func get_data(data_name):
	if has_data(data_name): return data[data_name]
	else: return null
