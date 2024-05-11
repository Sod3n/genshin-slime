extends Quest

const GET_INTO_TOWN = preload("res://quests/get_into_town.tres")

func start():
	pass

func update():
	objective_completed = true
	QuestSystem.complete_quest(self)
	QuestSystem.start_quest(GET_INTO_TOWN)
	State.is_key_finded = true

func get_progress() -> String:
	return ""

func complete():
	pass

