extends Quest

func start():
	pass

func update():
	objective_completed = true
	QuestSystem.quest_completed.connect(spritn)
	print(Shortcuts.is_quest_active("get_into_town"))
	Shortcuts.complete_quest("get_into_town")
	print("update", Shortcuts.is_quest_completed("get_into_town"))
	#QuestSystem.start_quest(RETURN_TO_NPC)

func spritn(quest: Quest):
	print("update2", Shortcuts.is_quest_completed("get_into_town"))

func get_progress() -> String:
	return ""

func complete():
	pass

