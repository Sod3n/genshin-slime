extends Control

@onready var color_rect = $ColorRect
@onready var audio = $AudioStreamPlayer


func _on_button_pressed():
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	t.parallel()
	t.tween_property(color_rect, "color", Color.BLACK, 2)
	t.tween_property(audio, "volume_db", -100, 1.5)
	await t.finished
	SceneManagment.switch_scene("map_1")
