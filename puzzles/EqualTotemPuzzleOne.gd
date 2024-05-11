extends "res://puzzles/EqualTotemPuzzles.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	Signals.on_puzzle_quest_start.connect(Callable(self, "activate"))
	Signals.on_puzzle_quest_stop.connect(Callable(self, "deactivate"))
	self.on_puzzle_satisfie.connect(Callable(self, "_stop_quest"))
	deactivate()

func _stop_quest():
	print("stop")
	Shortcuts.update_quest("solve_puzzle")
