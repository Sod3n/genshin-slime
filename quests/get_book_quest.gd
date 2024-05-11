extends Quest

const RETURN_TO_NPC = preload("res://quests/return_to_npc.tres")
func start():
	pass

func _update_objective() -> void:
	objective_completed = !objective_completed

func update():
	if State.book_count < 2:
		State.book_count += 1
	else:
		State.book_count += 1
		State.book_status = "has"
		objective_completed = true
		QuestSystem.complete_quest(self)
		QuestSystem.start_quest(RETURN_TO_NPC)

func get_progress() -> String:
	return "%s/3" % State.book_count

func complete():
	pass

