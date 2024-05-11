extends ColorRect

func _ready():
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	t.tween_property(self, "color", Color.TRANSPARENT, 0.5)
	await t.finished
	
	pass
