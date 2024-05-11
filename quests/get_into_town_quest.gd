extends Quest


func start():
	pass

func update():
	objective_completed = true
	QuestSystem.complete_quest(self)
	#QuestSystem.start_quest(RETURN_TO_NPC)

func get_progress() -> String:
	return ""

func complete():
	pass

