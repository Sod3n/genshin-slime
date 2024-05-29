extends Quest

func start():
	pass


func update():
	objective_completed = true
	QuestSystem.complete_quest(self)

func complete():
	pass

func get_progress() -> String:
	return ""
