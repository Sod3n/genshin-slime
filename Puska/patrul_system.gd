extends Node

@export var time_stay = 3

@onready var mob = get_parent()

@onready var point_list = []

var current_point = -1
var timer

func _ready():
	for ch in get_children(): 
		point_list.append(ch.global_position)
	
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", time_out)
	timer.one_shot = true
	
	timer.start(time_stay)
	
func _physics_process(delta):
	if mob.is_in_move_point():
		mob.moving = false
		if timer.is_stopped(): timer.start(time_stay)

func next_point():
	current_point+=1
	if current_point==len(point_list): current_point = 0
	mob.set_move_point(point_list[current_point])
	mob.moving = true
	timer.stop()


func time_out():
	next_point()
