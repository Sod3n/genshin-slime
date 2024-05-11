extends Node


func _unhandled_input(_event: InputEvent) -> void:
	
	get_viewport().set_input_as_handled()


