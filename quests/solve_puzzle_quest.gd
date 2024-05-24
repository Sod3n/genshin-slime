extends Quest



func start():
	Signals.on_puzzle_quest_start.emit()
	print("start")
	pass

func update():
	objective_completed = true
	QuestSystem.complete_quest(self)
	complete()

func get_progress() -> String:
	return ""

func complete():
	Signals.on_puzzle_quest_stop.emit()
	pass

