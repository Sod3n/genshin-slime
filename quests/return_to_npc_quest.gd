extends Quest

func start():
	pass


func update():
	objective_completed = true

func complete():
	State.book_status = "gave"

func get_progress() -> String:
	return ""
