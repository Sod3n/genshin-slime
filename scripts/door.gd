extends Node3D

@export var state_variable : String
@onready var opened = $Opened
@onready var closed = $Closed
@onready var opened_collision_shape_3d = $Opened/CollisionShape3D
@onready var closed_collision_shape_3d = $Closed/CollisionShape3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(State.get(state_variable))
	if State.get(state_variable):
		if opened_collision_shape_3d != null:
			opened_collision_shape_3d.disabled = false
		opened.show()
		closed_collision_shape_3d.disabled = true
		closed.hide()
	else:
		closed_collision_shape_3d.disabled = false
		closed.show()
		if opened_collision_shape_3d != null:
			opened_collision_shape_3d.disabled = true
		opened.hide()
