extends CharacterBody3D

@onready var agent = $NavigationAgent3D

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const GRAV = 100

var moving = false
var move_point = Vector3()

func set_move_point(pos):
	agent.target_position = pos
	
func get_move_point():
	return agent.target_position

func is_in_move_point():
	print(global_position.distance_to(agent.target_position))
	return global_position.distance_to(agent.target_position)<5

func _physics_process(delta):
	
	if not is_on_floor():
		velocity.y -= GRAV * delta
	
	var direction = Vector3()
	agent.target_position
	
	direction = agent.get_next_path_position() - global_position
	direction = direction.normalized()
	
	velocity = direction * SPEED
	
	move_and_slide()
