extends ColorRect


func _ready():
	Shortcuts.fade_in.connect(fade_in)
	Shortcuts.fade_out.connect(fade_out)

func fade_in():
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	t.tween_property(self, "modulate:a", 1, 2)
	await t.finished
	Shortcuts.faded_in.emit()

func fade_out():
	var t = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_LINEAR)
	t.tween_property(self, "modulate:a", 0, 2)
	await t.finished
	Shortcuts.faded_out.emit()
