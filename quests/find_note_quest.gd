extends Quest

func start():
	pass

func update():
	objective_completed = true
	Shortcuts.complete_quest("find_note")

func get_progress() -> String:
	return ""

func complete():
	pass

