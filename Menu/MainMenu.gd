extends Control

@onready var color_rect = $ColorRect


func _on_button_pressed():
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	t.tween_property(color_rect, "color", Color.BLACK, 1)
	await t.finished
	SceneManagment.switch_scene("map_1")
