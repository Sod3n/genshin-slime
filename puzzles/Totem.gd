extends StaticBody3D

signal on_state_changed

@export var totems : Array[Node]

@export var state_number : int
@export var state : int

@onready var state_0 = $State0
@onready var state_1 = $State1
@onready var state_2 = $State2

var active = true

func _ready():
	show_state()

func change_state():
	if not active:
		return
	
	next_state()
	for T in totems:
		T.next_state()
	on_state_changed.emit()

func next_state():
	state += 1
	if state == state_number:
		state = 0
	show_state()

func show_state():
	if state == 0:
		state_0.show()
		state_1.hide()
		state_2.hide()
	if state == 1:
		state_0.hide()
		state_1.show()
		state_2.hide()
	if state == 2:
		state_0.hide()
		state_1.hide()
		state_2.show()


func _on_area_3d_on_action():
	change_state()
