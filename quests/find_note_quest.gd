extends Quest

func start():
	pass

func update():
	objective_completed = true
	Shortcuts.complete_quest("find_note")
	State.arena_opened = false

func get_progress() -> String:
	return ""

func complete():
	pass

