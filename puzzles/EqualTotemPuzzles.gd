extends Node3D

signal on_puzzle_satisfie

@export var totems : Array[Node]
@export var target_state = 1

func _ready():
	for T in totems:
		T.connect("on_state_changed", Callable(self, "on_state_changed"))

func on_state_changed():
	var satisfie = true
	for T in totems:
		if target_state != T.state:
			satisfie = false
	if satisfie:
		on_puzzle_satisfie.emit()
		deactivate()

func deactivate():
	for T in totems:
		T.active = false
		
func activate():
	print("active")
	for T in totems:
		T.active = true
