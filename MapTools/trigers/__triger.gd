extends Area3D

@export var active = true

@export var entered = false
@export var exited = false

@export var body_group = ""
@export var body_name = ""
@export var killing = false

@export var auto_off_active = false

var func_active = func():
	print("WORK")
	pass

func _ready():
	connect("body_entered", body_entered)
	connect("body_exited", body_exited)

func body_entered(body):
	if body.name == body_name:
		func_active
	if body.is_in_group(body_group):
		func_active
	if killing: queue_free()

func body_exited(body):
	if body.name == body_name:
		func_active
	if body.is_in_group(body_group):
		func_active
	if killing: queue_free()
