extends Control

@onready var color_rect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_menu_pressed():
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	t.tween_property(color_rect, "color", Color.BLACK, 1)
	await t.finished
	get_tree().change_scene_to_file("res://Menu/MainMenu.tscn")
	pass # Replace with function body.
